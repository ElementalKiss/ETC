-module(geometryEX).
-export([area/1]).
% area �Լ��� 2���� ���� ���еȴ�.
% �Լ��� �������� ���� �� �� ������ ;�� �����ϰ�
% ������ ���� .���� ��ģ��.

% �Ϲ����� ��� : funcationName ({pattern}) -> statement

area({rectangle, Width, Ht}) -> Width*Ht;
area({circle, R}) -> 3.14*R*R;
area({square, X}) -> X*X.

% Ȯ���� �����ϴ�.