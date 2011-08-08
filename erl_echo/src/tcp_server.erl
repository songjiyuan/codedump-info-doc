-module(tcp_server).

-export([start/0, stop/0 ]).

start() ->
  application:start(tcp_server).

stop() ->
  application:stop(tcp_server).
