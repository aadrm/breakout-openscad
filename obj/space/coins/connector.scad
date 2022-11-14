module connector_square(
    out_l,
    in_r,
    h,
    flange,
    thickness,
    angle = 0,
    angle_v = [0,0,0],
    connector_h = 0
) {
    difference() {
        union() {
            hull() {
                cube([(out_l + thickness), (out_l + thickness), thickness], center=true);
                rotate(angle, angle_v)
                translate(v = [0,0,h])
                cylinder(h = thickness, r = in_r + thickness);
            }
            // connector
            translate([0,0,h])
            difference() {
                cylinder(h = connector_h, r = in_r + thickness);
                cylinder(h = connector_h, r = in_r);
            }
        }
        hull() {
            cube([out_l, out_l, thickness], center=true);
            rotate(angle, angle_v)
            translate(v = [0,0,h + .001])
            cylinder(h = thickness, r = in_r);
        }
    }
    // flange
    difference() {
        cube([out_l + flange * 2, out_l + flange * 2, thickness], center=true);
        cube([out_l, out_l, thickness], center=true);
    }
}

module connector(
    out_r,
    in_r,
    h,
    flange,
    thickness,
    angle = 0,
    connector_h = 0
) {
    difference() {
        union() {
            hull() {
                cylinder(h = thickness, r = out_r + thickness);
                rotate(angle, [1,0,0])
                translate(v = [0,0,h])
                cylinder(h = thickness, r = in_r + thickness);
            }
            // connector
            rotate(angle, [1,0,0])
            translate([0,0,h])
            difference() {
                cylinder(h = connector_h, r = in_r + thickness);
                cylinder(h = connector_h, r = in_r);
            }
            // flange
            difference() {
                cylinder(h = thickness, r = out_r + flange);
                cylinder(h = thickness, r = out_r);
            }
        }
        hull() {
            cylinder(h = thickness, r = out_r);
            rotate(angle, [1,0,0])
            translate(v = [0,0,h + .001])
            cylinder(h = thickness, r = in_r);
        }
    }
}

connector(
    out_r = 22,
    in_r = 22,
    h = 30,
    flange = 15,
    thickness = 2,
    angle = 35,
    connector_h = 10
);

// connector_square(
//     out_l = 55,
//     in_r = 21,
//     h = 25,
//     angle = 0,
//     angle_v = [1,1,0],
//     thickness = 2,
//     flange = 15,
//     connector_h = 10
// );