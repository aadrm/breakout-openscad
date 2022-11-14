/*
    Intended to make space for a fastener.

    parameters:
    -head           a vector [head length, head radius]
    -bore           a vector [bore length, bore radius]
    -countersink    countersink length, requires head radius and bore radius
*/

module fastener_hole(
    head = [0, 0],
    bore = [0, 0],
    countersink = 0
) {
    if (head[0] && head[1])
    cylinder(h = head[0], r = head[1], center = false);
    translate([0,0,-countersink]) {
        if (countersink)
        cylinder(h = countersink, r1 = bore[1], r2 = head[1], center = false);

        translate([0,0,-bore[0]]) {
            if (bore[0] && bore[1])
            cylinder(h = bore[0], r = bore[1], center = false);
        }
    }
}

module fastener_block(
    size,
    head = [0, 0],
    bore = [0, 0],
    countersink = 0
) {

    fastener_hole(head = head, bore = bore, countersink = countersink);
    translate([size.x, 0])
    fastener_hole(head = head, bore = bore, countersink = countersink);
    translate([size.x, size.y])
    fastener_hole(head = head, bore = bore, countersink = countersink);
    translate([0, size.y])
    fastener_hole(head = head, bore = bore, countersink = countersink);

}

// showcase
fastener_block(
    size = [20, 40],
    head = [2, 5],
    bore = [5, 2],
    countersink = 0
);



