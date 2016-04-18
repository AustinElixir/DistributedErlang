-module(triangular).
-compile(export_all).

start() ->
	spawn(?MODULE, init, []).

init() ->
	register(triserve, self()),
	triLoop().

triLoop() ->
	receive
		{Pid, N} ->
			Pid ! {ok, triangular:calc(N)};
		exit ->
			exit(normal);
		_ ->
			unknown
	end,
	triangular:triLoop().

calc(N) -> calc(N, 0).

calc(0, Acc) -> Acc;
calc(N, Acc) when N > 0 -> 
	calc(N - 1, Acc + N).