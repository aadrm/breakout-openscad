module led_mount(
    h,
    led_r,
    base_r,
    fastener_r,
    fastener_head_r,
    thickness,
    inclination,
    cable_r
) {
    led_gap = 2;
    difference() {
        union() {
            difference() {
                difference() {
                    hull() {
                        rotate(inclination, [1,0,0])
                        translate([0,0,h])
                        cylinder(h = thickness, r = led_r + thickness + led_gap);
                        cylinder(h = thickness, r = base_r + thickness);
                    }
                    hull() {
                        rotate(inclination, [1,0,0])
                        translate([0,0,h - thickness])
                        cylinder(h = thickness, r = led_r + led_gap);
                        cylinder(h = thickness, r = base_r);
                    }
                }
                rotate(inclination, [1,0,0])
                translate([0,0,h])
                cylinder(h = thickness + 1, r = led_r);
            }

            difference() {
                difference() {
                    hull() {
                        mirror([1,0,0])
                        translate([base_r + fastener_r * 2 + thickness, 0, 0])
                        cylinder(h = thickness, r = fastener_head_r);
                        translate([base_r + fastener_r * 2 + thickness, 0, 0])
                        cylinder(h = thickness, r = fastener_head_r);
                    }
                    union() {
                        mirror([1,0,0])
                        translate([base_r + fastener_r * 2 + thickness, 0, 0])
                        cylinder(h = thickness, r = fastener_r);
                        translate([base_r + fastener_r * 2 + thickness, 0, 0])
                        cylinder(h = thickness, r = fastener_r);
                    }
                }
                cylinder(h = thickness, r = base_r);
            }
        }
        rotate(90, [1,0,0])
        cylinder(h = base_r + thickness, r = cable_r);
    }
}


led_mount(
    $fn=30,
    h = 20,
    cable_r = 2,
    led_r = 2.5,
    base_r = 15,
    fastener_r = 2,
    fastener_head_r = 5,
    thickness = 2,
    inclination = 0
);