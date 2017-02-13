include <../models/motor.scad>;
use <../models/motor_arm.scad>;
use <../parts/side.scad>;
use <../parts/side_small.scad>;

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
    color(col)
        translate([0, - MotorHeight, MotorDepth / 2])
            side_small(size-24, holesToBorder, thickness);
    color(col)
        translate([0, - MotorHeight, -MotorDepth / 2 - thickness])
            side_small(size-24, holesToBorder, thickness);

    translate([0,-(size*2-2*holesToBorder),0]) {
        rotate([0,0,180]) {
            motorArm(thickness);
            rotate([0,0,alpha])
                children();
        }
    }
}

// For example:
// side_to_side(size=40, holesToBorder=5, col="white", thickness=2.2);