// Base shape
module Hexagon(r, height){
    rotate([0,0,30])
    cylinder($fn=6, r=r, h=height);
}