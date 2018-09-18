function valueCount = findInNeighbours(board,tankRow,tankCol)

% this method is used in explore strategy
value=0;
% looks for the values in all neighbours and retunrs count
valueFound=0;
if(isLegal(tankRow-1,tankCol,board)==1)
    if(board(tankRow-1,tankCol) == value)
        valueFound=valueFound+1;
    end
end
if(isLegal(tankRow+1,tankCol,board)==1)
    if(board(tankRow+1,tankCol) == value)
        valueFound=valueFound+1;
    end
end
if(isLegal(tankRow,tankCol-1,board)==1)
    if(board(tankRow,tankCol-1) == value)
        valueFound=valueFound+1;
    end
end
if(isLegal(tankRow,tankCol+1,board)==1)
    if(board(tankRow,tankCol+1) == value)
        valueFound=valueFound+1;
    end
end

valueCount = valueFound;
end