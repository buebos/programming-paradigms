find(X, [X|_]).
find(X, [_|R]):- find(X, R).

% length of empty list is 0 (base case)
get_list_length([], 0).
get_list_length([_ | L], N) :-
    get_list_length(L, N1),
    N is N1 + 1.   

concat([], L, L).
concat([X|R], L, [X|Q]):- concat(R, L, Q).
