use <case_housing.scad>
use <insert_mounts.scad>

module pcb_housing(
    x,
    y,
    clearance_bottom = 10, // Distance from the bottom of the case to the pcb
    clearance_top = 20, // Distance from the attachment points to the case cover (consider board thickness)
    clearance_sides = 8, // From screw center
    case_insert_r = 1.75,
    pcb_insert_r = 1.75,
    pcb_insert_depth = 6,
) {
    case_x = x + clearance_sides * 2;
    case_y = y + clearance_sides * 2;
    case_z = clearance_bottom + clearance_top;

    case_housing(size=[case_x, case_y, case_z], insert_r = case_insert_r);
    translate([clearance_sides, clearance_sides, 0])
    insert_mount_block(size = [x, y, clearance_bottom], insert_r = 1.75, thickness = 2, supports = 2);
}

pcb_housing(
    x = 140,
    y = 85,
    clearance_bottom = 10,
    clearance_top = 20,
    clearance_sides = 20
);