function strategy = strategy(tankObj, globalBoard, shotStatus, shotRow, shotCol)
% streategy => 1=defend, 2=attack, 3=explore
% requires tank with updated visibleBoard, being updated in main controller
tRow = tankObj.row;
tCol = tankObj.col;
if(shotStatus ==1)  % if shot has been taken
    if(tRow==shotRow || tCol==shotCol)  % if tank is standing in the same row or column
        strategy = 1;  % addopt deffend strategy
        return;
    end
end
% counting visible tanks
vBoard = tankObj.visibleBoard;
tanksCounter=0;
for i=1:4
    [row,col] = find(globalBoard(:,:)==i*10);  % getting coordinates of each tank
    if(vBoard(row,col)==77)
        tanksCounter = tanksCounter+1;
    end
end
if(tanksCounter-1>0)   % tanksCounter-1 if because tank counts himself as a visible tank 
    strategy=2;
    return;
end
strategy = 3; % else just explore
end