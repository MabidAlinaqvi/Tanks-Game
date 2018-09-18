function status = isLegal(row,col,board)
% This function validates all moves and returns a status of ture or false
% against each move. 
% by defalut status is true

status = 1; % 1 for true

[boardRow,boardCol] = size(board);
if( row<1 || row>boardRow || col<1 || col>boardCol ) % if coordinates are out of bounds of the board
    status = -1;
    return;
end
if(board(row,col)== 88 ) % cehck for destroyed tank
    status = -1;
    return;
end
if(board(row,col)~=0)   % if something other than zero
    status = -1;
    return;
end

end % function ends here