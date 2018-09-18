function tank = tankObjectCreator(row,col,shot,orientation,imageFile,tankId,visibleBoard,globalBoard,localBoard,status)

% Direction represenatation
% 1=up ,2=left ,3=down ,4=right
% creates tank object with following properties

tank = struct('row',row,'col',col,'shot',shot,'orientation',orientation,'image', imageFile ,'tankId',tankId,'visibleBoard',visibleBoard,'globalBoard',globalBoard,'localBoard',localBoard,'status',status);

end