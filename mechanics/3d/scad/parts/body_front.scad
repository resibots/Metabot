include <../models/ollo.scad>;
include <../models/motor_dim.scad>;

module body_sym(thickness, width) {

  difference(){
    union() {
      // main plate
      cube([width, thickness, MotorWidth]);

      translate([width, 0, 0])
      rotate([0, 0, -60])
        translate([-thickness, 0, 0])
          cube([thickness, MotorHeight, MotorWidth]);
    }
    // holes
    translate([width + MotorHeight/2*sin(60), MotorHeight/2*cos(60), MotorDepth/2])
      rotate([0, 0, 90+30])
        translate([0, 1.5*OlloSpacing, 0])
          ServoHolesBasic(5);
  }

  // plate in the middle
  translate([0, 0, MotorDepth/2-thickness/2])
    linear_extrude(thickness)
      polygon([
        [0, 0], [width, 0],
        [width+MotorHeight*sin(60), MotorHeight*cos(60)],
        [width+MotorHeight*sin(60)+thickness*cos(120), MotorHeight*cos(60)+thickness*sin(120)],
        [0, MotorHeight*cos(60)+thickness*sin(120)]
        ]);

  // Arrow to the front
  translate([0, thickness, 0])
    linear_extrude(MotorWidth)
      polygon([
        [width-thickness, 0],
        [width, 0],
        [0, MotorHeight*cos(60)],
        [0, MotorHeight*cos(60)-thickness]
        ]);
}

module body_front(thickness = 2, width = 36) {
  translate([0, 0, -MotorWidth/2]) {
    body_sym(thickness, width/2);
    mirror() body_sym(thickness, width/2);
  }
}

// For example:
// body_front(2.2, 30);
