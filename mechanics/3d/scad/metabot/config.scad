// /!\ Caution /!\
// OlloHoles set to 3 in ollo.scad, whereas default value is 4.3
// It is done so that we can drill the holes to exact diameter.

// Number of legs
Legs = 6;

// Number of motors per leg (2 or 3)
MotorsPerLeg = 3;

// Static L3 angle (used only if 2 motors per leg)
L3Angle = -5;

// Color of the parts, for rendering
PartsColor = [0.8, 0.8, 0.8];

// Color for the body parts, still for rendering
BodyColor = [0.7, 0.6, 0.5];

// Head height
HeadHeight=30;

// Thickness of parts (2.2 is good for Ollo rivets)
Thickness = 2.2;
BodyThickness = 3;

// Sizes of the parts of the leg
// Ratio of leg parts
LegSize = 100;
LegSizeA = (0.40)*LegSize;
LegSizeB = (0.30)*LegSize;
LegSizeC = (0.20)*LegSize;

// Width of the bottom part of the leg
LegSizeBottom = 10;

// Size of the "top" part of the legs, in mm
LegSizeTop = 30;

// Body screws
BodyScrews = true;
BodyScrewsSize = 3.3;
BodyScrewsW = 7;
BodyScrewsH = 12;

// Motor dimensions
MotorWidth = 24;
MotorHeight = 36;
MotorDepth = 24;
MotorArmOffset = 9;

// U dimensions
UHeight = 15.2;
URadius = 8;
UWidth = 30+Thickness/2;
UTotalHeight = UHeight+URadius;
UUseScrews = true; // if false, Ollo rivets are used instead
UScrewsSpacing = 10;
UScrewsDiameter= 2.6;

// Side dimensions
SideSize = 35;
SideHolesToBorder = 5;

// Defining the resolution
/*$fn=10; // For visualisation only*/
$fn=50; // For printing only

// Joint angles
joint_angles = [0, -30, -110];

// Size of the body
/*BodySize = 23;*/
BodyWidth = MotorHeight;

module metabot_colorize() {
    color(PartsColor)
        children();
}
