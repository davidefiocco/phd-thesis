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
from matplotlib import rc
rc('text', usetex=True, fontsize = 18)

random.seed(seed=4325349)

L = 6
dL = L/140.
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

walkers = []

for i in range(size(r0[:,0])):
	rt[i] = minimum_image(r0[i] + v0[i]*t[0], L)

z = get_z(x, y, rt, L)

nlevels = 100

for k in array([1, 10, 13, 15, 20, 22]):

	print k

	fig = plt.figure(figsize=(4.,4.))
	ax = fig.add_subplot(111, aspect='equal')
	fig.subplots_adjust(left=0., bottom=0., right=1., top=1.)
	
	ax.set_xticklabels([])
	ax.set_yticklabels([])
	ax.set_xticks([])
	ax.set_yticks([])
	
	ax.text(1.3, 2.5, '$U = ' + str((maxz - minz)/nlevels*k)[:4] + '$', fontsize = 20, color='k', bbox=dict(facecolor='none', edgecolor='k'))
	
	maxz = max(z.flatten())
	minz = min(z.flatten())
	contourf(yy, xx, z, levels = [minz, minz + (maxz - minz)/nlevels*k, maxz])

	ax = gca()
	ax.set_xlim(-L/2.,L/2.)
	ax.set_ylim(-L/2.,L/2.)
	ax.set_aspect('normal')
			
	savefig('landscape'+str(k)+'.png', bbox_inches = 'tight')
	
	clf()
	
fig = plt.figure(figsize=(4.,4.))
ax = fig.add_subplot(111, aspect='equal')
fig.subplots_adjust(left=0., bottom=0., right=1., top=1.)

ax.set_xticklabels([])
ax.set_yticklabels([])
ax.set_xticks([])
ax.set_yticks([])

maxz = max(z.flatten())
minz = min(z.flatten())
contourf(yy, xx, (z - minz), levels = linspace(0, 4.95, 100))

colorbar()
	
savefig('landscape.png', bbox_inches = 'tight')
