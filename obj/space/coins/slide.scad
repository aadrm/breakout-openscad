module slide_elbow(
    degrees = 90,
    thickness = 1,
    tube_r,
    elbow_r
) {
    rotate_extrude(angle=degrees){
        // rotate(90, [1,0,0])
        translate([(tube_r + thickness + elbow_r),0,0])
        difference() {
            circle(r = tube_r + thickness);
            circle(r = tube_r);
        }
    }
}


slide_elbow(
    degrees = 70,
    thickness = 1.4,
    tube_r = 25.1,
    elbow_r = 30 
);