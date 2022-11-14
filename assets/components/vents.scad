/*
    Produces an alternating pattern that tries to fit in as many
    slots with the given radius in the given area. rows of slots
    alternate indentation

    parameters:
    -a  side a size
    -b  side b size
    -r  radius of the slot circles, their centers are one diameter appart
*/

module vent_pattern(a, b, r = 2,) {
    $fn=10;
    l = r * 2;
    col_size = l + (r * 3);
    row_size = (r * 3);
    rows = b / row_size;
    cols = a / col_size;
    translate([-(col_size * (cols-1) / 2), -(row_size * (rows-1) / 2), 0])
    for(row=[0:rows - 1]) {
        for(col=[0:cols - 1]){
            translate([col_size * col - (row % 2 * col_size / 2), row_size * row ,0])
            hull() {
                circle(r);
                translate([l,0,0])
                circle(r);
            }
        }
    }
}

// showcase
vent_pattern(a = 20, b = 10, r = 1);