-module(mylists).
-export([sum/1, map/2]).

sum([H|T]) -> H+sum(T); % 1
sum([]) -> 0.           % 2

% sum([1,3,10]) 과정
% 1 + sum([3,10]) 1에 의해 실행
% 1 + 3 + sum([10]) 1에 의해 실행
% 1 + 3 + 10 + sum([]) 1에 의해 실행
% 1 + 3 + 10 + 0 2에 의해 실행

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].