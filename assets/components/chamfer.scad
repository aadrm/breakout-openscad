module chamfer(r) {
    difference() {
        square(r);
        translate([r,r]) 
        circle(r);
    }
}

chamfer(r = 5);