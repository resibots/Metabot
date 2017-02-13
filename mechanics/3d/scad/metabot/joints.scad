include <config.scad>;
use <../joints/double_u.scad>;
use <../joints/side_to_side.scad>;
use <../joints/leg.scad>;

module metabot_double_u(alpha=0) {
    double_u(UHeight, URadius, Thickness, UScrewsSpacing, UScrewsDiameter, UUseScrews, PartsColor, alpha) {
        children();
    }
}

module metabot_side_to_side(alpha=0) {
    side_to_side(SideSize, SideHolesToBorder, PartsColor, Thickness, alpha) {
        children();
    }
}

module metabot_arm_leg() {
    color(PartsColor) {
        arm_leg(LegSizeA, LegSizeB, LegSizeC, LegSizeBottom,
                LegSizeTop, (MotorsPerLeg == 2 ? "side" : "arm"), L3Angle, Thickness, print=print);
    }
}

module metabot_bottom_leg() {
    color(PartsColor) {
        bottom_leg(LegSizeA, LegSizeB, LegSizeC, LegSizeBottom,
                LegSizeTop, (MotorsPerLeg == 2 ? "side" : "arm"), L3Angle, Thickness, print=print);
    }
}