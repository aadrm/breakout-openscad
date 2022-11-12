module screw_hole(
    head = [0,0],
    shaft = [0,0],
    countersink
) {
    cylinder(h=head[0], r=head[1]);
    if ()
    translate([0,0,-(head[0] + countersink)]) 
    cylinder(h=shaft[0], r=shaft[1]);
}

screw_hole(
    $fn=16,
    head = [3,2],
    shaft = [3,1],
    countersink = 5
);