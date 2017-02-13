include <config.scad>;
use <../util/screws.scad>;
include <../models/ollo.scad>;
use <../models/motor_arm.scad>;
use <parts.scad>;
use <joints.scad>;
use <../parts/body_center.scad>;
use <../parts/body_front.scad>;
use <../parts/plate.scad>;

module motor_on_body(alpha=0) {
  translate([0, 4*OlloSpacing, 0]) {
    motorArm(Thickness);
    rotate([0,0,alpha]) {
      children();
    }
  }
}

module metabotLeg(a, b, c) {
  if (MotorsPerLeg == 3) {
    motor_on_body(a) {
      metabot_double_u(b) {
        metabot_side_to_side(c) {
          metabot_arm_leg();
        }
      }
    }
  }
  if (MotorsPerLeg == 2) {
    motor_on_body(a) {
      metabot_double_u(b) {
        metabot_bottom_leg();
      }
    }
  }
}

module metabot(joint_angles = [0,0,0]) {
  // The right side of the robot (three legs and structural links)
  module metabot_side() {
    // right side, back link
    color(BodyColor)
      translate([MotorWidth /2, BodyWidth/2 + MotorDepth*sin(30), 0])
        body_center(Thickness);

    // right side, front link
    color(BodyColor)
      translate([-MotorWidth / 2, BodyWidth/2 + MotorDepth*sin(30), 0])
        mirror() body_center(Thickness);

    // right side, center
    translate([0, BodyWidth/2 + MotorDepth*sin(30), 0])
      rotate([0,0,0])
        translate([12 - MotorWidth /2  , 3, 0])   // translate to actual 0, 0 (offset of the holes)
          metabotLeg(joint_angles[0], joint_angles[1], joint_angles[2]);

    // right side, front leg
    mirror() translate([MotorWidth*2, BodyWidth/2 + MotorDepth*sin(30), 0])
      rotate([0,0,-30])
        translate([12, 3, 0])   // translate to actual 0, 0 (offset of the holes)
          metabotLeg(joint_angles[0], joint_angles[1], joint_angles[2]);

    // right side, back leg
    translate([MotorWidth*2, BodyWidth/2 + MotorDepth*sin(30), 0])
      rotate([0,0,-30])
        translate([12, 3, 0])   // translate to actual 0, 0 (offset of the holes)
          metabotLeg(joint_angles[0], joint_angles[1], joint_angles[2]);

  }

  // The front part of the robot (structural link joining the sides)
  module metabot_front() {
    // back center link
    translate([MotorWidth/2 + MotorHeight + MotorWidth*cos(30) , 0, 0])
      rotate([0, 0, -90])
        body_front(Thickness, BodyWidth);
  }

  metabot_side();
  mirror([0, 1, 0])
  metabot_side();

  color(BodyColor){
    metabot_front();
    mirror([1, 0, 0])
    metabot_front();

    // Bottom plate
    translate([0, 0, -MotorWidth/2-2])
      drill_plate_array(Thickness)
        drill_motor_holes(Thickness)
          bottom_plate(Thickness, 10, BodyWidth);
  }

}

// /!\ Caution /!\
// OlloHoles set to 3 in ollo.scad, whereas default value is 4.3
// It is done so that we can drill the holes to exact diameter.
metabot(joint_angles);