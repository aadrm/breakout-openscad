// Spacelab hexagons riddle
radius=70;
digit_relief=3;
height=10;
frame_height=6;
frame_width=5;
display_digit=3;
digit_scale=4.5;

fastener_amount=3;
fastener_head_r=6;
fastener_bore_r=2;

symbol = "Φ";
symbol_size = 16;

distance_to_side = radius * 0.866;
fastener_head = [0, fastener_head_r];
fastener_bore = [0, fastener_bore_r];
fastener_r = radius - frame_width - fastener_head_r - 1;
countersink = height - frame_height;


use <../../../assets/components/hexagon.scad>
use <../../../assets/components/mirrored_digit.scad>
use <../../../assets/components/fastener_holes.scad>

difference() {
    difference() {
        #difference() {
            difference() {
                Hexagon(r = radius, height = height);

                translate([0,0,height - frame_height])
                Hexagon(r = radius - frame_width, height = frame_height + 0.1);
            }

            translate([0,0,height - frame_height - digit_relief])
            MirroredDigit(number = display_digit, scaling = 4.5, height = digit_relief + 0.1);
        }

        rotate(360 / fastener_amount / 4, [0,0,1])
        translate([0,0,countersink])
        fastener_radial(
            radius=fastener_r,
            amount=fastener_amount,
            head=fastener_head,
            bore=fastener_bore,
            countersink=countersink
        );
    }

    translate([46,0, height - frame_height - digit_relief + 1])
    linear_extrude(height = digit_relief) 
    text(text = symbol, size = symbol_size, font="mono", valign="center", halign="center");
}
