use <../../../assets/assemblies/case.scad>
use <../../../assets/components/fastener_holes.scad>

lid_size = [50, 80];
thickness = 2;
bore_r = 5;
insert_r = 8;


#case_lid(size = lid_size, thickness = thickness, insert_r = insert_r, bore_r = bore_r);
fastener_block(size = lid_size, head = [0, 0], bore = [5, 5], countersink = 0);