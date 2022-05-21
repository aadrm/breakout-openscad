target_radius = 75;
membrane_height = .5;
frame_height = 3;
frame_width = 3;
reinforcement_length = 5;
reinforcement_width = 2;
reinforcement_count = 20;
reinforcement_repeat_angle = 360 / reinforcement_count;



difference () {
    cylinder (frame_height, target_radius, target_radius);
    cylinder (frame_height, target_radius - frame_width, target_radius - frame_width);
}
cylinder (membrane_height, target_radius);

for (i=[0:reinforcement_count]) {
    rotate (reinforcement_repeat_angle * i) {
        translate ([0, target_radius - frame_width - reinforcement_length / 2, frame_height / 2]) {
            difference() {
                cube([reinforcement_width, reinforcement_length, frame_height], center=true);
                translate ([0, -(reinforcement_length / 2), frame_height / 2]) {
                    rotate ([0,90,0]) {
                        cylinder(reinforcement_width, frame_height, frame_height, center=true);
                    }
                }
            }
        }
    }
}
