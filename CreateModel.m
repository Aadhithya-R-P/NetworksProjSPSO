%{
This does the following:
- Loading terrain map
- Creating threats as cylinders
- Creating start and finish points
- Setting ranges and limits
%}

function model=CreateModel()

    H = imread('ChrismasTerrain.tif'); % Get elevation data
    H (H < 0) = 0;
    MAPSIZE_X = size(H,2); % x index: columns of H
    MAPSIZE_Y = size(H,1); % y index: rows of H
    [X,Y] = meshgrid(1:MAPSIZE_X,1:MAPSIZE_Y); % Create all (x,y) points to plot

    % Threats as cylinders
    R1=80;  % Radius
    x1 = 400; y1 = 500; z1 = 100; % center

    R2=70;  % Radius
    x2 = 600; y2 = 200; z2 = 150; % center
    
    R3=80;  % Radius
    x3 = 500; y3 = 350; z3 = 150; % center
    
    R4=70;  % Radius
    x4 = 350; y4 = 200; z4 = 150; % center
    
    R5=70;  % Radius
    x5 = 700; y5 = 550; z5 = 150; % center

    R6=80;  % Radius
    x6 = 650; y6 = 750; z6 = 150; % center
    
    % Map limits
    xmin= 1;
    xmax= MAPSIZE_X;
    
    ymin= 1;
    ymax= MAPSIZE_Y;
    
    zmin = 100;
    zmax = 200;  
 
    % Start and end position
    start_location = [200;100;150];
    end_location = [800;800;150];
    
    % Number of path nodes (not including the start position (start node))
    n=10;
    
    % Incorporate map and searching parameters to a model
    model.start=start_location;
    model.end=end_location;
    model.n=n;
    model.xmin=xmin;
    model.xmax=xmax;
    model.zmin=zmin;
    model.ymin=ymin;
    model.ymax=ymax;
    model.zmax=zmax;
    model.MAPSIZE_X = MAPSIZE_X;
    model.MAPSIZE_Y = MAPSIZE_Y;
    model.X = X;
    model.Y = Y;
    model.H = H;
    model.threats = [x1 y1 z1 R1;x2 y2 z2 R2; x3 y3 z3 R3; x4 y4 z4 R4; x5 y5 z5 R5;x6 y6 z6 R6];
    PlotModel(model);
end
