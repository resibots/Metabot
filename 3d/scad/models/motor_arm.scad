include <motor.scad>;
use <arm.scad>;

module motorArm(width) {
  motor(width);
  translate([0,0,MotorDepth/2])
    arm();
  translate([0,0,-MotorDepth/2-OlloWidth])
    arm(true);
}

motorArm();
