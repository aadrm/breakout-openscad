// Spacelab hexagons riddle

radius=70;
hex_height=10;
hex_frame_height=5;
hex_frame_width=5;


// Base shape
module hexagon_base(r, height, frame_height, frame_width){

    difference() {
            cylinder($fn=6, r=r, h=height);
            translate([0, 0, frame_height]) {
                cylinder($fn=6, r = (radius-frame_width), h=frame_height);
            }
    }
}



// hexagon_base(radius, hex_height, hex_frame_height, hex_frame_width);
ptSegment = [                                                                   
    [ [4, 4], [8, 0], [28, 0], [32, 4], [28, 8], [8, 8] ],                    
    [ [4, 4], [8, 8], [8, 28], [4, 32], [0, 28], [0, 8] ],                    
    [ [34, 7], [38, 11], [38, 31], [34, 35], [30, 31], [30, 11]],               
    [ [5, 36], [9, 32], [29, 32], [33, 36], [29, 40], [9, 40]],                 
    [ [4, 37], [8, 41], [8, 61], [4, 65], [0, 61], [0, 41]],                    
    [ [34, 37], [38, 41], [38, 61], [34, 65], [30, 61], [30, 41]],              
    [ [5, 66], [9, 62], [29, 62], [33, 66], [29, 70], [9, 70]]                  
]; 

scale([1,1,1]){
    for (i=[0:6]) {
        linear_extrude(height=10)
        polygon(points=ptSegment[i]);
    }
}