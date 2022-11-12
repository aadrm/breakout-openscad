module connector(
    out_l,
    in_r,
    h,
    flange,
    angle = 0,
    angle_v = [0,0,0],
    thickness
) {
    difference() {
        hull() {
            cube([(out_l + thickness), (out_l + thickness), thickness], center=true);
            rotate(angle, angle_v)
            translate(v = [0,0,h]) 
            cylinder(h = thickness, r = in_r + thickness);
        }
        hull() {
            cube([out_l, out_l, thickness], center=true);
            rotate(angle, angle_v)
            translate(v = [0,0,h + .001]) 
            cylinder(h = thickness, r = in_r);
        }
    }
    difference() {
        cube([out_l + flange, out_l + flange, thickness], center=true);
        cube([out_l, out_l, thickness], center=true);
    }
}

connector(
    out_l = 70,
    in_r = 25,
    h = 70,
    angle = 45,
    angle_v = [1,1,0],
    thickness = 2,
    flange = 20
);


translate(v = [150,0,0])
connector(
    out_l = 40,
    in_r = 10,
    h = 90,
    angle = 0,
    angle_v = [1,1,0],
    thickness = 2,
    flange = 40
);