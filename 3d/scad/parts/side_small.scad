include <../models/ollo.scad>;
use <../util/rounded.scad>;

module side_small(size, holesToBorder, thickness) {
    echo("[PART] side_small");
    translate([0,size-holesToBorder,0]) {
        difference() {
            rounded(20, size *2, thickness, 5, true);
            for (y=[size-holesToBorder,	 -size+holesToBorder]) {
                translate([0, y, 0])
                    threeOllo();
            }
        }
    }
}

// For example:
// side_small(11, 5, 2.2);
