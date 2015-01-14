-module(day_one).
-export([count_words/1]).
-export([count_to_ten/0]).
-export([is_error/1]).
-export([map/2]).
-export([is_whitespace/1]).
-export([remove_duplicate_neighbours/1]).


map(F, [H|T]) -> [F(H) | map(F, T)];
map(_F, []) -> [].

is_whitespace(32) -> 0;
is_whitespace(_) -> 1.

remove_duplicate_neighbours([]) -> [];
remove_duplicate_neighbours([V]) -> [V];
remove_duplicate_neighbours([V | [V|Tail]]) -> remove_duplicate_neighbours([V | Tail]);
remove_duplicate_neighbours([V | [X|Tail]]) -> [V | remove_duplicate_neighbours([X|Tail])].

sum([]) -> 0;
sum([H | T]) -> H + sum(T).

count_words([]) -> 0;
count_words(S) -> sum(remove_duplicate_neighbours(map(fun is_whitespace/1, S))).


count_to_ten(0) -> 0;
count_to_ten(N) -> 1 + count_to_ten(N-1).

count_to_ten() -> count_to_ten(10).

is_error(success) -> "success";
is_error({error, Message}) -> "error: " ++ Message.
