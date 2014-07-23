from pylab import *
from numpy.random import uniform, seed
from scipy.signal import sawtooth
from scipy.spatial.distance import *
import os

seed(21342137)

N = 60
radius = 0.05
L = 1
g1 = 0.6
dg = 0.04
g_max = 2*g1

f = lambda(x) : (abs(sawtooth((x*pi/g1 - pi/2))) - 0.5)*g1 

g_acc = arange(0, g_max+dg, dg)

g = f(g_acc)

coords = uniform(radius*2, L - 2*radius, (3, N))

def equilibrate(coords, radius, frac, steps):
	att = 0
	overlap = squareform(pdist(coords.T)) < 2*radius
	while sum(overlap) > N and att < steps:
		for i in range(shape(coords)[1]):
			if sum(overlap[:,i]) > 1:
				print "overlap!", att
				coords[:,i] += (rand(3) - 0.5)*frac*radius
		overlap = squareform(pdist(coords.T)) < 2*radius
		att += 1
	return coords

def evolve(g, coords, radius, frac):
	for i in range(size(g)-1):
		dg = g[i+1] - g[i]
		A = array([[1,0,dg], [0,1,0], [0,0,1]])
		coords = equilibrate(dot(A, coords), radius, frac, 4)
		outfile = open("suspension" + str(i).zfill(2) + ".txt", "w")
		for j in range(shape(coords)[1]):
			outfile.write("sphere {\n")
			outfile.write("\t \t <" + str(coords[1,j]) + "," + str(coords[0,j]) + "," + str(coords[2,j]) + ">," + str(radius) + " texture {pigment { color Black } finish { phong 0.8 }} \n")
			outfile.write("\t } \n \n")
		outfile.close()
		
		os.system("cat cube.pov suspension" + str(i).zfill(2) + ".txt > suspension" + str(i).zfill(2) + ".pov")
		os.system("sed -i 's/XXX/" + str(g[i+1]) +"/' suspension" + str(i).zfill(2) + ".pov")
		os.system("sed -i 's/YYY/" + str(L) +"/g' suspension" + str(i).zfill(2) + ".pov")
		os.system("sed -i 's/ZZZ/" + str(L/2.) +"/g' suspension" + str(i).zfill(2) + ".pov")
		
		#if i % 10 == 0:
			#mlab.points3d(coords[0, :], coords[1, :], coords[2, :], scale_factor = radius , scale_mode = 'scalar')
			#mlab.savefig('ciao' + str(i).zfill(2) + '.png')
		#mlab.clf()


