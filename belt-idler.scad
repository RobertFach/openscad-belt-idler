module fixedBeltIdler(type="positive",width, height, depth) {

    include <node_modules/mcad/bearing.scad>
    include <node_modules/mcad/nuts_and_bolts.scad>
    
    
    var_bearing = 624;
    var_idlerWallWidth = 3;
    var_idlerScrewDistance = 15;
    var_washerThickness = 1.0; // M4
    
    var_idlerWidth = max(width, 2*bearingWidth(var_bearing)+2*var_idlerWallWidth+2*var_washerThickness);
    var_idlerDepth = max(depth, bearingOuterDiameter(var_bearing));
    var_idlerHeight = max(height, bearingOuterDiameter(var_bearing));
    
    var_clearance = 0.01;
    
    module metallparts() {
        
        bearing(model=624,angle=[0,90,0]);
        bearing(model=624,angle=[0,-90,0]);
        
        rotate([0,90,0])cylinder(d=4,h=50,center=true);
    }
    
    module positive() {
        difference() {
            cube([var_idlerWidth, var_idlerDepth, var_idlerHeight],center=true);
            cube([var_idlerWidth-2*var_idlerWallWidth, 2*var_idlerDepth, 2*var_idlerHeight],center=true);
            #metallparts();
        }
    }
    
    if (type=="positive") {
       positive();
    } else if (type=="boundingBox") {
        
    }
}

//fixedBeltIdler(type="positive",width=0,height=30,depth=20);
