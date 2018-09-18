function visibleConeBoard = FOV(tank,globalBoard)

tankRow =tank.row;
tankCol=tank.col;
direction = tank.orientation;
visibleConeBoard = computeVisibleBoard(direction,tankRow,tankCol,globalBoard);

[obstacleRow,obstacleCol] = find(visibleConeBoard(:,:)==1);
[visionRow,visionCol] = find(visibleConeBoard(:,:)==77);

for j=1:length(obstacleRow)
    for i=1:length(visionRow)
        obstToVisionDist = sqrt((obstacleRow(j)-visionRow(i))^2+(obstacleCol(j)-visionCol(i))^2);
        obstToTankDist = sqrt((obstacleRow(j)-tankRow)^2+(obstacleCol(j)-tankCol)^2);
        tankToVisionDist = sqrt((visionRow(i)-tankRow)^2+(visionCol(i)-tankCol)^2);
        
        if(tankToVisionDist == (obstToVisionDist+obstToTankDist))
            visibleConeBoard(visionRow(i),visionCol(i))=0;
        end
    end % end of visible cone Loop
end % end of obstacle list loop
% 10 = our tank
visibleTanksCounter = 0;
for i=1:3
    [row,col] = find(globalBoard(:,:)==i*10);
    if(visibleConeBoard(row,col)==77)
        visibleTanksCounter = visibleTanksCounter+1;
    end
end

end % end of function