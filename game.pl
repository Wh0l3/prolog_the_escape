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

startGame(StartRoom) :-
  gameLoop(StartRoom,[],[[7,8,1], [7,8,1,13,9],[7,8,1,13,9,5,10],[7,8,1,13,9,5,10,2,11],[7,8,1,13,9,5,10,2,11,1,12]],[[e, i],[c,d],[b,j],[a,k],[h,h]])
  .

gameLoop(CurrentRoom,VisitedRooms, OpenDoors, GuardsPositions) :-
  con(CurrentRoom,NextRoom,Door),
  member(Door,OpenDoors),
  not(member(NextRoom,GuardsPositions)),
  not(member(CurrentRoom,VisitedRooms)),
  (
    exit = NextRoom
  ;
    removeHead(GuardsPositions, NewGuardsPositions),
    removeHead(OpenDoors, NewOpenDoors),
    gameLoop(NextRoom,[CurrentRoom|VisitedRooms], NewOpenDoors, NewGuardsPositions)
  )
  .

