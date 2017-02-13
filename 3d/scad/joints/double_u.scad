use <../parts/u.scad>;
use <../models/motor_arm.scad>;

module double_u(height, radius, thickness, screwsSpacing, screwsDiameter,
    screws, col, alpha) {
    translate([0,0,0]) {
        color(col)
            u(height, radius, thickness, screwsSpacing, screwsDiameter, screws, !screws);
        translate([0,(height+radius)*2,0]) {
            rotate([0,90,180]) {
                color(col)
                    u(height, radius, thickness, screwsSpacing, screwsDiameter, screws, !screws);
                rotate([0,180,alpha]) {
                    motorArm(thickness);
                    children();
                }
            }
        }
    }
}

double_u();
