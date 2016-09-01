-module(lib_misc).
-export([sum/1, sum/2, max/2]).

% 관례적으로 얼랭 프로그래머들은
% 동일한 이름에 애리티가 다른 함수를 보조(auxiliary)함수로 사용한다.
sum(L) -> sum(L, 0).

sum([], N) -> N;
sum([H|T], N) -> sum(T, H+N).

% sum(L)은 sum/2의 보조 루틴을 사용한다.

max(X, Y) when is_integer(X), X > Y -> X;
max(X, Y) -> Y.

