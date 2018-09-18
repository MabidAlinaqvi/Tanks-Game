function [board,updatedTank] = isHit(shotRow,shotCol,tankObj,globalBoard,blueTank,greenTank,redTank,yellowTank)
% function to check either the input tank got hit by the shot

shooterTank = tankObj;
tankId = globalBoard(shotRow,shotCol);  % getting ID of the shooter
% looking for the shooter tank from tankID
if(tankId==10)
   shooterTank=blueTank; 
end
if(tankId==20)
   shooterTank=greenTank; 
end
if(tankId==30)
   shooterTank=redTank; 
end
if(tankId==40)
   shooterTank=yellowTank; 
end

% if target tank is visible to shooter and lies in the same row or column
visibleBoard = shooterTank.visibleBoard;
if(visibleBoard(tankObj.row,tankObj.col)==77 && (tankObj.row==shotRow || tankObj.col==shotCol))
    tankObj.status=0;
    globalBoard(tankObj.row,tankObjCol)=88;
    board = globalBoard;
    updatedTank=tankObj;
    return;
end
% returns same object
updatedTank=tankObj;

end