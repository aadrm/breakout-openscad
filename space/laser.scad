character = "8";
font_size = 32;
square_size = 50;
border = 3;
height = 6;
profile = 3;
o = square_size / 2;

module letter(ch) {
linear_extrude(height)
    text(ch, font_size, halign="center", valign="center");
}
translate([o, o, 0])
letter("H");
difference() {
    cube([square_size,square_size,height]);
        translate([border,border,profile])
    cube([square_size - border * 2,square_size-border*2,profile*2]);
}
