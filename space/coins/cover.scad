module cover(
    area,
    gap,
    attachment,
    thickness
) {
    c = gap * sin(gap);
    echo(sin(gap));
    hull() {
        translate([0,0,gap])
        difference() {
            cube([area[0] + thickness, area[1] + thickness, thickness], center=true);
            cube([area[0], area[1], thickness], center=true);
        }
        difference() {
            cube([area[0] + thickness + c, area[1] + thickness + c, thickness], center=true);
            cube([area[0] + c, area[1] + c, thickness], center=true);
        }
    }
}

cover(
    area = [50, 50],
    gap = 30,
    attachment = 20,
    thickness = 2
);