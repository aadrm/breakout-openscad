use <../../../assets/components/fastener_holes.scad>


module barrier(l, h, thickness, fastener_r) {
    difference() {
        #difference() {
            cube(size = [h,l,h]);
            translate([thickness, thickness , thickness])
            cube(size = [h,l - thickness * 2,h]);
        }
        translate([(h + thickness ) / 2,0,thickness])
        union() {
            translate([0, l - (h / 2 + thickness), 0])
            fastener_hole(bore = [thickness, fastener_r]);

            translate([0, h / 2 + thickness, 0])
            fastener_hole(bore = [thickness, fastener_r]);
        }
    }

}

barrier($fn = 20, l = 180, h = 20, thickness = 2, fastener_r = 1.5);