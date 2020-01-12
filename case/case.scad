use <MCAD-master/boxes.scad>;
use <ruler.scad>;
use <fillets.scad>;

//ruler(length = 150, t=[34,-30,30], r=[90,0,0]);

$fn = 130;
eps= 0.1;

case_X = 120;
case_Y = 70;
case_Z = 48;

clerance = 0.2;

bottom_part_h = 12;
bottom_part_clerance = 2;
wall = 2.4;
fillet_r = 5;

mounting_points_dist = 6.4;

// pcb support pins dimmensions
pcb_pins_x = 82;
pcb_pins_y = 52;
pcb_pins_dia = 7.4;
pcb_pins_h = 6;
pcb_pins_insert_dia = 4;
pcb_pins_insert_depth = 4;

// bottom_part();

module bottom_part() {
  union() {
    difference() {
      union() {
        difference() {
          union() {
            difference() {
              union() {
                roundedBox([case_X, case_Y, bottom_part_h-bottom_part_clerance], fillet_r, true);
                translate([0,0,bottom_part_clerance/2])roundedBox([case_X-wall-clerance, case_Y-wall-clerance, bottom_part_h], fillet_r-wall/2-clerance/2, true);
                
              }
              translate([0,0,wall]) roundedBox([case_X-2*wall, case_Y-2*wall, bottom_part_h], fillet_r-wall, true);
              translate([-48,0,-bottom_part_h/2]) cables_hole();
            }
            //fillets
            translate([case_X/2-wall,case_Y/2-wall,-bottom_part_h/2+wall])rotate([90,-90,0])fillet_linear_i(l=case_Y-2*wall, fillet_r=1, fillet_angle=90, fillet_fn=$fn, add=0.02);
            translate([-case_X/2+wall,case_Y/2-wall,-bottom_part_h/2+wall])rotate([90,0,0])fillet_linear_i(l=case_Y-2*wall, fillet_r=1, fillet_angle=90, fillet_fn=$fn, add=0.02);
            translate([-case_X/2+wall,case_Y/2-wall,-bottom_part_h/2+wall])rotate([0,-90,180])fillet_linear_i(l=case_X-2*wall, fillet_r=1, fillet_angle=90, fillet_fn=$fn, add=0.02);
            translate([case_X/2-wall,-case_Y/2+wall,-bottom_part_h/2+wall])rotate([0,-90,0])fillet_linear_i(l=case_X-2*wall, fillet_r=1, fillet_angle=90, fillet_fn=$fn, add=0.02);

            // mounting points
            for (
              x = [case_X/2-mounting_points_dist, -case_X/2+mounting_points_dist],
              y = [case_Y/2-mounting_points_dist, -case_Y/2+mounting_points_dist],
              z = [-bottom_part_h/2+wall]) {
              translate([x,y,z]) cylinder(r=4.8, h=2);
              translate([x,y,z]) fillet_polar_i(inner_r=4.8, fillet_r=1, fillet_angle=90, fillet_fn=8, rotate_fn=$fn);
            }
          }
          // mounting points holes
          for (
            x = [case_X/2-mounting_points_dist, -case_X/2+mounting_points_dist],
            y = [case_Y/2-mounting_points_dist, -case_Y/2+mounting_points_dist],
            z = [-bottom_part_h/2+wall+2+eps]) {
            translate([x,y,z]) mounting_point_hole(Dk=7,d=3.5,l=25);
          }
        }
        // pcb support pins
        translate([-(case_X-pcb_pins_x)/2+18,-(case_Y-pcb_pins_y)/2+7,0])for (
          x = [-pcb_pins_x/2, pcb_pins_x/2],
          y = [-pcb_pins_y/2, pcb_pins_y/2],
          z = [-bottom_part_h/2+wall]) {
          translate([x,y,z]) cylinder(d=pcb_pins_dia, h=pcb_pins_h);
          translate([x,y,z]) fillet_polar_i(inner_r=pcb_pins_dia/2, fillet_r=1, fillet_angle=90, fillet_fn=8, rotate_fn=$fn);

        }
      }
      translate([-(case_X-pcb_pins_x)/2+18,-(case_Y-pcb_pins_y)/2+7,0]) for (
        x = [-pcb_pins_x/2, pcb_pins_x/2],
        y = [-pcb_pins_y/2, pcb_pins_y/2],
        z = [-bottom_part_h/2+wall+pcb_pins_h+eps]) {
        translate([x,y,z]) mounting_point_hole(Dk=pcb_pins_insert_dia+1,d=pcb_pins_insert_dia, l=pcb_pins_insert_depth);
      }
    }
    //led support with holes
    translate ([-case_X/2+led_support_offset,-case_Y/2,-(bottom_part_h-bottom_part_clerance)/2]) led_support();
    //rf antenna support
    translate ([case_X/2,-case_Y/2+rf_support_offset,-(bottom_part_h-bottom_part_clerance)/2]) rotate([0,0,90]) rf_support();
    //rf pcb support
    translate ([-case_X/2+rf_pcb_support_offset_x+rf_pcb_support_y,-case_Y/2+rf_pcb_support_offset_y,-(bottom_part_h-bottom_part_clerance)/2]) rotate([0,0,90]) rf_pcb_support();
    //reset switch support
    translate ([-case_X/2+reset_support_offset_x,case_Y/2-reset_support_offset_y,-(bottom_part_h-bottom_part_clerance)/2]) reset_switch_support();
  }
}

module mounting_point_hole(Dk=8,d=4, l=25) {
  rotate([180,0,0])union(){
    cylinder(d1=Dk+clerance, d2=0, h=(Dk+clerance)/2*tan(45));
    cylinder(d1=d+clerance, d2=d+clerance, h=l);
  }
}

// led_support
led_support_x = 30;
led_support_y = wall;
led_support_z = 24;
led_support_offset = 29.3;
leds_offset_x = 7.5;
leds_offset_z = 18;
led_dia = 5.6;

module led_support(top=false) {
  if (top == false) {
    difference() {
      cube([led_support_x,led_support_y,led_support_z], false);
      for ( i = [1: 3]) {
          translate([i*leds_offset_x,-eps,leds_offset_z]) rotate([-90,0,0]) cylinder(d=led_dia, h=wall+2*eps);
        }
    }
  }
  else {
    cube([led_support_x,led_support_y+2*eps,led_support_z], false);
  }
}

// rf support
rf_support_x = 18;
rf_support_y = wall;
rf_support_z = 28.1;
rf_support_offset = 6;
rf_support_hole_dia = 10.4;
rf_support_hole_offset = 9;

module rf_support(top=false) {
  if (top == false)
    difference(){
      cube([rf_support_x, rf_support_y, rf_support_z], false);
      translate([rf_support_hole_offset, -eps, rf_support_z])rotate([-90,0,0])cylinder(d=rf_support_hole_dia, wall+2*eps);
    }
  else
    union() {
      cube([rf_support_x, rf_support_y+2*eps, rf_support_z], false);
      translate([rf_support_hole_offset, -eps, rf_support_z])rotate([-90,0,0])cylinder(d=rf_support_hole_dia, wall+3*eps);
    }
}

// rf pcb support
rf_pcb_support_x = 20;
rf_pcb_support_y = 4;
rf_pcb_support_z = 20;
rf_pcb_support_offset_x = 105;
rf_pcb_support_offset_y = 4.8;
rf_pcb_support_hole_x = 9;
rf_pcb_support_hole_z = 3;
rf_pcb_support_hole_offset = 5.5;

module rf_pcb_support() {
  difference() {
    cube([rf_pcb_support_x, rf_pcb_support_y, rf_pcb_support_z], false);
    translate([rf_pcb_support_hole_offset, -eps,rf_pcb_support_z-rf_pcb_support_hole_z]) cube([rf_pcb_support_hole_x, rf_pcb_support_y+2*eps,rf_pcb_support_hole_z+eps], false); 
  }
}

//reset switch support
reset_support_x = 12;
reset_support_y = wall;
reset_support_z = 18;
reset_support_offset_x = 68.5;
reset_support_offset_y = wall;
reset_support_hole_dia = 2;
reset_support_hole_offset_x = 6;
reset_support_hole_offset_y = -eps;
reset_support_hole_offset_z = reset_support_z - 4.1;

module reset_switch_support(top=false) {
  if (top == false)
    difference() {
      cube([reset_support_x, reset_support_y, reset_support_z], false);
      translate([reset_support_hole_offset_x, reset_support_hole_offset_y, reset_support_hole_offset_z])rotate([-90,0,0])cylinder(d=reset_support_hole_dia, h=reset_support_y+2*eps);
    }
  else
    cube([reset_support_x, reset_support_y+2*eps, reset_support_z], false);
}

module cables_hole() {
  translate([0,-25/2,0])
  union() {
    cylinder(d=10, h=2*wall);
    translate([-5,0,0])cube([10,25,2*wall], center = false);
    translate([0,25,0])cylinder(d=10, h=2*wall);
  }
}

// top part

top_part_x = case_X;
top_part_y = case_Y;
top_part_z = case_Z - bottom_part_h;
top_part_clerance = bottom_part_clerance;

module top_part() {
  union() {
    difference() {
      roundedBox([top_part_x, top_part_y, top_part_z], fillet_r, true);
      translate([0,0,top_part_z/2-top_part_clerance/2-clerance])roundedBox([top_part_x-wall-clerance, top_part_y-wall-clerance,  top_part_clerance+3*clerance], fillet_r-wall/2-clerance/2, true);
      translate([0,0,wall])roundedBox([top_part_x-2*wall, top_part_y-2*wall, top_part_z], fillet_r-wall, true);
      //led support
      translate ([top_part_x/2-led_support_offset-led_support_x,-top_part_y/2-eps,top_part_z/2+bottom_part_h-top_part_clerance-led_support_z])led_support(top=true);
      //rf support
      translate ([-top_part_x/2-eps,-top_part_y/2+rf_support_offset,top_part_z/2+bottom_part_h-top_part_clerance])rotate([180,0,90])rf_support(top=true);
      // reset switch
      translate ([top_part_x/2-reset_support_x-reset_support_offset_x,top_part_y/2-wall-eps,top_part_z/2+bottom_part_h-top_part_clerance-reset_support_z])reset_switch_support(top=true);
      //pir hole
      translate([0,0,-top_part_z/2+wall+3-1])pir_template();
      //light sensor hole
      translate([-top_part_x/4,top_part_y/4,-top_part_z/2+wall+eps]) rotate([180,0,0]) cylinder(d=6, h=2*wall);  
    //  translate([-top_part_x/4,top_part_y/4,-top_part_z/2+wall-1.5]) rotate([0,0,0]) cylinder(d=20, h=2*wall);  
    }
    translate([-top_part_x/4+4,top_part_y/4-4.5,-top_part_z/2+wall+eps]) rotate([0,0,0]) {
      cylinder(d=2.6, h=2*wall);  
      fillet_polar_i(inner_r=2.6/2, fillet_r=1.5, fillet_angle=90, fillet_fn=8, rotate_fn=$fn);
    }

    translate([-top_part_x/4+4,top_part_y/4+4.5,-top_part_z/2+wall+eps]) rotate([0,0,0]) {
      cylinder(d=2.6, h=2*wall);  
      fillet_polar_i(inner_r=2.6/2, fillet_r=1.5, fillet_angle=90, fillet_fn=8, rotate_fn=$fn);
    }
  // fillets inside
  translate([top_part_x/2-wall,top_part_y/2-wall,-top_part_z/2+wall])rotate([90,-90,0])fillet_linear_i(l=top_part_y-2*wall, fillet_r=1, fillet_angle=90, fillet_fn=$fn, add=0.02);
  translate([-top_part_x/2+wall,top_part_y/2-wall,-top_part_z/2+wall])rotate([90,0,0])fillet_linear_i(l=top_part_y-2*wall, fillet_r=1, fillet_angle=90, fillet_fn=$fn, add=0.02);
  translate([-top_part_x/2+wall,top_part_y/2-wall,-top_part_z/2+wall])rotate([0,-90,180])fillet_linear_i(l=top_part_x-2*wall, fillet_r=1, fillet_angle=90, fillet_fn=$fn, add=0.02);
  translate([top_part_x/2-wall,-top_part_y/2+wall,-top_part_z/2+wall])rotate([0,-90,0])fillet_linear_i(l=top_part_x-2*wall, fillet_r=1, fillet_angle=90, fillet_fn=$fn, add=0.02);

  }
}

// pir template
module pir_template() {
  translate([-23.5/2, 23.5/2,0]) rotate([180,0,0])
  union(){
    cube([23.5,23.5,3], false);
    translate([23.5/2, 23.5/2,3-eps])cylinder(d=23.5, h=2*wall);
  }
}

//bottom_part();
top_part();

/*
color("blue",0.9)translate([0,0,case_Z/2-top_part_clerance/2])rotate([0,180,0])bottom_part();               
color("grey",0.4)top_part();
*/