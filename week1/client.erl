-module(client).

-export([run/0]).

run() ->
    receive
      {result, Result} ->
          io:fwrite("Just received this from server: \n"),
          io:format("~s\n", [Result]),
          run()
    end.

