import modevectors

from bboxtilt import *
L = 3.7345


cmd.load('aqs0.xyz')
cmd.load('aqs1.xyz')
cmd.do("select all")
cmd.do("hide everything")

cmd.do('split_states aqs0')
cmd.do('split_states aqs1')

cmd.show("spheres"   ,"aqs0")

drawBoundingBox(L, 0, 0)

cmd.set_view('\
	 0.959661365,   -0.030502243,    0.279496759,\
	-0.008625831,    0.990435481,    0.137705892,\
	-0.281024575,   -0.134561256,    0.950220346,\
	 0.000000000,    0.000000000,  -35.806385040,\
	-0.232582092,    0.305515289,   -0.126596928,\
	22.604660034,   49.008144379,   20.000000000' )

cmd.do("select all")
cmd.do("alter all, vdw = 0.5")
cmd.do("color white, all")
cmd.do("hide lines")
cmd.do("ray 500,500")
cmd.do("png quench-1, 500, 500")

cmd.do('run modevectors.py')

cmd.do('modevectors aqs0_0001, aqs1_0001')
cmd.do("ray 500,500")
cmd.do("png quench-0, 500, 500")

cmd.do("reinitialize")
cmd.load('aqs2.xyz')
cmd.show("spheres"   ,"aqs2")

drawBoundingBox(L, 0, 0)

cmd.set_view('\
	 0.959661365,   -0.030502243,    0.279496759,\
	-0.008625831,    0.990435481,    0.137705892,\
	-0.281024575,   -0.134561256,    0.950220346,\
	 0.000000000,    0.000000000,  -35.806385040,\
	-0.232582092,    0.305515289,   -0.126596928,\
	22.604660034,   49.008144379,   20.000000000' )
	
cmd.do("select all")
cmd.do("alter all, vdw = 0.5")
cmd.do("color white, all")
cmd.do("hide lines")
cmd.do("ray 500,500")
cmd.do("png quench-2, 500, 500")

