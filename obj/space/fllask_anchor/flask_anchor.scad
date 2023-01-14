use <../../../assets/components/hexagon.scad>
use <../../../assets/components/fastener_holes.scad>

flask_base_radius=41; // for a long diagonal of 7 cm
flask_radius=23;
flask_height=7;
total_radius=60;
total_height=10;
fastener_radius = flask_base_radius + (total_radius - flask_base_radius) / 2;
fastener_amount = 3;
head = [0, 6];
bore = [10, 2.5];

difference() {
    difference() {

        difference() {
            Hexagon(r = total_radius, height = total_height);
            Hexagon(r = flask_base_radius, height = flask_height);
        }
        cylinder(h = total_height, r = flask_radius);
    }
    translate([0,0,total_height])
    rotate(30)
    fastener_radial(
        radius = fastener_radius,
        amount = fastener_amount,
        head = head,
        bore = bore
    );

}
