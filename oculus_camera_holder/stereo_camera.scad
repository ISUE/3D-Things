// ISUE 2016

//constants
thickness   = 4;
ipd         = 68;               // change to your ipd
half_ipd    = ipd/2;
cam_width   = 40;
post_height = 16;

cube([ipd - cam_width, 40, thickness], center=true);

// left cam
translate([-half_ipd, 0, 0]) {
    difference() {
      $fn=50;
      minkowski() {
        cube([cam_width, cam_width, thickness], center=true);
      }
      translate([0,0,-(thickness/2 + 1)]) {
        cylinder(r=14, h=thickness + 2);
      }
    }

    // left posts
    for (i = [-1 : 2 : 1]) {
        for (j = [-1 : 2 : 1]) {
            translate([i*14,j*14, .4]) {
                difference() {
                    cylinder(h = post_height, r = 3, $fs=.5);
                    cylinder(h = post_height + 1, r = 1, $fs=.5);
                }
            }
        }
    }
}

// right cam
translate([half_ipd, 0, 0]) {
    difference() {
      $fn=50;
      minkowski() {
        cube([cam_width, cam_width, thickness], center=true);
      }
      translate([0,0,-(thickness/2 + 1)]) {
        cylinder(r=14, h=thickness + 2);
      }
    }

    // right posts
    for (i = [-1 : 2 : 1]) {
        for (j = [-1 : 2 : 1]) {
            translate([i*14,j*14, .4]) {
                difference() {
                    cylinder(h = post_height, r = 3, $fs=.5);
                    cylinder(h = post_height + 1, r = 1, $fs=.5);
                }
            }
        }
    }
}