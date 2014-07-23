from itertools import permutations
from numpy import *
from scipy.linalg import norm
import networkx as nx
from pylab import *

seed(234127234)

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

for i in range(nverts):
	G.add_node(verts[i])
	labell[i] = str(a[i]).replace(' ','')

for i in range(nverts):
	for j in range(i+1, nverts):
		if norm(a[i] - a[j]) < 2.0:
			G.add_edge(i, j)

pos = nx.spring_layout(G)

#offset = 0.1
#
#for i in range(size(pos.keys())):
	#pos[i][0] += offset
	
#nx.draw_networkx_labels(G, pos = pos, labels = labell)

t = linspace(0, 2*pi, 20)
ph = outer(rand(20)*2*pi, ones_like(t))
A = outer(rand(20) + 0.1, ones_like(t))
offset = outer(rand(20), ones_like(t))

E = (A*sin(ph + t) + 3*(offset - 0.5)).T

maskE = ones_like(E)
colmaskE = zeros_like(E).astype('S8')

the_min = where(E[0,:] == min(E[0,:]))[0]
the_min_story = zeros_like(t)

def minimize(a, i, nverts, E):
	my_min = i
	for j in range(nverts):
		if norm(a[i] - a[j]) < 2.0:
			if E[my_min] > E[j]:
				my_min = j
	if my_min == i:
		return my_min
	else:
		return minimize(a, my_min, nverts, E)

for k in range(size(t)):
	the_min_story[k] = minimize(a, the_min, nverts, E[k])
	the_min = the_min_story[k]
	for i in range(nverts):
		minimum = True
		for j in range(nverts):
			if norm(a[i] - a[j]) < 2.0:
				if E[k, i] > E[k, j]:
					minimum = False
					if i == the_min:
						the_min = j
					break
		if minimum:
			maskE[k,i] = 0

colmaskE[maskE == 0] = 'k'
colmaskE[maskE == 1] = 'w'

for i in range(size(t)):
	fig = gcf()
	ax = fig.add_subplot(111, aspect='equal')
	axis('off')
	nx.draw_networkx_nodes(G.subgraph(where(maskE[i] == 0)[0]), pos = pos, node_color = 'k', node_size=600, edge_color='none', alpha = 0.8)
	if i > 4:
		nx.draw_networkx_nodes(G.subgraph(the_min_story[i]), pos = pos, node_color = 'r', node_size=600, edge_color='none', alpha = 0.8)
	nx.draw_networkx_nodes(G, pos = pos, cmap = get_cmap('jet'), node_size=200, node_color = E[i])
	nx.draw_networkx_edges(G, pos = pos)
	fig = matplotlib.pyplot.gcf()
	fig.set_size_inches(8,8)
	savefig('hypercube-' + str(i+3) + '.png', bbox_inches = 'tight')
	close()
