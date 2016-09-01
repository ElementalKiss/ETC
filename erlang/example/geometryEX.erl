-module(geometryEX).
-export([area/1]).
% area 함수는 2개의 절로 구분된다.
% 함수는 여러개의 절로 될 수 있으며 ;로 구분하고
% 마지막 절은 .으로 마친다.

% 일반적인 모양 : funcationName ({pattern}) -> statement

area({rectangle, Width, Ht}) -> Width*Ht;
area({circle, R}) -> 3.14*R*R;
area({square, X}) -> X*X.

% 확장이 용이하다.