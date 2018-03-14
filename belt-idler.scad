module beltIdler(width, height, depth) {

    include <node_modules/mcad/bearing.scad>
    include <node_modules/mcad/nuts_and_bolts.scad>
    
    module metallparts() {
        
        bearing(model=624,angle=[0,90,0]);
        bearing(model=624,angle=[0,-90,0]);
        
        rotate([0,90,0])cylinder(d=4,h=50,center=true);
    }
    
    module positive() {
        cube([width,height,depth],center=true);
    }
    
    difference() {
        positive();
        #metallparts();
    }
}

beltIdler(20,20,20);