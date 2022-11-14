/*
    A simple parametric box (without cover)

    parameters:
    -size           is a vector [x, y, z]
    -thickness_b    the thickness of the bottom face
    -thickness_w    The thickness of the wall faces
*/

module box (
    size,
    thickness_b = 2,
    thickness_w = 2
) {
    difference() {
        cube([size.x, size.y, size.z]);

        translate(v = [thickness_w, thickness_w, thickness_b]){
            cube([size.x - thickness_w * 2, size.y - thickness_w * 2, size.z]);
        }
    }
}


box([30, 20, 5]);