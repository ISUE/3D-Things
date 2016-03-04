// ISUE 2016

//constants
thickness     = 2;

ipd           = 68; // change to your ipd
half_ipd      = ipd/2;
cam_width     = 40;
post_height   = 16;

// realsense dims
r_width       = 20;
r_length      = 130;
r_height      = 9;

height        = cam_width + r_width + 4;
/*
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
  */
  
cap_thickness = 4;
translate([0,0,thickness/2 + r_height/2]) {
  
  translate([r_length/2, 0, 0]) {
    difference() {
        cube([cap_thickness, r_width + cap_thickness, r_height+cap_thickness], center=true);
        translate([-cap_thickness / 2, 0, 0]) {
            cube([cap_thickness + 1, r_width, r_height], center=true);
        }
    }
  }

  
  translate([-r_length/2, 0, 0]) {
    difference() {
      cube([cap_thickness, r_width + cap_thickness, r_height+cap_thickness], center=true);
      translate([0, 0, 0]) {
        cube([cap_thickness + 1, r_width, r_height], center=true);
      }
    }
  }

}

mag_width = 27.5;
mag_height = 18.6;
mag_depth = 1.2;
//translate([0, cam_width/2 + r_width/2, 0]) {
translate() {
difference() {
    cube([r_length + 4, r_width + 4, thickness], center=true);
    translate([-r_length/2 + mag_width / 2,0,thickness/2 - mag_depth/2])
    cube([mag_width, mag_height, mag_depth], center=true);
}
   
translate([0,r_width/2 + cap_thickness/4,r_height/2]) {
cube([r_length + 4, cap_thickness/2, r_height], center=true);
}
}

