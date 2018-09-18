function updatedTank = performStrategy(tankObj,globalBoard,strategy,shotRow,shotCol)

tankRow = tankObj.row;
tankCol = tankObj.col;

% performs defend strategy below if ordered
if(strategy==1)
    if(tankRow==shotRow)
        status = isLegal(tankRow+1,tankCol,globalBoard);
        if(status==1)
            tankObj.row=tankRow+1;
            tankObj.col=tankCol;
            updatedTank = tankObj;
            return;
        end
        status = isLegal(tankRow-1,tankCol,globalBoard);
        if(status==1)
            tankObj.row=tankRow-1;
            tankObj.col=tankCol;
            updatedTank = tankObj;
            return;
        end
    end
    if(tankCol==shotCol)
        status = isLegal(tankRow,tankCol+1,globalBoard);
        if(status==1)
            tankObj.row=tankRow;
            tankObj.col=tankCol+1;
            updatedTank = tankObj;
            return;
        end
        status = isLegal(tankRow,tankCol-1,globalBoard);
        if(status==1)
            tankObj.row=tankRow;
            tankObj.col=tankCol-1;
            updatedTank = tankObj;
            return;
        end
    end
end

% attack strategy below
if(strategy==2)
    tankIDs = [10,20,30,40];
    fileteredTankIDs = tankIDs(find(tankIDs~=tankObj.tankId));
    len=length(fileteredTankIDs);
    for i=1:len
        [row,col]=find(globalBoard(:,:)== fileteredTankIDs(i));
        if(tankObj.visibleBoard(row,col)==77) % if opponent is in tank's vision
            if(row==shotRow || col==shotCol) % if shooter is in front of us
                tankObj.shot=1;
                updatedTank=tankObj;
                return;
            else
                rowMove=0;colMove=0;minDist=1000;
                rowList=[tankRow+1,tankRow-1,tankRow,tankRow];
                colList=[tankCol,tankCol,tankCol+1,tankCol-1];
                for loop=1:4
                    if(isLegal(rowList(loop),colList(loop),globalBoard)==1)
                        distance = sqrt((tankRow-rowList(loop))^2+(tankCol-colList(loop))^2);
                        if(distance<minDist)
                            rowMove= rowList(loop);
                            colMove= colList(loop);
                            minDist=distance;
                        end
                    end
                end
                tankObj.row=rowMove;
                tankObj.col=colMove;
                updatedTank=tankObj;
                return;
            end
        end
    end
    updatedTank=tankObj;
    return;
end

% if none of above works then explore strategy will be addopted
bestRow=tankRow;
bestCol=tankCol;
zeroCounter=0;
if(isLegal(tankRow+1,tankCol,globalBoard)==1)
    temp=findInNeighbours(tankObj.localBoard,tankRow+1,tankCol);
    if(temp>zeroCounter)
        bestRow = tankRow+1;
        bestCol = tankCol;
        zeroCounter=temp;
    end
end
if(isLegal(tankRow-1,tankCol,globalBoard)==1)
    temp=findInNeighbours(tankObj.localBoard,tankRow-1,tankCol);
    if(temp>zeroCounter)
        bestRow = tankRow-1;
        bestCol = tankCol;
        zeroCounter=temp;
    end
end
if(isLegal(tankRow,tankCol+1,globalBoard)==1)
    temp=findInNeighbours(tankObj.localBoard,tankRow,tankCol+1);
    if(temp>zeroCounter)
        bestRow = tankRow;
        bestCol = tankCol+1;
        zeroCounter=temp;
    end
end
if(isLegal(tankRow,tankCol-1,globalBoard)==1)
    temp=findInNeighbours(tankObj.localBoard,tankRow,tankCol-1);
    if(temp>zeroCounter)
        bestRow = tankRow;
        bestCol = tankCol-1;
        zeroCounter=temp;
    end
end

% if there is not space for movement
if(bestRow==tankRow && bestCol==tankCol)
    if(tankObj.orientation ~= 4)
        tankObj.orientation = tankObj.orientation+1;
        updatedTank = tankObj;
        return;
    else
        tankObj.orientation = tankObj.orientation-1;
        updatedTank = tankObj;
        return;
    end
else
    tankObj.row = bestRow;
    tankObj.col = bestCol;
    updatedTank= tankObj;
    return
end


end