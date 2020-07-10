-module(server).

-export([run/0]).

run() ->
    receive
      {Client, check, Text} ->
          io:format("Server received check message\n"),
          Client ! {result, palin:palindrome_answer(Text)},
          run();
      _Msg ->
          io:format("stopped~n")
    end.

