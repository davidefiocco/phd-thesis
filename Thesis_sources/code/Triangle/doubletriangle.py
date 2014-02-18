import matplotlib as mpl
from pylab import *
from numpy import *
from scipy.signal import sawtooth
from matplotlib import rc
rc('text', usetex=True, fontsize = 18)

L = 6
dL = L/120.
g1 = 3.
g2 = 2.
dt = 0.01
t_max = 12*(g1 + g2)

def f(x, g1, g2):
	xm = mod(x, 4*(g1+g2))
	if xm < 4*g1:
		f = abs(sawtooth((xm*pi/(2*g1) - pi/2))) - 0.5 
	else:
		#f = 0
		f = (g2/g1)*(abs(sawtooth(((xm - 4.*g1)/(2*g2)*pi - pi/2))) - 0.5)
	return f

f = vectorize(f)

x = arange(0, t_max, dt)

plot(x, f(x, g1, g2))

yticks(array([-0.5*g1, -0.5*g2, 0., 0.5*g2, 0.5*g1])/g1, [r'$-\gamma_{1}$', r'$-\gamma_{2}$','$0$', r'$\gamma_{2}$', r'$\gamma_{1}$'])
xticks(array([0., g1, 2*g1, 4*g1, 4*(g1 + g2)]), ['$0$', r'$\gamma_{1}$', r'$2\gamma_{1}$', r'$4\gamma_{1}$', r'$4(\gamma_{1} + \gamma_{2})$'])

ax = gca()
ax.set_xlabel('$\gamma_{acc}$')
ax.set_ylabel('$\gamma$')

ax.set_xlim(0, 12*(g1 + g2))

tight_layout()

