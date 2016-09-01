-module(shop).
-export([cost/1]).

% shopping list
cost(orange) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.