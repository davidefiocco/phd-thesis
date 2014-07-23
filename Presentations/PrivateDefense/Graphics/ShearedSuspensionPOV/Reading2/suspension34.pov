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
			  0, -0.4, 1,
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
	 	 <0.391340149877,0.279403062907,0.582665288822>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.158365036018,0.417576405352,0.339362815814>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.867996710197,0.0989698823163,0.368249152446>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.403326769657,0.779989659568,0.117343650963>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.310202474113,0.00624769919982,0.240827226579>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.814847663247,0.092932662443,0.517809423051>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.516831313265,0.691721102596,0.50076471031>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.642976705629,0.119225470465,0.862079807269>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.159914308004,-0.169889035695,0.754026524907>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.124515475705,0.129047871118,0.476040401696>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.150432761179,0.418026266413,0.653719972685>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.44896879902,0.274418007218,0.727019540617>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.633754559011,0.00596261857141,0.732980565154>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.601942628534,0.35379996227,0.420389985393>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.205740053904,0.263889565804,0.213234071709>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.905904217601,0.171366121244,0.501660296255>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.561132323437,-0.10229443279,0.693414794826>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.269547680916,0.432384000809,0.164763066597>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.767853240281,0.0301959877399,0.527881966728>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.555988906139,-0.118265257451,0.551969406827>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.581272748015,0.369632428926,0.474957683263>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.229593108463,-0.188115351613,0.838940116431>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.448984316453,0.125379922528,0.189457578352>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.119631105341,-0.139497280361,0.81556340967>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.585875662461,-0.0979530152822,0.651264460057>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.316469260147,0.335783881938,0.847932132263>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.757068755276,0.0571239884727,0.717900200249>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.702359265821,0.0266670406416,0.190738374979>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.145016118237,0.324745423518,0.796848503028>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.260936689041,0.0934561033126,0.262479706617>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.731585473112,0.363226154204,0.400484456411>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.514110850249,0.323933213328,0.875795313475>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.729789299496,0.257614142556,0.619765258879>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.131203815355,0.463797063988,0.436631403601>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.870257776271,0.342388041397,0.223344903908>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.335082231302,-0.0848846298399,0.627171965615>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.837372074807,0.420469198595,0.709126628068>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.133809048008,-0.116373274522,0.654187221217>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.639322141637,0.30268374589,0.575956046315>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.479685951591,0.418919362727,0.336107000473>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.538576698475,0.0388305868253,0.852301595601>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.811363531542,0.794508209271,0.233543049664>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.553672973433,0.519436474425,0.420491140853>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.599053473735,-0.190861822777,0.653458801572>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.651188598023,0.573895916818,0.798528799072>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.132448430294,0.611847685387,0.575503155788>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.796156925944,0.352562603886,0.500947317411>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.825923198268,0.699199880502,0.128484045926>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.595461804613,0.378352844105,0.43501098022>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.161895716393,0.3051284008,0.676794656657>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.298504328958,0.383984362671,0.522140531736>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.524209316312,0.4947183033,0.245057913099>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.772623575404,0.0763630122901,0.267935586762>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.857680614974,0.461532844469,0.430477014756>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.363989340635,0.732423369629,0.385936410687>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.234184053657,-0.10375371103,0.876520051674>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.479733301692,0.317827466239,0.179498590929>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.647658133199,0.439080139036,0.526987833>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.457335728457,0.398419516449,0.716779300034>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.391045439849,0.0854174393517,0.604436499482>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
