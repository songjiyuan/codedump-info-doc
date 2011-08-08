-module(tcp_connection_sup).
-behaviour(supervisor).

-export([start_link/1, init/1]).

start_link({M, F, A}) ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, [M, F, A]).

%init() ->
 % {ok, {{simple_one_for_one, 0, 1},
 % [{client, {echo_connection, start_link, []},
 % temporary, brutal_kill, worker, [echo_connection]}]}}. 

init([M, F, A]) ->
  {ok, {{simple_one_for_one, 0, 1},
  %[{client, {echo_connection, start_link, []},
  %temporary, brutal_kill, worker, [echo_connection]}]}}. 
  [{M, {M, F, A}, temporary, brutal_kill, worker, [M]}]}}. 
