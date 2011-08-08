-module(tcp_server_sup).
-behaviour(supervisor).

-export([start_link/0, init/1, start_child/7]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init(_Args) ->
  TcpListenerSupChild = {tcp_listener_sup,
    {tcp_listener_sup, start_link, []},
    temporary, brutal_kill, supervisor, [tcp_listener_sup]},
  SupFlags = {simple_one_for_one, 0, 1},

  {ok, {SupFlags, [TcpListenerSupChild]}}.

start_child(IpAddress, Port, Options,
	    OnStart, OnStop, AcceptCallback, Label) ->
  {ok,_} = supervisor:start_child(?MODULE,
	[IpAddress, Port, Options,
	 OnStart, OnStop, AcceptCallback, Label]).
