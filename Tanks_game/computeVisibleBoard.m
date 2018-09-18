function visibleBoard = computeVisibleBoard(direction,row,col,globalBoard)

% this function provides all boxes in visible reigon based on input
% direction
if( row > 15 || row < 1 || col >15 || col< 1 )
    visibleBoard=globalBoard;
    return;
end
% returns if a rock is found
if(globalBoard(row,col) == 1)
    visibleBoard=globalBoard;
    return;
end
% also returns when a visible point is found on the board
if(globalBoard(row,col) == 77)
    visibleBoard=globalBoard;
    return;
end
globalBoard(row,col)=77;
if(direction == 1)
    tempBoard = computeVisibleBoard(1,row-1,col,globalBoard);
    tempBoard = computeVisibleBoard(1,row-1,col-1,tempBoard);
    tempBoard = computeVisibleBoard(1,row-1,col+1,tempBoard);
    visibleBoard = tempBoard;
elseif(direction==4)
    tempBoard = computeVisibleBoard(4,row-1,col+1,globalBoard);
    tempBoard = computeVisibleBoard(4,row+1,col+1,tempBoard);
    tempBoard = computeVisibleBoard(4,row,col+1,tempBoard);
    visibleBoard = tempBoard;
elseif(direction==3)
    tempBoard = computeVisibleBoard(3,row+1,col,globalBoard);
    tempBoard = computeVisibleBoard(3,row+1,col-1,tempBoard);
    tempBoard = computeVisibleBoard(3,row+1,col+1,tempBoard);
    visibleBoard = tempBoard;
else
    tempBoard = computeVisibleBoard(2,row-1,col-1,globalBoard);
    tempBoard = computeVisibleBoard(2,row+1,col-1,tempBoard);
    tempBoard = computeVisibleBoard(2,row,col-1,tempBoard);
    visibleBoard = tempBoard;
end

end