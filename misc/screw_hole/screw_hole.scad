module screw_hole(
    head_start_depth=0,
    head_radius=0,
    head_length=0,
    shank_length=0,
    shank_radius=0,
    pilot_length=0,
    pilot_radius=0,
) {
    translate([0,0, -(head_start_depth)]){
        cylinder(r=head_radius, h=head_start_depth);
        translate([0,0, -(head_length)]) {
            cylinder(r2=head_radius, r1=shank_radius, h=head_length);
            translate([0,0,-(shank_length)]) {
                cylinder(r=shank_radius, h=shank_length);
                translate([0,0,-(pilot_length)]) {
                    cylinder(r=pilot_radius, h=pilot_length);
                    translate([0,0,-(pilot_radius)]) {
                        cylinder(r2=pilot_radius, r1=0, h=pilot_radius);
                    }
                }
            }
        }
    }
}