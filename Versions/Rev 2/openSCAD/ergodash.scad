logox = 152.2; 
logoy = 130;
height=15;
module interior(){
    translate([0,0,height/2])
    resize([logox,logoy,height+3])
    import("ergodash-bottom.svg_10mm.stl", convextivity=5);
    color("orange")translate([57,95,-1.5])cube([39,35,height+3]);
}

module exterior(){
    minkowski(){resize([logox+10,logoy+10,height])interior();sphere(3);}
    //resize([logox+10,logoy+10,height])interior();
}

module hex(hole, wall, thick){
    hole = hole;
    wall = wall;
    difference(){
        rotate([0, 0, 30]) cylinder(d = (hole + wall), h = thick, $fn = 6);
        translate([0, 0, -0.1]) rotate([0, 0, 30]) cylinder(d = hole, h = thick + 0.2, $fn = 6);
    }
}

module bottom() {
    f=5;
    x=110;
    y=80;
    for(x = [0:10:x+10]) {   
        for(y = [0:17:y+10]) {
            translate([x,y,0])hex(0,10,f);
        }
        for(y = [8.5:17:y+10]) {
            translate([x+5,y,0])hex(0,10,f);
        }
    }
}

module bottom_line(x) {
    f=5;
    y=80;
    for(x = [0:10:x+10]) {   
            translate([x,0,0])hex(0,10,f);
    }
}

module finish(){
difference(){
    exterior();
    translate([5,5,5-2])interior();
    
    color("green")translate([57,95,1.5])cube([46.5,50,height+3]);
    
    color("pink")translate([115,109.5,1.5])cube([15,27,height+3]);
    color("blue")translate([116.75,118,0])minkowski(){cube([11.25,27,height+3]);cylinder(r=2,h=1);};
    color("black")translate([121.2,109.5,1.5])cube([7.8,30,height+3]);
    translate([23.5,45,-5])cube([2,2,50]);
    translate([23.5,102,-5])cube([2,2,50]);
    translate([55.25,126.5,-5])cube([2,2,50]);
    translate([62,52,-5])cube([2,2,50]);
    translate([61.5,87.5,-5])cube([2,2,50]);
    translate([112.5,45,-5])cube([2,2,50]);
    translate([118.5,104.5,-5])cube([2,2,50]);
    translate([141,47.5,-5])cube([2,2,50]);
    translate([-10,-10,-10])cube([200,200,10]);
    
    color("purple")
        translate([138,5.5,1.5])
        rotate([0,0,60])
        minkowski(){
            cube([37,50,20]);
            cylinder(r=2,h=1);
        };
}
}

module finish_hex() {
    difference(){
       finish();
       difference(){
           color("black")translate([9.5,32,0])bottom();
           color("red")translate([113,113,0])cube([30,20,10]);
           translate([24.5,46,0])cylinder(r=4,h=2);
           translate([24.5,103,0])cylinder(r=4,h=2);
           translate([62.5,88.5,0])cylinder(r=4,h=2);
           translate([63,53,0])cylinder(r=4,h=2);
           translate([119.5,105.5,0])cylinder(r=4,h=2);
           translate([113.5,46,0])cylinder(r=4,h=2);
       }
       difference(){
        color("black")translate([45,126,0])bottom_line(50);
           translate([55,126,0])bottom_line(-5);
       }
        color("black")translate([114,23,0])bottom_line(20);
        color("black")translate([139.5,32,0])bottom_line(9);
        color("black")translate([128.5,14.5,0])bottom_line(9);
    }
}
module plate(){
    resize([logox,logoy,2.5])
    import("ergodash-plate.png_2.5mm.stl", convextivity=5);
}
    //mirror()finish();
    //finish();
mirror()finish_hex();
    //plate();
//interior();