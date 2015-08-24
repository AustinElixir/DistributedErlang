-module(cluster).
-compile(export_all).
%%% These functions are only useful for class instruction
%%% The overall distribution techniques demonstrated here would need a lot of improvement

connect() -> net_adm:ping('bar@10.1.5.149'),
			 seed(),
			 factorial:start().

seed() -> random:seed( erlang:phash2([node()]),
	              	   erlang:monotonic_time(),
		               erlang:unique_integer() ).

rand() -> random:uniform(100).

%% Count my messages in the inbox
count_messages() ->
	{messages, List} = process_info(self(), messages),
	erlang:length(List).

%% Count messages but also flush
count_flush() -> count_flush(0).
count_flush(N) ->
	receive
	    _ -> count_flush(N + 1)
	after 0 ->
	    {ok, N}
	end.

%% Very simplistic examples of some routing algorithms - don't use in production
%% Random Distribution
dist_random(0) -> ok;
dist_random(N) when N > 0 ->
	Rand = random:uniform( erlang:length(nodes()) ),
	Node = lists:nth(Rand, nodes()),
	send_message(Node),
	dist_random(N - 1).

%% Round Robin Distribution
dist_rr(N) when N > 0 -> dist_rr(N, nodes()).
dist_rr(0, _Nodes) -> ok;
dist_rr(N, [Node|Rest]) ->
	send_message(Node),
	dist_rr(N - 1, Rest ++ [Node]).
	
%% Send a message to a node
send_message(Node) ->
	{facserve, Node} ! {self(), rand()}.