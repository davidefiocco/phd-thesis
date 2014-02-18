import matplotlib as mpl
mpl.use('Agg')
from pylab import *
from numpy import *
from scipy.optimize import minimize, fmin_cg, fmin, fmin_powell
from scipy.cluster.hierarchy import *
from scipy.spatial.distance import *
from scipy.cluster.vq import *
from scipy.signal import sawtooth
from utilz import *

random.seed(seed=4325349)

L = 6
dL = L/120.
t_max = pi/2 + 2*pi/10.
dt = 0.2/10.
N = 50

r0 = (rand(N,2) - 0.5)*L
rt = zeros_like(r0)
v0 = (rand(N,2) - 0.5)*L
t = abs(sawtooth(arange(pi/2, t_max, dt))) - 0.5

x = arange(-L/2.,L/2. + dL, dL)
y = arange(-L/2.,L/2. + dL, dL)

xx, yy = meshgrid(x, y)

idxs = range(size(x))

for i in range(size(r0[:,0])):
	rt[i] = minimum_image(r0[i], L)
z = get_z(x, y, rt, L)
minz = min(z.flatten())
maxz = max(z.flatten())

for k in range(size(t)):
	
	for i in range(size(r0[:,0])):
		rt[i] = minimum_image(r0[i] + v0[i]*t[k], L)
	
	z = get_z(x, y, rt, L)

	walkers = []

	#if k == 0:
	for i in range(1, size(idxs)-1):
		for j in range(1, size(idxs)-1):
			if z[i,j] < z[i-1, j] and z[i,j] < z[i+1, j] and z[i,j] < z[i, j-1] and z[i,j] < z[i, j+1]:
				if z[i,j] < z[i-1, j-1] and z[i,j] < z[i+1, j+1] and z[i,j] < z[i+1, j-1] and z[i,j] < z[i-1, j+1]:
					#plot([x[i]], [y[j]], 'o', color = 'k')
					walkers.append([x[i], y[j]])  
	
	walkers = array(walkers)

	fig = plt.figure(figsize=(4.,4.))
	ax = fig.add_subplot(111, aspect='equal')
	fig.subplots_adjust(left=0., bottom=0., right=1., top=1.)

	ax.set_xticklabels([])
	ax.set_yticklabels([])
	ax.set_xticks([])
	ax.set_yticks([])
	
	contour(yy, xx, z, levels = linspace(minz-(maxz-minz)*0.1, maxz + (maxz-minz)*0.1, 51))

	for i in range(size(walkers[:,0])):
		walkers[i] = minimum_image(fmin_powell(get_f, x0 = walkers[i], args = (rt, L), ftol = 1e-14, xtol = 1e-14, disp = 0), L)
		plot([walkers[i,0]], [walkers[i,1]], 'o', color = 'k')

	ax = gca()
	ax.set_xlim(-L/2.,L/2.)
	ax.set_ylim(-L/2.,L/2.)
	ax.set_aspect('normal')
			
	savefig('aqs-'+str(k).zfill(3) +'.png', bbox_inches = 'tight')
	
	print t[k]
	
	clf()
