% Tree definition
father(john, mike).
father(mike, luke).
father(mike, michelle).

% Search given a few arguments
ancester(ANCESTER, CHILD):- father(ANCESTER, CHILD); father(ANCESTER, INTER), father(INTER, CHILD).

rect(A, B, RESULT):- RESULT is A*B.

% Shortcut and optimization for below
% and(1, 1, 1).
% and(_, _, 0).
and(1, 1, 1).
and(1, 0, 0).
and(0, 1, 0).
and(1, 0, 0).

% Shortcut and optimization for below
% or(0, 0, 0).
% or(_, _, 1).
or(1, 1, 1).
or(1, 0, 1).
or(0, 1, 1).
or(0, 0, 0).

circuit(A, B, C, Z):- and(A, B, D), or(B, C, E), and(D, E, Z).
