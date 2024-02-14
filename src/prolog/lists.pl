find(X, [X|_]).
find(X, [_|R]):- find(X, R).

% length of empty list is 0 (base case)
get_list_length([], 0).
get_list_length([_ | L], N) :-
    get_list_length(L, N1),
    N is N1 + 1.   

concat([], L, L).
concat([X|R], L, [X|Q]):- concat(R, L, Q).

double([], []).
double([X|R], [X, X|Q]):- double(R, Q).

% It's like a tree, it goes into the reverse relation
% recursively (going until the leaf of the branch) and
% then goes into the concat relation parallel to each
% call starting to concat the last element with an empty
% list and forwarding it to the previous node. Then that
% node concats the incoming list with the X value that was
% separated. The concat calls also are kinda recursive.

% Reverse relation branch    /*\
%                           /   \ Concat relation branch
%                          *     *
%                         / \    ...
%                        ... ...


reverse([], []).
reverse([X|R], L) :- reverse(R, Q), concat(Q, [X], L).

sum([], 0).
sum([X|R], S) :- sum(R, SUM), S is SUM + X.

duplicate([], []).
duplicate([X|R], [X,X|Q]) :- duplicate(R, Q).

% Reverses and then duplicates the list
revdup(INPUT, RESULT) :- reverse(INPUT, REVERSED), duplicate(REVERSED, RESULT).

filter(_, [], []).
filter(X, [X|R], Q) :- filter(X, R, Q).
filter(X, [Y|R], [Y|Q]) :- filter(X, R, Q).

split_evens([], [], []).
split_evens([X|R], [X|EVENS], ODDS) :- 0 is X mod 2, split_evens(R, EVENS, ODDS).
split_evens([X|R], EVENS, [X|ODDS]) :- split_evens(R, EVENS, ODDS).
