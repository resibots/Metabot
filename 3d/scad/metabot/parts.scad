include <config.scad>;
use <../util/screws.scad>;
use <../parts/body.scad>;
use <../parts/body4.scad>;
use <../parts/u.scad>;
use <../parts/side.scad>;
use <../parts/leg.scad>;
// For the hexapod
use <../parts/body_center.scad>;
use <../parts/body_front.scad>;
use <../parts/plate.scad>;
use <../parts/side_small.scad>;

module metabot_colorize() {
    color(PartsColor)
        children();
}

module metabot_u(print=false) {
    metabot_colorize()
        u(UHeight, URadius, Thickness, UScrewsSpacing, UScrewsDiameter, UUseScrews, !UUseScrews, print=print);
}

module metabot_leg(print=false) {
    metabot_colorize()
        leg(LegSizeA, LegSizeB, LegSizeC, LegSizeBottom,
                LegSizeTop, (MotorsPerLeg == 2 ? "side" : "arm"), L3Angle, Thickness, print=print);
}

module metabot_body_screws() {
	squareScrews(BodyScrewsW, BodyScrewsH, BodyScrewsSize, Thickness);
}

module metabot_body(print=false, top=false) {
    metabot_colorize()
        body(BodySize, Legs, Thickness, print=print)
		if (top && BodyScrews) {
			metabot_body_screws();
		}
}

module metabot_body4(print=false, top=false) {
    metabot_colorize()
    body4(BodySize, Legs, Thickness, print=print, fixation=top);
}

module metabot_side(print=false) {
    metabot_colorize()
        side(SideSize, SideHolesToBorder, Thickness, print=print);
}

// For the hexapod
module hexapod_colorize() {
    color(BodyColor)
        children();
}

module hexapod_body_front(print=false) {
    hexapod_colorize()
        body_front(Thickness, BodyWidth);
}

module hexapod_body_center(print=false) {
    hexapod_colorize()
        body_center(Thickness);
}

module hexapod_bottom_plate(print=false) {
    hexapod_colorize()
        drill_plate_array(Thickness)
            drill_motor_holes(Thickness)
                bottom_plate(Thickness, 10, BodyWidth);
}

module metabot_side_small(print=false) {
    metabot_colorize()
        side_small(SideSize-24, SideHolesToBorder, Thickness);
}