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
/* room without doors  */
room(lost).

door(1).
door(2).
door(3).
door(4).
door(5).
door(6).
door(7).
door(8).
door(9).
door(10).
door(11).
door(12).
door(13).

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

removeHead([_|Tail], Tail).

minimal([F|R], M) :- min(R,F, M).
% minimal path
min([],M,M).
min([[P,L]|R],[_,M],Min) :- L < M, !, min(R,[P,L],Min). 
min([_|R],M,Min) :- min(R,M,Min).

co(X,L) :- co(X,[],L).

co([],A,A).
co([X|Xs], A, L) :- p(X-Z,A,R), !, Z1 is Z+1, co(Xs, [X-Z1|R], L). 
co([X|Xs], A, L) :- co(Xs, [X-1|A], L). 

p(X-Y,[X-Y|R],R):- !.
p(X,[H|Y], [H|Z]) :- p(X,Y,Z).

startGame(StartRoom) :-
  gameLoop(StartRoom,[],[[7,8,1], [7,8,1,13,9],[7,8,1,13,9,5,10],[7,8,1,13,9,5,10,2,11],[7,8,1,13,9,5,10,2,11,1,12]],[[e, i],[c,d],[b,j],[a,k],[h,h]])
  .

gameLoop(CurrentRoom,VisitedRooms, OpenDoors, GuardsPositions) :-
  con(CurrentRoom,NextRoom,Door),
  member(Door,[_|OpenDoors]),
  not(member(NextRoom,GuardsPositions)),
  not(member(NextRoom, VisitedRooms)),
  (
    exit = NextRoom
  ;
    removeHead(GuardsPositions, NewGuardsPositions),
    removeHead(OpenDoors, NewOpenDoors),
    gameLoop(NextRoom,[CurrentRoom|VisitedRooms], NewOpenDoors, NewGuardsPositions)
  )
.
