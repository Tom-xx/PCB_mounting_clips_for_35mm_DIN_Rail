CLIP_H = 10;
HOLE_DEPTH = 9;
HOLE_DIAMETER = 2.2;
HOLE_DISTANCE=30;
HOLE_DISTANCE=2.54 * 17; // number of island on a perfboad.
HOLE_OFF=2.54 * 1; // number of holes shifted along axis
LEN=50; // in effect hardcoded in the DXF file.
BAR=HOLE_DISTANCE + 10; // 5mm either side of the drill holes.
POT_H = 5;
POT_DIAMETER = HOLE_DIAMETER + 3;

// PCB held by tab in middle and bobbles
// into the holes
PCB_HOLE_DIAMETER=1.2;
PCB_HOLE_INSET=3
PCB_H=50;
PCB_Z=1.8;

module din_clip() {
	
 union() {
	difference() {

        union() {
		linear_extrude(height=CLIP_H, center=true, convexity=5) {
			import(file="din_clip_01.dxf", layer="0", $fn=64);
		}
        // rather then center - we sort of move up so you
        // can reach the clip a bit easier.
        translate([0,-(BAR-LEN)/5,-CLIP_H/2]) cube([5,BAR,CLIP_H]);
        
        // pots'
			translate([-POT_H, (BAR-HOLE_DISTANCE)/2, HOLE_OFF/2]) {
				rotate([0, 90, 0]) {
					cylinder(h= HOLE_DEPTH, r = POT_DIAMETER/2 , $fn = 16);
				}
			}

			translate([-POT_H, (BAR+HOLE_DISTANCE)/2, -HOLE_OFF/2]) {
				rotate([0, 90, 0]) {
					cylinder(h= HOLE_DEPTH, r = POT_DIAMETER/2 , $fn = 16);
				}
			}
       };
		union() {
			translate([-POT_H-0.1, (BAR-HOLE_DISTANCE)/2, HOLE_OFF/2]) {
				rotate([0, 90, 0]) {
					cylinder(h= HOLE_DEPTH, r = HOLE_DIAMETER / 2, $fn = 16);
				}
			}

			translate([-POT_H-0.1, (BAR+HOLE_DISTANCE)/2, -HOLE_OFF/2]) {
				rotate([0, 90, 0]) {
					cylinder(h= HOLE_DEPTH, r = HOLE_DIAMETER / 2, $fn = 16);
				}
			}
		}
 }; // end of the clip with holes
 // hook/tabl for the screwdriver.
 union() {
  TAB=5;
  BLADE=4; //width screwdriver blade.
  translate([14,-2,-CLIP_H/2]) {
   difference() {
    cube([TAB,3,CLIP_H]);
    translate([-0.1,1, (CLIP_H-BLADE)/2]) cube([3,BLADE/2,BLADE]);
   }
  }
 }
}
}

din_clip();

