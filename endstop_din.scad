CLIP_H = 5.5;
HOLE_DEPTH = 7;
OUTER_HOLE_DIAMETER = 3.2;
HOLE_DIAMETER = 2.9;

module din_clip() {
	
	difference() {

		linear_extrude(height=CLIP_H, center=true, convexity=5) {
			import(file="endstop_din.dxf", layer="0", $fn=64);
		}

		union() {

			translate([9, 3, 0]) {
				rotate([90, 90, 0]) {
					cylinder(h= HOLE_DEPTH, r = OUTER_HOLE_DIAMETER / 2, $fn = 16);
				}
			}

			translate([9, 10, 0]) {
				rotate([90, 90, 0]) {
					cylinder(h= HOLE_DEPTH, r = HOLE_DIAMETER / 2, $fn = 16);
				}
			}

		}

	}
}

din_clip();

