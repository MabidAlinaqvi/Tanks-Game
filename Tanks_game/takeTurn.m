function [updatedGlobalboard,updatedTank] = takeTurn(tankObj,globalBoard,shotStatus,shotRow,shotCol)

% update FOV of the tank object
tankObj.visibleBoard = FOV(tankObj,globalBoard);
tankObj.globalBoard = globalBoard;

moveStrategy = strategy(tankObj, globalBoard, shotStatus, shotRow, shotCol);
strg = randi(5);  
% to add randomness in movement bcz all tanks are moved by same AI agent
if(strg<4)
    % if number <4 then think and perform strategy
    movedTank = performStrategy(tankObj,globalBoard,strg,shotRow,shotCol);
else
    % else randomly rotate tank direction aby any allowed angle
    ort= tankObj.orientation;
    if(ort==4)
       tankObj.orientation=ort+1;
       movedTank=tankObj;
    else
       tankObj.orientation=ort-1;
       movedTank=tankObj;
    end
end

% returns updated board and tank
[updatedGlobalboard,updatedTank] = updateBoard(movedTank,globalBoard);
end