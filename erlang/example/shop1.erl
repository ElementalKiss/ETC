-module(shop1).
-export([total/1]).

total([{What, N}|T]) -> shop:cost(What) * N + total(T);
total([]) -> 0.

% 예시 shop1:total([{pears, 6}, {milk, 3}]).
% 첫 번째 절에서 What |-> pears로 T |-> {[milk,3]}으로 매치된다.
% 식은 show:cost(pears) * 6 + total([{milk, 3}])으로
% 되므로 순차적으로 계산된다.