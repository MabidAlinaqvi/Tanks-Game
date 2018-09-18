function grid = updateGrid(board,blueTank,greenTank,redTank,yellowTank)

%build board
grid = imread('background.jpg'); 

% adding lines on the grid
size1=15;
for i=1:size1-1
    grid(i*30,:,:) = 255;
end
for j=1:size1-1
    grid(:,j*30,:) = 255;
end

%updating other images
[rows,cols] = size(board);
for row = 1 : rows
    for col = 1 : cols
        rowLocation = (row*30)-28;
        colLocation = (col*30)-28;
        if(board(row,col) == 1)
            rock = imread('Rock.jpg');
            grid(rowLocation:rowLocation+27,colLocation:colLocation+27,:) = rock;
        end
        if(board(row,col) == 88) % placing image if a tank has been destroyed
            rock = imread('Destroyed.png');
            grid(rowLocation:rowLocation+27,colLocation:colLocation+27,:) = rock;
        end
        if(board(row,col) == 10)  % placement of blue tank image
            image = imread(blueTank.image);
            rowLocation = (blueTank.row*30)-28;
            colLocation = (blueTank.col*30)-28;
            rotatedImage = imrotate(image,(blueTank.orientation-1)*90);
            grid(rowLocation:rowLocation+27,colLocation:colLocation+27,:) = rotatedImage;
        end
        if(board(row,col) == 20)  % green tank image placement
            image = imread(greenTank.image);
            rowLocation = (greenTank.row*30)-28;
            colLocation = (greenTank.col*30)-28;
            rotatedImage = imrotate(image,(greenTank.orientation-1)*90);
            grid(rowLocation:rowLocation+27,colLocation:colLocation+27,:) = rotatedImage;
        end
        if(board(row,col) == 30)  % setting red tank image
            image = imread(redTank.image);
            rowLocation = (redTank.row*30)-28;
            colLocation = (redTank.col*30)-28;
            rotatedImage = imrotate(image,(redTank.orientation-1)*90);
            grid(rowLocation:rowLocation+27,colLocation:colLocation+27,:) = rotatedImage;
        end
        if(board(row,col) == 40)  % image placement of yellow tank
            image = imread(yellowTank.image);
            rowLocation = (yellowTank.row*30)-28;
            colLocation = (yellowTank.col*30)-28;
            rotatedImage = imrotate(image,(yellowTank.orientation-1)*90);
            grid(rowLocation:rowLocation+27,colLocation:colLocation+27,:) = rotatedImage;
        end
    end
end  % end of loop

end  % end of function