import sys
import numpy as np
import pylab as plt
import networkx as nx
from scipy.sparse import lil_matrix

M = int(sys.argv[1])

#np.random.seed(574324111)
np.random.seed(574325645)

def create_pos(M):
	pos = {}
	for i in xrange(M):
		for t in xrange(2):
			pos[t*M + i] = np.array([t, -i])
	return pos
 
posit = create_pos(M)
posit2 = create_pos(M)

Q = np.zeros((M,M))

for i in range(M):
	Q[np.random.randint(M), i] = 1

plt.figure(1)
R = np.hstack((Q, np.zeros_like(Q)))
S = np.vstack((np.zeros_like(R), R))
G = nx.from_numpy_matrix(S.T, create_using=nx.DiGraph())

labdict = dict(zip(range(2*M), np.hstack((range(M), range(M))).astype('string')))

nx.draw_networkx_nodes(G, pos = posit, node_size = 120, node_color = 'k')
nx.draw_networkx_labels(G, posit2, labdict, font_color = 'w')
nx.draw_networkx_edges(G, pos = posit, edge_color = 'r')
plt.axis('off')
ax = plt.gca()
ax.set_xticks([])
ax.set_yticks([])
plt.subplots_adjust(left = 0.0, right = 1.0, top = 1.0)

plt.figure(2)

G2 = nx.from_numpy_matrix(Q.T, create_using=nx.DiGraph())
nx.draw_networkx(G2, node_size = 120, node_color = 'k', edge_color = 'r', font_color = 'w')
plt.axis('off')
ax = plt.gca()
ax.set_xticks([])
ax.set_yticks([])
plt.subplots_adjust(left = 0.0, right = 1.0, top = 1.0)
