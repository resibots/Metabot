// Diameter of plastic ollo holes
// OlloHoles = 4.3; // Original value
OlloHoles = 3;

// Width of Ollo "real" plastic
OlloWidth = 3;

// Distance between two ollo holes
OlloSpacing = 6;

// Do an Ollo hole on the part
module olloHole(depth=2.2)
{
    translate([0,0,-0.1])
      cylinder(depth+0.2, OlloHoles/2, OlloHoles/2);
}

// Do 3 ollo holes
module threeOllo(depth=2.2)
{
  for (xy=[[-OlloSpacing,0],[0,0],[OlloSpacing,0]]) {
    translate([xy[0], xy[1], 0])
      olloHole(depth);
  }
}

// Do a servo arm holes
module servoArm(depth=2.2)
{
  for (theta = [0, 90, 180, 270]) {
    translate([OlloSpacing*cos(theta),
      OlloSpacing*sin(theta), 0])
      olloHole(depth);
  }
  olloHole(depth);
  /*threeOllo(depth);
  rotate([0,0,90])
    threeOllo(depth);*/
}

module servoHoles(depth=2.2){
    rotate([0,90,0]) {
     threeOllo(depth);
    translate([0,-3*OlloSpacing,0])
      threeOllo(depth);
  }
}

// Makes only four holes, instead of six
module ServoHolesBasic(depth=2.2){
  rotate([0,90,0])
    for (x=[-OlloSpacing, OlloSpacing]) {
      for (y=[0, -3*OlloSpacing])
        translate([x, y, 0])
          olloHole(depth);
    }
}

module OlloArray(xRepetitions, yRepetitions, depth=2.2){
  for (x = [0:xRepetitions-1]) {
    for (y = [0:yRepetitions-1]) {
      translate([x*OlloSpacing, y*OlloSpacing, 0])
        olloHole(depth);
    }
  }
}