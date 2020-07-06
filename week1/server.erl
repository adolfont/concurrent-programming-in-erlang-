-module(server).

-export([run/1]).

run(Client) ->
    receive
      {check, Text} ->
          Client ! {result, palin:palindrome_answer(Text)},
          run(Client);
      _Msg ->
          Client ! io:format("stopped~n")
    end.

