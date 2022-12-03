ptSegment = [                                                                   
    [ [-0, 0], [-8, 0], [-8, 2], [-0, 2] ],                    
    [ [-6, 0], [-6, 8], [-8, 8], [-8, 0] ],                    
    [ [-0, 0], [-0, 8], [-2, 8], [-2, 0] ],                    
    [ [-0, 7], [-0, 9], [-8, 9], [-8, 7] ],                    
    [ [-6, 8], [-6, 16], [-8, 16], [-8, 8] ],                    
    [ [-0, 8], [-0, 16], [-2, 16], [-2, 8] ],                    
    [ [-0, 14], [-8, 14], [-8, 16], [-0, 16] ],                    
]; 

fSevenSegment = [
    [1,1,1,0,1,1,1],                // 0
    [0,0,1,0,0,1,0],                // 1
    [1,1,0,1,0,1,1],                // 2
    [1,0,1,1,0,1,1],                // 3
    [0,0,1,1,1,1,0],                // 4
    [1,0,1,1,1,0,1],                // 5
    [1,1,1,1,1,0,1],                // 6
    [0,0,1,0,0,1,1],                // 7
    [1,1,1,1,1,1,1],                // 8
    [1,0,1,1,1,1,1]                 // 9
];

module MirroredDigit(number, scaling, height) {
    for (iSeg = [0:6]) {
        if (fSevenSegment[number][iSeg] > 0) {
            linear_extrude(height=height)
            scale([scaling, scaling, scaling]){
                translate([0, -8]){
                    mirror([1, 0, 0])
                    polygon(points=ptSegment[iSeg]);
                    polygon(points=ptSegment[iSeg]);
                }
            }
        }
    }
}