import matplotlib as mpl
from pylab import *
from numpy import *
from scipy.signal import sawtooth
from matplotlib import rc
rc('text', usetex=True, fontsize = 18)

L = 6
dL = L/120.
dt = 0.01
g1 = 1
t_max = 12*g1

f = lambda(x) : abs(sawtooth((x*pi/g1 - pi/2))) - 0.5 

x = arange(0, t_max, dt)

plot(x, f(x))

yticks([-0.5, 0., 0.5], [r'$-\gamma_{max}$', '$0$', r'$\gamma_{max}$'])
xticks(array([0., 0.5, 1.0, 2.0, 3.0, 4.0])*g1, ['$0$', r'$\gamma_{max}$', r'$2\gamma_{max}$', r'$4\gamma_{max}$', r'$6\gamma_{max}$', r'$8\gamma_{max}$'])

ax = gca()
ax.set_xlabel('$\gamma_{acc}$')
ax.set_ylabel('$\gamma$')

ax.set_xlim(0, 6.0*g1)

tight_layout()
