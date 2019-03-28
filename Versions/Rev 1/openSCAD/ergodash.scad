/*file = "ergodash-bottom.png";

logox = 152.2; 
logoy = 130; 
difference(){
resize([logox,logoy,20]) surface(file=file,invert=true);
    translate([0,0,-21])cube([logox, logoy, 11]);
}*/

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
    //color("purple")translate([137.5,7,1.5])cylinder(h=height+1, r1=2.5, r2=3);
}
}

module plate(){
    resize([logox,logoy,2.5])
    import("ergodash-plate.png_2.5mm.stl", convextivity=5);
}
    mirror()finish();
    //finish();
    //plate();
//interior();