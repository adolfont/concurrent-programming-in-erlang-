-module(palin).
-export([palindrome_answer/1,  pal_check/1, palindrome_check/1, rem_punct/1, to_small/1]).

palindrome_answer(Text) ->
   palindrome_answer(Text, palindrome_check(Text)).

palindrome_answer(Text, true) ->
  lists:flatten(io_lib:format("\"~s\" is a palindrome", [Text]) );
palindrome_answer(Text, false) ->
  lists:flatten(io_lib:format("\"~s\" is not a palindrome", [Text]) ).

% code taken from the course
pal_check(String) -> String==lists:reverse(String).

% code taken from the course
rem_punct(String) -> lists:filter(fun (Ch) ->
                                      not(lists:member(Ch,"\"\'\t\n "))
                                    end,
                                    String).

% code taken from the course
to_small(String) -> lists:map(fun(Ch) ->
                                  case ($A =< Ch andalso Ch =< $Z) of
                                      true -> Ch+32;
                                      false -> Ch
                                   end
                                 end,
                                 String).

% code taken from the course
palindrome_check(String) ->
    Normalise = to_small(rem_punct(String)),
    lists:reverse(Normalise) == Normalise.


