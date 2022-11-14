module cover(
    area,
    gap,
    attachment,
    thickness
) {
    total_x = area[0] + gap + attachment * 2;
    total_y = area[1] + gap + attachment * 2;
    base_x = area[0] + gap;
    base_y = area[1] + gap;


    difference() {
        union() {

            difference() {
                cube([total_x, total_y, thickness], center=true);
                cube([base_x, base_y, thickness], center=true);
            }
            difference() {
                hull() {
                    translate([0,0,gap])
                    cube([area[0] + thickness, area[1] + thickness, thickness], center=true);
                    cube([base_x + thickness, base_y + thickness, thickness], center=true);
                }
                hull() {
                    translate([0,0,gap - thickness])
                    cube([area[0], area[1], thickness], center=true);
                    cube([base_x - thickness, base_y - thickness, thickness], center=true);
                }
            }
        }
        translate([0, (area[1] + gap + attachment + thickness) / 2, gap / 2])
        #cube([total_x + 10, gap + attachment, gap + thickness + 10], center=true);
    } 
}

cover(
    area = [70, 50],
    gap = 15,
    attachment = 50,
    thickness = 10
);