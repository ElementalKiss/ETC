-module(lib_misc).
-export([sum/1, sum/2, max/2]).

% ���������� �� ���α׷��ӵ���
% ������ �̸��� �ָ�Ƽ�� �ٸ� �Լ��� ����(auxiliary)�Լ��� ����Ѵ�.
sum(L) -> sum(L, 0).

sum([], N) -> N;
sum([H|T], N) -> sum(T, H+N).

% sum(L)�� sum/2�� ���� ��ƾ�� ����Ѵ�.

max(X, Y) when is_integer(X), X > Y -> X;
max(X, Y) -> Y.

