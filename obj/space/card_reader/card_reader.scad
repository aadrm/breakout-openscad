use <../../../assets/assemblies/case.scad>
use <../../../assets/components/fastener_holes.scad>

thickness = 2;
size = [120, 80, 20];
cover_flange = 15;
icon_size = [50, 50];
icon_offset = [0, 0];
fasteners_size = [size[0] + cover_flange, size[1] + cover_flange];
fasteners_r = 10;
cover_size = [size[0] + cover_flange * 2, size[1] + cover_flange * 2, thickness];

cover_translate = [-cover_flange, - cover_flange];
fasteners_translate = [- cover_flange / 2, - cover_flange / 2];
icon_translate  = [size[0] / 2 - icon_size[0] / 2 + icon_offset[0], size[1] / 2 - icon_size[1] / 2 + icon_offset[1]];

translate(icon_translate)
linear_extrude(height = thickness / 2, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0)
resize(icon_size) import("rfid.svg");

#case_housing(size = size, thickness = thickness, insert_r = 1.75);


translate(fasteners_translate)
fastener_block(size = fasteners_size, head = [0, 0], bore = [fasteners_r, thickness], countersink = 0);

translate(cover_translate)
cube(size = cover_size, center = false);