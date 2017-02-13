use <../parts/leg.scad>;

module arm_leg(sizeA, sizeB, sizeC, sizeBottom, sizeTop, mode, fixationAngle,
    thickness, print=false) {
    rotate([90,90,0]) {
        leg(sizeA, sizeB, sizeC, sizeBottom, sizeTop, mode, fixationAngle, thickness, print);
    }
}

module bottom_leg(sizeA, sizeB, sizeC, sizeBottom, sizeTop, mode, fixationAngle,
    thickness, print=false) {
    translate([0,-(24),0]) {
        rotate([180,0,0]) {
            rotate([180,90,fixationAngle]) {
                leg(sizeA, sizeB, sizeC, sizeBottom, sizeTop, mode, fixationAngle, thickness, print);
            }
        }
    }
}
