use <../components/triangular_right_prism.scad>

/*
    module insert_mount
    -
    This module is thought to be used for threaded insert mounts,
    if used only for fasteners consider the difference of diameter
    between the threads and the shaft.
    -
    parameters:
    -h                  total height of the mount
    -insert_r           radius of the screw or insert
    -thickness        thickness of the supports and walls around the insert
    -support_h          height of the support as percent of h
    -support_amount     number of supports
    -support_every_deg  degrees between supports
    -
    notice that ideally the support_amount x support_every_deg should
    not equal more than 360
*/

module insert_mount(
    h = 10,
    insert_r = 1.75,
    thickness = 2,
    support_h = 100,
    support_amount = 4,
    support_every_deg = 90
) {
    $fn=15; // set facette number
    support_h = h * support_h / 100;

    // The body of the mount
    difference() {
        cylinder(h = h, r = insert_r + thickness);
        cylinder(h = h, r = insert_r);
    }

    // Supports
    if (support_amount) {
        rotate(-90) // First support to point to the positive x side
        for(i=[0:support_amount - 1]) {
            rotate(i * support_every_deg) {
                translate([-thickness/2,0,0]){
                    translate([0 , insert_r, 0])
                    cube([thickness, thickness, support_h]);

                    translate([0, insert_r + thickness, 0])
                    triangular_right_prism(thickness, support_h, support_h);
                }
            }
        }
    }
}

/*
    block of four insert mounts

    params:
    -x              distance between corner screw-hole centers in the x axis
    -y              distance between corner screw-hole centers in the y axis
    -h              height of the mounts
    -insert_r       radius of the inserns or screw to be used
    -thickness_w    thickness of the walls around the inserts
    -supports       number of supports, more than 4 has no effect

*/

module insert_mount_block(
    size,
    insert_r = 1.75,
    thickness = 2,
    supports = 2
) {
    for (i = [0:1]) {
        for (j = [0:1]) {
            translate([i * size.x, j * size.y, 0])
            mirror([i, j, 0]) // Make all point to the center
            insert_mount(
                h = size.z,
                insert_r = insert_r,
                thickness = thickness,
                support_h = 100,
                support_amount = supports
            );
        }
    }
}

// showcase
insert_mount_block(size = [84, 40, 10], supports = 2);