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
			  0, -0.24, 1,
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
	 	 <0.391340149877,0.372629509118,0.582665288822>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.158365036018,0.471874455882,0.339362815814>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.867996710197,0.157889746708,0.368249152446>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.403326769657,0.798764643722,0.117343650963>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.30936018578,0.0541282343007,0.247960031834>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.814814620302,0.200259934504,0.511274768319>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.516831313265,0.771843456245,0.50076471031>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.642976705629,0.257158239628,0.862079807269>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.149386449482,-0.0513796062888,0.758781159419>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.124515475705,0.205214335389,0.476040401696>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.157452268255,0.52272288778,0.659061131595>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.44896879902,0.390741133717,0.727019540617>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.633754559011,0.123239508996,0.732980565154>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.581503447558,0.440277011923,0.399565045193>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.205740053904,0.298007017278,0.213234071709>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.905904217601,0.251631768645,0.501660296255>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.555437656814,0.00877581610988,0.699309794373>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.269547680916,0.458746091465,0.164763066597>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.757338387085,0.127327161546,0.536435839925>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.555988906139,-0.0299501523585,0.551969406827>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.586726051585,0.441828239564,0.456675741069>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.229803042495,-0.0548368610775,0.844543640587>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.448984316453,0.155693135064,0.189457578352>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.107151350146,-0.00776767123348,0.814554224606>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.572181252445,0.0218985440856,0.65919002623>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.316469260147,0.4714530231,0.847932132263>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.757068755276,0.171988020513,0.717900200249>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.702359265821,0.0571851806383,0.190738374979>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.145016118237,0.452241184002,0.796848503028>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.262984406316,0.138629050555,0.254788666359>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.731585473112,0.42730366723,0.400484456411>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.514110850249,0.464060463484,0.875795313475>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.730910400384,0.355380380724,0.624534626076>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.131203815355,0.533658088565,0.436631403601>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.870257776271,0.378123226023,0.223344903908>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.335082231302,0.0154628846585,0.627171965615>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.837372074807,0.533929459086,0.709126628068>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.133809048008,-0.0117033191269,0.654187221217>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.645017346805,0.39696947233,0.576724345707>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.481761634088,0.475177195896,0.334269113989>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.538576698475,0.175198842122,0.852301595601>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.811363531542,0.831875097218,0.233543049664>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.553672973433,0.586715056962,0.420491140853>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.604461400409,-0.0836941855651,0.658998351729>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.651188598023,0.701660524669,0.798528799072>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.132448430294,0.703928190313,0.575503155788>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.796156925944,0.432714174672,0.500947317411>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.825923198268,0.71975732785,0.128484045926>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.619402779018,0.4479455785,0.430531746191>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.166539971574,0.41446091351,0.678439429821>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.298504328958,0.467526847748,0.522140531736>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.528075926582,0.537372694035,0.243915778372>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.772623575404,0.119232706172,0.267935586762>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.857680614974,0.530409166829,0.430477014756>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.363989340635,0.794173195339,0.385936410687>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.229703624637,0.0317536016978,0.877892638912>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.479733301692,0.346547240788,0.179498590929>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.647658133199,0.523398192316,0.526987833>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.457335728457,0.513104204454,0.716779300034>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
sphere {
	 	 <0.391045439849,0.182127279269,0.604436499482>,0.05 texture {pigment { color Black } finish { phong 0.8 }} 
	 } 
 
