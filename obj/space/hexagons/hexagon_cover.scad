radius=70;
digit_relief=3;
frame_height=6;
frame_width=5;

symbol = "Φ";
symbol_size = 16;

handle_length = 50;
handle_height = 15;
handle_thickness = 3;

use <../../../assets/components/hexagon.scad>
use <../../../assets/components/chamfer.scad>

difference() {
    #difference() {
        Hexagon(r = radius - frame_width - 0.2, height = frame_height);

        translate([-radius,-radius,0]) 
        cube([radius, radius * 2, frame_height + 0.1]);
    }
    translate([46,0, frame_height - digit_relief])
    linear_extrude(height = digit_relief) 
    text(text = symbol, size = symbol_size, font="mono", valign="center", halign="center");

}

translate([radius / 3, -(handle_length / 2), frame_height]) {
    cube([handle_thickness, handle_length, handle_height]);

    translate([handle_thickness / 2, handle_thickness +  handle_length / 2,0])
    rotate(90, [1,0,0])
    linear_extrude(handle_thickness * 2) {
        mirror([1,0,0])
        translate([handle_thickness / 2,0,0]) 
        chamfer(handle_height / 2);
        translate([handle_thickness / 2,0,0]) 
        chamfer(handle_height / 2);
    }

    translate([handle_thickness / 2,handle_thickness,0])
    rotate(90, [1,0,0])
    linear_extrude(handle_thickness) {
        mirror([1,0,0])
        translate([handle_thickness / 2,0,0]) 
        chamfer(handle_height);
        translate([handle_thickness / 2,0,0]) 
        chamfer(handle_height);
    }

    translate([handle_thickness / 2 ,handle_length,0])
    rotate(90, [1,0,0])
    linear_extrude(handle_thickness) {
        mirror([1,0,0])
        translate([handle_thickness / 2,0,0]) 
        chamfer(handle_height);
        translate([handle_thickness / 2,0,0]) 
        chamfer(handle_height);
    }
}





