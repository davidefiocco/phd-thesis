import os
from fnmatch import *
from pylab import *
from bboxtilt import *
from numpy import *

os.chdir('.') #modify here
L = 3.7345

li = os.listdir('.')

data = loadtxt('thermo.log')
strain = data[:,2]

for i in arange(0, 1200, 30):

	cmd.load('confs/aqs'+str(i)+'.xyz')
	#cmd.do('set sphere_color, red')
	cmd.show("spheres"   ,"all")

	drawBoundingBox(L, strain[i/2], 0)

	cmd.set_view('\
		 0.959661365,   -0.030502243,    0.279496759,\
		-0.008625831,    0.990435481,    0.137705892,\
		-0.281024575,   -0.134561256,    0.950220346,\
		 0.000000000,    0.000000000,  -35.806385040,\
		-0.232582092,    0.305515289,   -0.126596928,\
		22.604660034,   49.008144379,   20.000000000' )

	cmd.do("ray 400,400")
		
	cmd.do("png confs/aqs"+str(i/30)+ ", 500, 500")
	
	cmd.do("reinitialize")
		
