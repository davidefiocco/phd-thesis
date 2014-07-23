import matplotlib as mpl
mpl.use('Agg')
from pylab import *
from numpy import *
from scipy.optimize import minimize, fmin_cg, fmin, fmin_powell
from scipy.cluster.hierarchy import *
from scipy.spatial.distance import *
from scipy.cluster.vq import *
from utilz import *

random.seed(seed=4325345)

L = 6
dL = L/120.
t_max = 1
dt = 0.02
N = 50
dec = 1

r0 = (rand(N,2) - 0.5)*L
rt = zeros_like(r0)
v0 = (rand(N,2) - 0.5)*L
t = hstack((arange(0.6, t_max, dt), arange(t_max, 0.6 - dt, -dt)))

x = arange(-L/2.,L/2. + dL, dL)
y = arange(-L/2.,L/2. + dL, dL)
xx, yy = meshgrid(x, y)

amin = array([0,0])

x2 = arange(-L/2.,L/2. + dL, 5*dL)
y2 = arange(-L/2.,L/2. + dL, 5*dL)
xx2, yy2 = meshgrid(x2, y2)
minmesh = vstack((xx2.flatten(), yy2.flatten())).T

walker = minimum_image(fmin(get_f, x0 = amin, args = (r0, L),  xtol=1e-4, ftol=1e-12, disp = 0), L)

for i in range(size(r0[:,0])):
	rt[i] = minimum_image(r0[i], L)
z = get_z(x, y, rt, L)
minz = min(z.flatten())
maxz = max(z.flatten())

for j in range(size(t)):
	
	for i in range(size(r0[:,0])):
		rt[i] = minimum_image(r0[i] + v0[i]*t[j], L)
	
	z = get_z(x, y, rt, L)

	fig = plt.figure(figsize=(5.,5.))
	ax = fig.add_subplot(111, aspect='equal')
	fig.subplots_adjust(left=0., bottom=0., right=1., top=1.)

	ax.set_xticklabels([])
	ax.set_yticklabels([])
	ax.set_xticks([])
	ax.set_yticks([])
	
	contour(yy, xx, z, levels = linspace(minz, maxz, 51))
	#pcolor(yy, xx, z)
	#colorbar()

	#plot(rt[:,0], rt[:,1], '.', color='k', markersize = 1)

	ax = gca()
	ax.set_xlim(-L/2.,L/2.)
	ax.set_ylim(-L/2.,L/2.)
	ax.set_aspect('normal')
	
	for i in range(shape(minmesh)[0]):
		print i
		amin = minimum_image(fmin_powell(get_f, x0 = minmesh[i], args = (rt, L),  xtol=1e-18, ftol=1e-18, disp = 0), L)
		plot([amin[0]], [amin[1]], 'o', color = 'k')
		
	walker = minimum_image(fmin(get_f, x0 = walker, args = (rt, L), ftol = 1e-18, xtol = 1e-18, disp = 0), L)
	plot([walker[0]], [walker[1]], 'o', color = 'r')
	
	savefig('aqs-t_'+str(j).zfill(3) +'.png', bbox_inches = 'tight')
	
	print t[j]
	
	clf()
