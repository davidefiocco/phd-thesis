from itertools import permutations
from numpy import *
from scipy.linalg import norm
import networkx as nx
from pylab import *

M = 3
N = 2*M

def unique(a):
        order = lexsort(a.T)
        a = a[order]
        dif = diff(a, axis=0)
        ui = ones(len(a), 'bool')
        ui[1:] = (dif != 0).any(axis=1)
        return a[ui]

a = zeros(N).astype('int')
a[:N/2] = 1

a = permutations(a)
a = unique(array(list(a)))

nverts = size(a[:,0])
verts = range(nverts)

G = nx.Graph()
labell = {}
E = rand(nverts)*0.7
phi_E = rand(nverts)*2*pi
for i in range(nverts):
	G.add_node(verts[i])
	labell[i] = str(a[i]).replace(' ','')

for i in range(nverts):
	for j in range(i+1, nverts):
		if norm(a[i] - a[j]) < 2.0:
			G.add_edge(i, j)

pos = nx.spring_layout(G)
lpos = nx.spring_layout(G)

xoffset = +0.06
yoffset = -0.03

for i in range(size(pos.keys())):
	lpos[i][0] = pos[i][0]
	lpos[i][1] = pos[i][1] + yoffset
	lpos[i][0] = pos[i][0] + xoffset


fig = gcf()
ax = fig.add_subplot(111, aspect='equal')
axis('off')
nx.draw_networkx_edges(G, pos = pos, color = 'g', alpha = 0.3)
nx.draw_networkx_nodes(G, pos = pos, cmap = get_cmap('Greys'), node_size = phi_E*30, alpha = 1)


nx.draw_networkx_labels(G, pos = lpos, labels = labell, font_color = 'k', font_size = 10)

#savefig('hypercube.pdf', bbox_inches = 'tight')

