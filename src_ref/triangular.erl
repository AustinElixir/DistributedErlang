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
			Pid ! {ok, node(), calc(N)};
		exit ->
			exit(normal);
		_ ->
			unknown
	end,
	triLoop().

calc(0) -> 0;
calc(N) when N > 0 ->
	N + calc(N - 1).