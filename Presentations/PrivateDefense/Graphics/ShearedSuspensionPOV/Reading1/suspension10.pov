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
			  0, -0.14, 1,
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
	 	 <0.391340149877,0.430896038001,0.582665288822>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.158365036018,0.505810737464,0.339362815814>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.867996710197,0.194714661952,0.368249152446>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.403326769657,0.810499008819,0.117343650963>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.309524910805,0.0753101554842,0.245094971852>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.823367105043,0.242433879724,0.519514915453>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.516831313265,0.821919927276,0.50076471031>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.642976705629,0.343366220355,0.862079807269>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.160193232193,0.0248417234843,0.753060359966>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.124515475705,0.252818375559,0.476040401696>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.150118793625,0.586366958976,0.656315157682>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.44896879902,0.463443087778,0.727019540617>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.633754559011,0.196537565511,0.732980565154>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.602684412581,0.484087834686,0.410358757161>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.205740053904,0.319330424449,0.213234071709>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.906180848374,0.301883274283,0.499530913713>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.546789469701,0.0791058724844,0.699297825416>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.269547680916,0.475222398125,0.164763066597>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.756566782548,0.165343726244,0.537350567838>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.555988906139,0.0252467883242,0.551969406827>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.590411784626,0.492208690789,0.468887358535>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.228037071046,0.0296284113166,0.842626809217>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.448984316453,0.174638892899,0.189457578352>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.109755435131,0.0767119200148,0.820258674084>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.572514538991,0.0759816077284,0.662021400023>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.316469260147,0.556246236326,0.847932132263>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.757068755276,0.243778040537,0.717900200249>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.702359265821,0.0762590181362,0.190738374979>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.145016118237,0.531926034305,0.796848503028>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.260887452666,0.161349194211,0.261622745841>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.731585473112,0.467352112871,0.400484456411>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.514110850249,0.551639994832,0.875795313475>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.731250358132,0.413514457742,0.619261675369>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.131203815355,0.577321228925,0.436631403601>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.870257776271,0.400457716413,0.223344903908>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.335082231302,0.07818008122,0.627171965615>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.837372074807,0.604842121893,0.709126628068>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.133809048008,0.0537154029948,0.654187221217>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.645345769373,0.452657968565,0.575586644385>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.480414071665,0.501289672383,0.327043429624>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.538576698475,0.260429001682,0.852301595601>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.811363531542,0.855229402184,0.233543049664>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.553672973433,0.628764171047,0.420491140853>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.608585196525,-0.00398252127705,0.6553224728>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.651188598023,0.781513404576,0.798528799072>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.132448430294,0.761478505892,0.575503155788>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.796156925944,0.482808906413,0.500947317411>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.825923198268,0.732605732443,0.128484045926>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.610726238907,0.499995769477,0.416569977508>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.165347321483,0.483252546409,0.679746517266>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.298504328958,0.519740900922,0.522140531736>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.529599842186,0.558112256084,0.252150042234>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.772623575404,0.146026264848,0.267935586762>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.857680614974,0.573456868305,0.430477014756>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.363989340635,0.832766836408,0.385936410687>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.230066683152,0.12421245152,0.880452965601>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.479733301692,0.364497099881,0.179498590929>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.647658133199,0.576096975616,0.526987833>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.457335728457,0.584782134458,0.716779300034>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.391045439849,0.242570929217,0.604436499482>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 