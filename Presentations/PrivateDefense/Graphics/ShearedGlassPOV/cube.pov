#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "skies.inc"

//Place the camera
camera {
  orthographic
  sky <0,0,1>          //Don't change this
  direction <-1,0,0>   //Don't change this  
  location  <6,2,1.5>  //Change this to move the camera to a different point
  look_at   <0.5,0.5,0.5>    //Change this to aim the camera at a different point
  right <-4/3,0,0>     //Don't change this
  angle 25
}

//Place a light
light_source {
  <600, 200, 800>  //Change this if you want to put the light at a different point
  color White*2
}

//Set a background color
background { color White*2 }

//Create a "floor"
plane {
  <0,0,-1>,0
  texture {T_Wood1}
}

plane {
  <0,-1,0>,0
  texture {pigment {color rgbt<1,1,1,0.6>}}
}

//Create a box that extends between the 2 specified points

#declare mycube = box {
  <0,0,0>  // one corner position <X1 Y1 Z1>
  <1,1,1>  // other corner position <X2 Y2 Z2>
  
  matrix< 1 , 0, 0,
		  0 , 1, 0,
          0 , 0.3*(2*abs(2*((-clock-7.5)/30. - floor((-clock-7.5)/30. + 0.5)))-1), 1,
          0 , 0, 0 >
  
}

global_settings { charset utf8 }
text {
    ttf "DejaVuSans.ttf" "\u03b8" 0.1, 0
    rotate <90, 0, 0>
    rotate <0, 0, 90>
    translate <5,-0.5,1.8>
    scale 0.2
    pigment { color rgbt<0,0,1,0.2> }
	no_shadow
  }

object { mycube texture{pigment {White} finish { phong 0.8 }}}
//object { mycube texture {T_Silver_2A finish { ambient 0. diffuse 0} } }
