-module(try_test).
-export([gen_excpt/1, demo/0, demo2/0, demo3/0]).

gen_excpt(1) -> a;
gen_excpt(2) -> throw(a);
gen_excpt(3) -> exit(a);
gen_excpt(4) -> {'EXIT', a};
gen_excpt(5) -> erlang:error(a).

demo() -> [catcher(I) || I <- [1,2,3,4,5]].

catcher(N) ->
	try gen_excpt(N) of
		Val -> {N, normal, Val}
	catch
		throw:X -> {N, caught, thrown, X};
		exit:X -> {N, caught, exited, X};
		error:X -> {N, caught, error, X}
	end.
	
% result
% 8> c(try_test).
% {ok,try_test}
% 9> try_test:demo().
% [{1,normal,a},
% {2,caught,thrown,a}
% {3,caught,exited,a}
% {4,normal,{'EXIT',a
% {5,caught,error,a}]

demo2() -> [{I, (catch gen_excpt(I))} || I <- [1,2,3,4,5]].

% result2
% 4> c(try_test).
% {ok,try_test}
% 5> try_test:demo2().
% [{1,a},
%  {2,a},
%  {3,{'EXIT',a}},
%  {4,{'EXIT',a}},
%  {5,
%   {'EXIT',{a,[{try_test,gen_excpt,1,
%                        [{file,"try_test.erl"},{line,8}]},
%              {try_test,'-demo2/0-lc$^0/1-0-',1,
%                        [{file,"try_test.erl"},{line,31}]},
%              {try_test,'-demo2/0-lc$^0/1-0-',1,
%                        [{file,"try_test.erl"},{line,31}]},
%              {erl_eval,do_apply,6,[{file,"erl_eval.erl"},{line,673}]},
%              {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
%              {shell,eval_exprs,7,[{file,"shell.erl"},{line,641}]},
%              {shell,eval_loop,3,[{file,"shell.erl"},{line,626}]}]}}}]

demo3() ->
	try gen_excpt(5)
	catch error:X ->
		{X, erlang:get_stacktrace()}
	end.
	
% 7> c(try_test).
% {ok,try_test}
% 8> try_test:demo3().
% {a,[{try_test,gen_excpt,1,[{file,"try_test.erl"},{line,8}]},
%     {try_test,demo3,0,[{file,"try_test.erl"},{line,54}]},
%     {erl_eval,do_apply,6,[{file,"erl_eval.erl"},{line,673}]},
%     {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
%     {shell,eval_exprs,7,[{file,"shell.erl"},{line,641}]},
%     {shell,eval_loop,3,[{file,"shell.erl"},{line,626}]}]}
% 9>	