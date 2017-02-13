include <../models/motor.scad>;
use <../models/motor_arm.scad>;
use <../parts/side.scad>;

module side_to_side(size, holesToBorder, col, thickness, alpha)
{
    for (side=[MotorWidth/2+thickness,-MotorWidth/2]) {
        translate([side,0,0]) {
            rotate([180,90,0]) {
                color(col)
                    side(size, holesToBorder, thickness);
            }
        }
    }
    translate([0,-(size*2-2*holesToBorder),0]) {
        rotate([0,0,180]) {
            motorArm(thickness);
            rotate([0,0,alpha])
                children();
        }
    }
}

side_to_side();
