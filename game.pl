room(a).
room(b).
room(c).
room(d).
room(e).
room(f).
room(g).
room(h).
room(i).
room(j).
room(k).
/* room without doors */
room(lost).

door(true, 1).
door(true, 2).
door(true, 3).
door(true, 4).
door(true, 5).
door(true, 6).
door(true, 7).
door(true, 8).
door(true, 9).
door(true, 10).
door(true, 11).
door(true, 12).
door(true, 13).

con(a,b, 1).
con(b,a, 1).

con(b,c, 2).
con(c,b, 2).

con(c,d, 3).
con(d,c, 3).

con(c,f, 4).
con(f,c, 4).

con(c,e, 5).
con(e,c, 5).

con(c,g, 6).
con(g,c, 6).

con(a,h, 7).
con(h,a, 7).

con(a,h, 8).
con(h,a, 8).

con(d,i, 9).
con(i,d, 9).

con(d,j, 10).
con(j,d, 10).

con(j,k, 11).
con(k,j, 11).

con(k,h, 12).
con(h,k, 12).

con(e,exit,13).



/*
findwayout(e).

findwayout(FromRoom):-
    con(FromRoom,ToRoom,Door),
    door(true,Door),
    findwayout(ToRoom).
*/
findwayout(A) :-   % two nodes are connected, if
  walk(A,[])       % - if we can walk from one to the other,
  .                % first seeding the visited list with the empty list

walk(A,V) :-       % we can walk from A to B...
  con(A,X,Door),
  door(true,Door),                   % - if A is connected to X, and
  not(member(X,V)), % - we haven't yet visited X, and
  (                  % - either
    exit = X            %   - X is the desired destination
  ;                  %   OR
    walk(X,[A|V])  %   - we can get to it from X
  )                  %
  .                  % Easy!

