
difference() {
  $fn=50;
  minkowski() {
    cube([40, 40, .5], center=true);
    cylinder(r=2,h=.5);
  }
  translate([0,0,-1]) {
    cylinder(r=14, h=4);
  }
}
  
// cam 1
translate([14, 14, .4]) {
  difference() {
    cylinder(h = 16, r = 3, $fs=.5);
    cylinder(h = 16, r = 1, $fs=.5);
  }
}

translate([-14, -14, .4]) {
  difference() {
    cylinder(h = 16, r = 3, $fs=.5);
    cylinder(h = 16, r = 1, $fs=.5);
  }
}

translate([14, -14, .4]) {
  difference() {
    cylinder(h = 16, r = 3, $fs=.5);
    cylinder(h = 16, r = 1, $fs=.5);
  }
}

translate([-14, 14, .4]) {
  difference() {
    cylinder(h = 16, r = 3, $fs=.5);
    cylinder(h = 16, r = 1, $fs=.5);
  }
}
