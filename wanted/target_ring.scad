target_radius = 75;
ring_height = .25;

difference() {
    cylinder(r=(target_radius/5*3), h=0.25, center=true);
    cylinder(r=(target_radius/5), h=0.25, center=true);
}