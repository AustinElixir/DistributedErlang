-module(factorial).
-compile(export_all).

start() ->
	spawn(?MODULE, init, []).

init() ->
	register(facserve, self()),
	facLoop().

facLoop() ->
	receive
		{Pid, N} ->
			Pid ! {ok, node(), calc(N)};
		exit ->
			exit(normal);
		_ ->
			unknown
	end,
	facLoop().

calc(0) -> 0;
calc(N) when N > 0 ->
	N + calc(N - 1).