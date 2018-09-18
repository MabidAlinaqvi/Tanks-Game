function simulate(handles)

%initializing tanks, board and grid
[blueTank,greenTank,redTank,yellowTank,board,grid] = buildBoardAndTanks();

loopCounter=0;
%information about shooter tank and the shot
shotStatus=0;
shotRow=0; shotCol=0;
while(loopCounter ~= 1004)
    if(blueTank.status==1) % if tank is not dead
        [board,blueTank] = takeTurn(blueTank,board,shotStatus,shotRow,shotCol); % takes turn 
        if(shotStatus==1) % check for if the tank got hit by the shot
           [board,blueTank] = isHit(shotRow,shotCol,blueTank,board,blueTank,greenTank,redTank,yellowTank);
        end
        if(blueTank.shot==1) % if the following tank took shot
           shotRow=blueTank.Row; shotCol=blueTank.col; shotStatus=1; 
        end
        %updating grid from the updated board after turn of the tank
        grid = updateGrid(board,blueTank,greenTank,redTank,yellowTank);
        
        % calculating score of the tank
        blueScore = length(find(blueTank.localBoard(:,:)==11));
    end
    set(handles.gameStatus, 'String',loopCounter); % shows updated turnCounter in the GUI
    set(handles.blueTankScore, 'String',blueScore); % show current score of the tank
    imshow(grid,'Parent',handles.gridImage);  % shows updated grid with tanked moved to new location
    % a little pause to make movement of the tank noticeable
    pause(0.1);
    
    if(greenTank.status==1) % if tank is not dead
        [board,greenTank] = takeTurn(greenTank,board,shotStatus,shotRow,shotCol);
        if(shotStatus==1)
           [board,greenTank] = isHit(shotRow,shotCol,greenTank,board,blueTank,greenTank,redTank,yellowTank);
        end
        if(greenTank.shot==1)
           shotRow=greenTank.Row; shotCol=greenTank.col; shotStatus=1; 
        end
        grid = updateGrid(board,blueTank,greenTank,redTank,yellowTank);
        greenScore = length(find(greenTank.localBoard(:,:)==21));
    end
    set(handles.gameStatus, 'String',loopCounter);
    set(handles.greenTankScore, 'String',greenScore);
    imshow(grid,'Parent',handles.gridImage);
    pause(0.1);
    
    if(redTank.status==1) % not dead
        [board,redTank] = takeTurn(redTank,board,shotStatus,shotRow,shotCol);
        if(shotStatus==1)
           [board,redTank] = isHit(shotRow,shotCol,redTank,board,blueTank,greenTank,redTank,yellowTank);
        end
        if(redTank.shot==1)
           shotRow=redTank.Row; shotCol=redTank.col; shotStatus=1; 
        end
        grid = updateGrid(board,blueTank,greenTank,redTank,yellowTank);
        redScore = length(find(redTank.localBoard(:,:)==31));
    end
    set(handles.gameStatus, 'String',loopCounter);
    set(handles.redTankScore, 'String',redScore);
    imshow(grid,'Parent',handles.gridImage);
    pause(0.1);
    
    if(yellowTank.status==1) % not dead
        [board,yellowTank] = takeTurn(yellowTank,board,shotStatus,shotRow,shotCol);
        if(shotStatus==1)
           [board,yellowTank] = isHit(shotRow,shotCol,yellowTank,board,blueTank,greenTank,redTank,yellowTank);
        end
        if(yellowTank.shot==1)
           shotRow=yellowTank.Row; shotCol=yellowTank.col; shotStatus=1; 
        end
        grid = updateGrid(board,blueTank,greenTank,redTank,yellowTank);
        yellowScore = length(find(yellowTank.localBoard(:,:)==41));
    end
    set(handles.gameStatus, 'String',loopCounter);
    set(handles.yellowTankScore, 'String',yellowScore);
    imshow(grid,'Parent',handles.gridImage);
    pause(0.1);
    
    loopCounter = loopCounter+1;
   
end % end of while

% string to announce winner
winnerTank = '';
maxScore = 0;
% looking for tank with maximum score
if(blueScore>maxScore)
    winnerTank = 'Blue Tank Won!';
    maxScore = blueScore;
end
if(redScore>maxScore)
    winnerTank = 'Red Tank Won!';
    maxScore = redScore;
end
if(greenScore>maxScore)
    winnerTank = 'Green Tank Won!';
    maxScore = greenScore;
end
if(yellowScore>maxScore)
    winnerTank = 'Yellow Tank Won!';
    maxScore = yellowScore;
end
% announces winner on the specified field
set(handles.text10, 'String',winnerTank);

end