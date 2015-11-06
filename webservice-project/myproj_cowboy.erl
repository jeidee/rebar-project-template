-module({{projectid}}_cowboy).

-export([
	 start_link/0
	]).

start_link() ->
	{ok, Port} = application:get_env({{projectid}}, port),
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", {{projectid}}_cowboy_default, []}
		]}
	]),
	{ok, Pid} = cowboy:start_http(http, 100, [{port, Port}], [
		{env, [{dispatch, Dispatch}]}
	]),
	{ok, Pid}.
