eps = 0.1;
$fn = 180;
wall = 2.4;

UpperPart();
//BottomPart();


// bowl
bowlD = 180;
bowlX = 50;

bowlR = (pow(bowlX,2)+pow(bowlD,2)/4)/(2*bowlX);
echo(bowlR);
bowlZ = bowlR-bowlX;
bowlXm = bowlX-wall;
bowlRm = (pow(bowlXm,2)+pow(bowlD-2*wall,2)/4)/(2*bowlXm);
bowlZm = bowlRm-bowlXm;
echo(bowlRm);

extX = 130;
extY = 90;

screwsDistanceY = 10;
screwsDistanceZ = 6;

module ext() {
  difference() {
  intersection() {
    translate([0,0,-bowlZ])sphere(r=bowlR);
    cube([extX,extY,bowlR], center=true);
  }
  translate([0, 0, -bowlR])cube([extX+2*eps, extY+2*eps, 2*bowlR], center=true);
  }
}

module int() {
  difference() {
  intersection() {
    translate([0,0,-bowlZ])sphere(r=bowlR-wall);
    cube([extX-2*wall,extY-2*wall,bowlR-wall], center=true);
  }
  translate([0, 0, -bowlR-wall])cube([extX+2*eps, extY+2*eps, 2*(bowlR-wall)], center=true);
  }
}


module UpperPart() {
  difference() {
    union() {
      difference() {
        ext();
        color("red")int();
        translate([0,0,bowlX-wall-pirBase]) pir_sensor();
  //      translate([-eps, -eps, -eps]) cube([2*bowlR, 2*bowlR, 2*bowlR], center=false);
      }
      
      translate([-extX/2, -bottomY/2+screwsDistanceY,screwsDistanceZ]) rotate([0,-90,0])cylinder(d1=9, d2=7, h=1.35, center=false);
      translate([-extX/2, bottomY/2-screwsDistanceY,screwsDistanceZ]) rotate([0,-90,0])cylinder(d1=9, d2=7, h=1.35, center=false);
      translate([extX/2, -bottomY/2+screwsDistanceY,screwsDistanceZ]) rotate([0,90,0])cylinder(d1=9, d2=7, h=1.35, center=false);
      translate([extX/2, bottomY/2-screwsDistanceY,screwsDistanceZ]) rotate([0,90,0])cylinder(d1=9, d2=7, h=1.35, center=false);


    }
    translate([-extX/2-10, -bottomY/2+screwsDistanceY,screwsDistanceZ]) rotate([0,-90,0])screw(screwD = 2);
    translate([-extX/2-10, bottomY/2-screwsDistanceY,screwsDistanceZ]) rotate([0,-90,0])screw(screwD = 2);
    translate([extX/2+10, -bottomY/2+screwsDistanceY,screwsDistanceZ]) rotate([0,90,0])screw(screwD = 2);
    translate([extX/2+10, bottomY/2-screwsDistanceY,screwsDistanceZ]) rotate([0,90,0])screw(screwD = 2);

    translate([0, 0, -bowlR-wall])rotate([0,13,0,]) cylinder(d=8, h=200, center=false);
    
//    translate([0, 0, -bowlR-wall])rotate([0,13,0,]) cylinder(d=18, h=bowlD-bowlZ/2+0.*wall, center=false);

    translate([-extX/2+19, extY/2-wall-eps, -eps])nRFAntennaSlot();

  }
}

module nRFAntennaSlot() {
  union() {
    cube([10,wall+2*eps, 20], center=false);
    translate([5,0,20])rotate([-90,0,0])cylinder(d=10, h=wall+2*eps, center=false);
  }
}


// translate([0,0,bowlX-wall-pirBase+1]) pir_sensor();

  pirX = 23.5;
  pirY = 23.5;
  pirZ = 15;
  pirBase = 3.5;


module pir_sensor() {

color("gray") translate([-pirX/2, -pirY/2, 0]) 
  union() {
  difference() {
    union(){
      cube([pirX, pirY, pirBase], center=false);
      translate([pirX/2, pirY/2, pirZ-pirX/2]) sphere(r=pirX/2);
    }
    translate([0,0,-pirX])cube([pirX+eps, pirY+eps, pirX], center=false);
  }
    
  pirPCBX = 33;
  pirPCBY = 24;
  pirPCBZ = 1.5;
  translate([-(pirPCBX-pirX)/2, (pirPCBY-pirY)/2, -pirPCBZ])cube([pirPCBX, pirPCBY, pirPCBZ], center=false);
  }
}

///////


// BottomPart();

bottomX = extX - 2*wall;
bottomY = extY - 2*wall;
bottomZ = 10;

bottomIntX = bottomX - 2*wall;
bottomIntY = bottomY - 2*wall;
bottomIntZ = bottomZ - wall+eps;

headD = 10;
headH = 1;

module BottomPart() {
  union() {
    difference() {
      union(){
        translate([-bottomX/2, -bottomY/2,0])
          difference() {
            cube([bottomX, bottomY, bottomZ], center=false);
            translate([wall,wall,wall]) cube([bottomIntX, bottomIntY, bottomIntZ], center=false);
            
          }
        for (i=[-1:2:1]) {
          for(j=[-1:2:1]) {
            translate([j*(bottomX/2-8), i*(bottomY/2-8), wall-eps])cylinder(d1=headD+wall, d2=headD, h=headH+eps, center=false);
            translate([j*(bottomX/2-8), i*(bottomY/2-8), wall-eps])cylinder(d1=headD+wall, d2=headD, h=headH+eps, center=false);
          }
        }
        
      translate([-bottomX/2+wall-eps, -bottomY/2+screwsDistanceY,screwsDistanceZ]) rotate([0,90,0])cylinder(d1=7, d2=5, h=wall+eps, center=false);
      translate([-bottomX/2+wall-eps, bottomY/2-screwsDistanceY,screwsDistanceZ]) rotate([0,90,0])cylinder(d1=7, d2=5, h=wall+eps, center=false);
      translate([bottomX/2-wall+eps, -bottomY/2+screwsDistanceY,screwsDistanceZ]) rotate([0,-90,0])cylinder(d1=7, d2=5, h=wall+eps, center=false);
      translate([bottomX/2-wall+eps, bottomY/2-screwsDistanceY,screwsDistanceZ]) rotate([0,-90,0])cylinder(d1=7, d2=5, h=wall+eps, center=false);

      }
      for (i=[-1:2:1]) {
        for(j=[-1:2:1]) {
          translate([j*(bottomX/2-8), i*(bottomY/2-8), wall+headH+eps])screw();
          translate([j*(bottomX/2-8), i*(bottomY/2-8), wall+headH+eps])screw();
        }
      }
      
      translate([-bottomX/2-8, -bottomY/2+screwsDistanceY,screwsDistanceZ]) rotate([0,-90,0])screw(screwD = 2);
      translate([-bottomX/2-8, bottomY/2-screwsDistanceY,screwsDistanceZ]) rotate([0,-90,0])screw(screwD = 2);
      translate([bottomX/2+8, -bottomY/2+screwsDistanceY,screwsDistanceZ]) rotate([0,90,0])screw(screwD = 2);
      translate([bottomX/2+8, bottomY/2-screwsDistanceY,screwsDistanceZ]) rotate([0,90,0])screw(screwD = 2);
    }
    translate([53,6,wall-eps]) rotate([0,0,90]) ACDCPlateSupport();

    translate([60,-28,wall-3*eps]) rotate([0,0,90]) RelaySupport();

    translate([-ArduinoPlate_X-2,-ArduinoPlate_Y/2-6,wall])ArduinoPlateSupport();

  }
}

//translate([53,-25,ACDCPlateZOffset+wall]) rotate([0,0,90]) ACDCPlate();


ACDC_X = 25;
ACDC_Y = 50;
ACDC_Z = 1.5;
ACDCHolesX=20;
ACDCHolesY=43.5;
ACDCHolesD = 2.5;
ACDCPlateZOffset = 4;

module ACDCPlate() {
  translate([(ACDC_X-22)/2,(ACDC_Y-40)/2,ACDC_Z])color("gray")cube([22,40,20], center=false);
  color("green")
  difference() {
    cube([ACDC_X,ACDC_Y,ACDC_Z], center=false);
    for (i=[0:1]) {
      for (j=[0:1]) {
        translate([(ACDC_X-ACDCHolesX)/2+i*ACDCHolesX, (ACDC_Y-ACDCHolesY)/2+j*ACDCHolesY, -eps])cylinder(d=3, h=ACDC_Z+2*eps);
      }
    }
  }
}

module ACDCPlateSupport(){
  for (i=[0:1]) {
    for (j=[0:1]) {
      translate([(ACDC_X-ACDCHolesX)/2+i*ACDCHolesX, (ACDC_Y-ACDCHolesY)/2+j*ACDCHolesY, 0])
      difference(){
        cylinder(d1=3*ACDCHolesD, d2=2*ACDCHolesD, h=ACDCPlateZOffset, center=false);
        cylinder(d=ACDCHolesD, h=ACDCPlateZOffset+eps, center=false);
      }
    }
  }
}



Relay_X = 17.5;
Relay_Y = 57;
Relay_Z = 1.5;
RelayZOffset = ACDCPlateZOffset;

module RelayPlate() {
  color("green")
    cube([Relay_X,Relay_Y,Relay_Z], center=false);
}


RelaySupport_X = Relay_X+wall;
RelaySupport_Y = Relay_Y+wall;
RelaySupport_Z = RelayZOffset;

module RelaySupport() {
  difference() {
    cube([RelaySupport_X,RelaySupport_Y,RelaySupport_Z], center=false);
    translate([RelaySupport_X/2,RelaySupport_Y/2, RelaySupport_Z-Relay_Z])cube([Relay_X-wall/2,Relay_Y-wall/2,3*Relay_Z], center=true);
    for (i=[1:3]) {
      translate([RelaySupport_X+eps, (i/2*RelaySupport_Y-5)/2,0])rotate([0,0,90])cube([5,RelaySupport_Y+2*eps,1.5], center=false);
    }
  }
}



//

ArduinoPlate_X=50;
ArduinoPlate_Y=49;
ArduinoPlate_Z=1.5;

ArduinoPlateHolesX = 47;
ArduinoPlateHolesY = 46;
ArduinoPlateHoleD = 1;
ArduinoPlateZOffset = 4;

module ArduinoPlate(){
  color("red")
  difference() {
    cube([ArduinoPlate_X, ArduinoPlate_Y,ArduinoPlate_Z], center=false);
    for (i=[0:1]) {
      for (j=[0:1]) {
        translate([(ArduinoPlate_X-ArduinoPlateHolesX)/2+i*ArduinoPlateHolesX,(ArduinoPlate_Y-ArduinoPlateHolesY)/2+j*ArduinoPlateHolesY,-eps])cylinder(d=ArduinoPlateHoleD, h=ArduinoPlate_Z+2*eps, center=false);
      }
    }
  }
}

// translate([-ArduinoPlate_X,-ArduinoPlate_Y/2,ACDCPlateZOffset+wall])ArduinoPlate();

module ArduinoPlateSupport(){
  for (i=[0:1]) {
    for (j=[0:1]) {
      translate([(ArduinoPlate_X-ArduinoPlateHolesX)/2+i*ArduinoPlateHolesX,(ArduinoPlate_Y-ArduinoPlateHolesY)/2+j*ArduinoPlateHolesY,-eps])cylinder(d1=ArduinoPlateHoleD+2*wall, d2=ArduinoPlateHoleD+wall, h=ArduinoPlateZOffset+eps, center=false);
    }
  }
}

module screw(length=20, screwD = 4, headD = 9, headH = 2) {
  translate([0,0,-headH])
    union() {
      cylinder(d1=screwD, d2=headD, h=headH, center=false);
      translate([0,0,-length+eps])cylinder(d=screwD, h=length+eps, center=false);
    }
}

