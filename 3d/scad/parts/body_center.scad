include <../models/ollo.scad>;
include <../models/motor_dim.scad>;

module body_center(thickness) {
  translate([0, 0, -MotorWidth/2])
    difference(){ // Digging the rivet holes
      union() {
        // main plate (backbone)
        cube([MotorHeight, thickness, MotorWidth]);

        // horizontal reinforcment
        linear_extrude(MotorWidth)
          polygon([
            [0, MotorHeight/2],
            [0, MotorHeight/2+thickness],
            [MotorHeight*(1+0.5*cos(60)) + thickness*cos(60), MotorHeight*0.5*sin(60) + thickness*sin(60)],
            [MotorHeight*(1+0.5*cos(60)), MotorHeight*0.5*sin(60)]
            ]);

        // additional plates along the servo
        cube([thickness, MotorHeight, MotorWidth]);
        translate([MotorHeight, 0, 0])
          rotate([0, 0, -30])
            translate([-thickness, 0, 0])
              cube([thickness, MotorHeight, MotorWidth]);

        // plate in the middle
        translate([MotorHeight / 2, 0, 0])
          cube([thickness, 18, MotorWidth]);
      }
      // holes
      translate([0, 27, MotorDepth / 2])
        servoHoles(thickness+0.2);
      translate([MotorHeight + 27*sin(30)-2*cos(30), 27*cos(30)+2*sin(30), MotorDepth/2])
        rotate([0, 0, -30])
          translate([-0.3, 0, 0])
            servoHoles(thickness+0.2);
      }
}

// For example:
// body_center(2.2);
