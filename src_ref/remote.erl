-module(remote).
-compile([export_all]).

call(Pid, Node, Message) ->
	monitor_node(Node, true),
	{Pid, Node} ! {self(), Message},
	receive
		{ok, Res} ->
			monitor_node(Node, false),
			Res;
		{nodedown, Node} ->
			{error, node_down}
		after 1000 ->
			{error, timeout}
	end.