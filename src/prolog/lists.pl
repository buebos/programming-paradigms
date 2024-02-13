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
