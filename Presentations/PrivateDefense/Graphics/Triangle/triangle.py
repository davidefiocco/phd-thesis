import matplotlib as mpl
from pylab import *
from numpy import *
from scipy.signal import sawtooth

from matplotlib import rc
rc('text', fontsize = 28, usetex=True)
rc('font',**{'family':'sans-serif','sans-serif':['Computer Modern Sans serif']})

dt = 0.01
g1 = 1
t_max = 4*g1

f = lambda(x) : abs(sawtooth((x*pi/g1 - pi/2))) - 0.5 

x = arange(0, t_max, dt)
#x = arange(0, g1, dt)

figure(figsize=(12, 2.7))

#plot(x, f(x))
plot(x, f(x), 'r')
plot(array([0., 1.0, 2.0, 3.0, 4.0])*g1, [0,0,0,0,0], 'o', color = 'b', mec = 'None')

yticks([-0.5, 0., 0.5], [r'$-\gamma_{max}$', '$0$', r'$\gamma_{max}$'])
xticks(array([0., 0.5, 1.0, 2.0, 3.0, 4.0])*g1, ['$0$', r'$\gamma_{max}$', r'$2\gamma_{max}$', r'$4\gamma_{max}$', r'$6\gamma_{max}$', r'$8\gamma_{max}$'])

ax = gca()
ax.set_xlabel('$\gamma_{acc}$')
ax.set_ylabel('$\gamma$')

ax.set_xlim(0, 4.0*g1)
ax.set_ylim(-0.6, 0.6)

#tight_layout()
subplots_adjust(bottom=0.3, left=0.15, top=0.9, right = 0.95)

savefig("Triangle-6.pdf")
