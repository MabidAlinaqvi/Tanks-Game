function [board,tankObj] = updateBoard(tankObj,board)

% placing tank coordinates in local vriable
tankRow = tankObj.row;
tankCol = tankObj.col;

% find old tank pointer on board and remove. plcae new pointer on updated
% co-ordinates
[oldIdRow,oldIdCol] = find(board(:,:)==tankObj.tankId);

board(oldIdRow,oldIdCol)=0;
board(tankRow,tankCol)=tankObj.tankId;

% place trail of the tank on the local board of the tank that will be used
% for score calculation e.g. for tank with id =10, trail = id+1 => 11
tankObj.localBoard(oldIdRow,oldIdCol)=tankObj.tankId+1;

end