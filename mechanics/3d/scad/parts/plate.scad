include <../models/ollo.scad>;
include <../models/motor_dim.scad>;

module bottom_plate(Thickness, radius, width) {
  s = MotorDepth;
  l = MotorHeight;

  module half_plate() {
    polygon([
      [s/2 + l + s*cos(30), width/2],
      [s/2 + l, width/2 + s*sin(30)],
      [0, width/2 + s*sin(30)],
      [0, -width/2 - s*sin(30)],
      [s/2 + l, -width/2 - s*sin(30)],
      [s/2 + l + s*cos(30), -width/2]
      ]);
  }

  linear_extrude(Thickness)
    offset(r=radius) {
      half_plate();
      mirror()
      half_plate();
    }
}

module drill_motor_holes(Thickness) {
  s = MotorDepth;
  l = MotorHeight;

  module corner_motor_holes(){
    translate([s/2 + l + s/2*cos(30) + 3*cos(60), l/2 + s/2*sin(30) + 3*sin(60)])
      rotate([0, 0, -30])
        threeOllo(Thickness+0.2);
  }

  module side_motor_holes(){
    translate([0, l/2 + s*sin(30) + 3, 0])
      threeOllo(Thickness+0.2);
  }

  difference() {
    children();

    // Holes in the corners of the plate
    corner_motor_holes();
    mirror([0, 1, 0])
      corner_motor_holes();
    mirror([1, 0, 0])
      corner_motor_holes();
    mirror([1, 0, 0])
      mirror([0, 1, 0])
        corner_motor_holes();

    // Holes in the side of the plate
    side_motor_holes();
    mirror([0, 1, 0])
      side_motor_holes();
  }
}

module drill_plate_array(Thickness) {
  difference() {
    children();

    OlloArray(10, 5, depth=Thickness+0.2);
    mirror([1, 0, 0])
      OlloArray(10, 5, depth=Thickness+0.2);
    mirror([0, 1, 0])
      OlloArray(10, 5, depth=Thickness+0.2);
    mirror([0, 1, 0])
      mirror([1, 0, 0])
        OlloArray(10, 5, depth=Thickness+0.2);
  }
}

// For example:
// drill_plate_array(2)
//   drill_motor_holes(2)
//     bottom_plate(2, 10, 36);