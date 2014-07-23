#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "glass.inc"

global_settings {
    assumed_gamma 2.2
    max_trace_level 5

    photons {
        count 20000
    }
}

#declare LIGHT_FADING_DIST = 20.0;

background { Gray50 }

light_source {
    < 50,  0, 0> color Gray60
    fade_distance LIGHT_FADING_DIST fade_power 2

    photons {
        reflection off
        refraction on
    }
}

light_source {
    < 40, 20, 20> color Gray60
    fade_distance LIGHT_FADING_DIST fade_power 2

    photons {
        reflection off
        refraction on
    }
}

light_source {
    < 40, -20, 20> color Gray60
    fade_distance LIGHT_FADING_DIST fade_power 2

    photons {
        reflection off
        refraction on
    }
}

light_source {
    < 0, 0, -40> color Gray80
    fade_distance LIGHT_FADING_DIST fade_power 2

    photons {
        reflection off
        refraction on
    }
}

plane {
    y, -30
    pigment { color Gray50 }
    finish { reflection 0.35}
}

//Place the camera
camera {
  orthographic
  sky <0,0,1>
  direction <-1,0,0>   //Don't change this  
  location  <6,2,1.5>  //Change this to move the camera to a different point
  look_at   <0.5,0.5,0.5>    //Change this to aim the camera at a different point
  right <-4/3,0,0>     //Don't change this
  angle 25
}

//Create a box that extends between the 2 specified points

#declare mycube = box {
  <0,0,0>  // one corner position <X1 Y1 Z1>
  <1,1,1>  // other corner position <X2 Y2 Z2>
  
	matrix< 1 , 0, 0,
			  0 , 1, 0,
			  0, 0.0, 1,
			  0 , 0, 0 >

	texture {

		pigment { Gray filter .98 }

		finish {
			phong 1 phong_size 0
			reflection 0.0
		}
	}

	interior {
		ior 1.0
		fade_color Gray
		fade_distance 10
		fade_power 1001
	}		

}

object { 	
	mycube 
}
sphere {
	 	 <0.391340149877,0.512469178436,0.582665288822>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.158365036018,0.553321531678,0.339362815814>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.867996710197,0.246269543295,0.368249152446>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.403326769657,0.826927119954,0.117343650963>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.306961568563,0.10950806077,0.244185261341>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.812788382919,0.320036099532,0.514692041108>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.516831313265,0.89202698672,0.50076471031>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.642976705629,0.464057393373,0.862079807269>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.147115920278,0.131033893906,0.766348837676>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.124515475705,0.319464031796,0.476040401696>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.157452268255,0.680897559363,0.659061131595>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.44896879902,0.565225823465,0.727019540617>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.633754559011,0.299154844633,0.732980565154>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.581911312493,0.532006972668,0.395398536371>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.205740053904,0.349183194488,0.213234071709>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.905904217601,0.372030239746,0.501660296255>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.556624039926,0.173752628306,0.688990055854>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.269547680916,0.498289227448,0.164763066597>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.754425377315,0.25790778977,0.54021243116>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.555988906139,0.10252250528,0.551969406827>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.591264457249,0.549801994704,0.457215009102>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.227626866931,0.143174695119,0.845465897237>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.448984316453,0.201162953868,0.189457578352>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.102857475652,0.194026448847,0.817209250701>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.567285014988,0.183281953703,0.659903693121>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.316469260147,0.674956734843,0.847932132263>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.757068755276,0.344284068572,0.717900200249>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.702359265821,0.102962390633,0.190738374979>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.145016118237,0.643484824729,0.796848503028>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.262612903504,0.201202223427,0.255621325625>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.731585473112,0.523419936769,0.400484456411>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.514110850249,0.674251338718,0.875795313475>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.730910400384,0.505268690982,0.624534626076>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.131203815355,0.638449625429,0.436631403601>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.870257776271,0.43172600296,0.223344903908>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.335082231302,0.165984156406,0.627171965615>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.837372074807,0.704119849822,0.709126628068>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.133809048008,0.145301613965,0.654187221217>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.645017346805,0.5353833153,0.576724345707>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.481761634088,0.555401783254,0.334269113989>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.538576698475,0.379751225066,0.852301595601>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.811363531542,0.887925429137,0.233543049664>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.553672973433,0.687632930767,0.420491140853>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.604461400409,0.0744654188498,0.658998351729>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.651188598023,0.893307436446,0.798528799072>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.132448430294,0.842048947702,0.575503155788>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.796156925944,0.55294153085,0.500947317411>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.825923198268,0.750593498872,0.128484045926>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.615195913392,0.550812009511,0.431457270682>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.166539971574,0.577286376667,0.678439429821>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.298504328958,0.592840575365,0.522140531736>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.528075926582,0.595912480844,0.243915778372>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.772623575404,0.183537246995,0.267935586762>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.857680614974,0.633723650371,0.430477014756>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.363989340635,0.886797933904,0.385936410687>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.227615166434,0.231524626553,0.866878193153>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.479733301692,0.389626902611,0.179498590929>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.647658133199,0.649875272236,0.526987833>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.457335728457,0.685131236463,0.716779300034>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.391045439849,0.327192039145,0.604436499482>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
