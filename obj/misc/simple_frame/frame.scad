use <../../../assets/components/box.scad>
use <../../../assets/components/fastener_holes.scad>


height = 28;
width = 100;
frame_width = 3;
frame_height = 2;
thickness = 3;

screw_head_r = 4.5;
screw_shaft_r = 2.5;

fastener_head = [0, screw_head_r];
fastener_bore = [0, screw_shaft_r];

frame_x = height + frame_width;
frame_y = width + frame_width;

box_size = [frame_x, frame_y, frame_height + thickness];



difference() {
    #box(size = box_size, thickness_b=thickness, thickness_w=frame_width);
    union() {
        translate([frame_x / 2, thickness + screw_head_r, thickness]) 
        fastener_hole(head=fastener_head, bore=fastener_bore, countersink=thickness);
        translate([frame_x / 2, frame_y - (thickness + screw_head_r), thickness]) 
        fastener_hole(head=fastener_head, bore=fastener_bore, countersink=thickness);
    }
}