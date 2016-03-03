// ISUE 2016

//constants
thickness     = 4;

ipd           = 68;          // change to your ipd
half_ipd      = ipd/2;
cam_width     = 40;
post_height   = 16;

// realsense dims
r_width       = 20;
r_length      = 130;
r_height      = 7;

height        = cam_width + r_width + 4;

translate([0, cam_width/4, 0]) {
  cube([ipd - cam_width, height, thickness], center=true);
}

// left cam
 translate([-half_ipd, 0, 0]) {
    difference() {
      $fn=50;
      minkowski() {
        translate([0, cam_width/4, 0])
        cube([cam_width, height, thickness], center=true);
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
                cylinder(h = post_height/2, r1 = 5, r2 = 3, $fs=.5);
            }
        }
    }
}


// right cam
translate([half_ipd, 0, 0]) {
    difference() {
      $fn=50;
      minkowski() {
        translate([0, cam_width/4, 0])
        cube([cam_width, height, thickness], center=true);
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
                cylinder(h = post_height/2, r1 = 5, r2 = 3, $fs=.5);
            }
        }
    }
}

// realsense holder

translate([r_length/2, cam_width/2 + r_width/2, thickness/2 + r_height/2]) {
  difference() {
    cube([4, r_width + 4, r_height+4], center=true);
    translate([-2, 0, 0]) {
      cube([5, r_width + 1, r_height + 1], center=true);
    }
  }

  
  translate([-r_length, 0, 0]) {
    rotate([0,0,180])
    difference() {
      cube([4, r_width + 4, r_height+4], center=true);
      translate([-2, 0, 0]) {
        cube([5, r_width + 1, r_height + 1], center=true);
      }
    }
  }
}

