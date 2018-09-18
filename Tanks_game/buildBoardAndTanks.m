function [blueTank,greenTank,redTank,yellowTank,board, grid] = buildBoardAndTanks()

% to setup board and grid with tanks images placed on it. 
board = zeros(15);
%grid = ones(size*30,size*30,3);

board(1,8) = 1; %obst
board(2,8) = 1;
board(3,8) = 1;

board(4,4) = 1;
board(4,5) = 1;
board(4,11) = 1;
board(4,12) = 1;

board(5,4) = 1;
board(5,12) = 1;

board(6,8) = 1;

board(8,1) = 1;
board(8,2) = 1;
board(8,3) = 1;
board(8,6) = 1;
board(8,8) = 1;
board(8,10) = 1;
board(8,13) = 1;
board(8,14) = 1;
board(8,15) = 1;

board(10,8) = 1;


board(11,4) = 1;
board(11,12) = 1;

board(12,4) = 1;
board(12,5) = 1;
board(12,11) = 1;
board(12,12) = 1;

board(13,8) = 1; 
board(14,8) = 1;
board(15,8) = 1;

% placing tanks
board(1,1)=10;
board(1,15)=20;
board(15,1)=30;
board(15,15)=40;

localBoard = zeros(15); %local board for score calculation

% tank objects creation
blueTank = tankObjectCreator(1,1,0,3,'10Tank.png',10,board,localBoard,localBoard,1);
greenTank = tankObjectCreator(1,15,0,2,'20Tank.png',20,board,localBoard,localBoard,1);
redTank = tankObjectCreator(15,1,0,4,'30Tank.png',30,board,localBoard,localBoard,1);
yellowTank = tankObjectCreator(15,15,0,1,'40Tank.png',40,board,localBoard,localBoard,1);

blueTank.visibleBoard = FOV(blueTank,board);    
greenTank.visibleBoard = FOV(greenTank,board);   % updating visible board of each tank
redTank.visibleBoard = FOV(redTank,board);
yellowTank.visibleBoard = FOV(yellowTank,board);

%placing tank pointers on board
[board,blueTank] = updateBoard(blueTank,board);
[board,greenTank] = updateBoard(greenTank,board);
[board,redTank] = updateBoard(redTank,board);
[board,yellowTank] = updateBoard(yellowTank,board);

grid = updateGrid(board,blueTank,greenTank,redTank,yellowTank);

end