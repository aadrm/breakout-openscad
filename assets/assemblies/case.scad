use <../components/fastener_holes.scad>
use <../components/box.scad>
use <insert_mounts.scad>
use <../components/vents.scad>
/*

*/


module case_lid(
    size,
    thickness,
    insert_r,
    bore_r,
) {
    bore_offset = thickness + insert_r;
    dx = size.x - bore_offset * 2;
    dy = size.y - bore_offset * 2;

    difference() {
        cube([size.x, size.y, thickness]);

        translate([bore_offset, bore_offset, thickness])
        fastener_block([dx, dy], bore = [thickness, bore_r]);
    }
}

module case_housing(
    size,
    thickness = 2,
    insert_r = 1.75,
) {
    difference() {
        box(size = size, thickness_b = thickness, thickness_w = thickness);

        // vents
        translate([size.x / 2, size.y, size.z / 2])
        rotate(a = 90, v = [1,0,0])
        linear_extrude(height = size.y)
        vent_pattern(a = size.x / 2, b = size.z - thickness * 2, r = 1);
    }

    // screw, threaded insert holes
    mount_x = size.x - (thickness + insert_r) * 2;
    mount_y = size.y - (thickness + insert_r) * 2;
    translate([thickness + insert_r, thickness + insert_r, 0])
    insert_mount_block(size=[mount_x, mount_y, size.z], insert_r=insert_r, supports = 0);
}


// showcase

size = [90, 70, 20];
thickness = 2;
insert_r = 2;
bore_r = 1;

case_housing(size = size, thickness = thickness, insert_r = insert_r);

translate([0,0,25])
case_lid(size = size, thickness = thickness, insert_r = insert_r, bore_r = bore_r);