from numpy.random import choice
from scipy.io import mmwrite
from scipy import sparse
import numpy as np
import pylab as plt
import sys
import os

M = int(sys.argv[1])
p = float(sys.argv[2]) 
gamma_max = int(sys.argv[3])
np.random.seed(123456)

allPfor = sparse.eye(M, format='coo')
allPback = sparse.eye(M, format='coo')

os.system("mkdir -p Matrices")

for g in range(0, gamma_max):
	
	print g
	
	Pfor = sparse.lil_matrix((M, M))
	Pback = sparse.lil_matrix((M, M))
	
	unstable = np.random.rand(M) < p
	
	for i in xrange(M):
		if unstable[i]:
			dest = np.random.randint(M)
			Pfor[dest,i] = 1
		else:
			Pfor[i,i] = 1

	for i in xrange(M):
		if unstable[i]:
			dest = np.random.randint(M)
			Pback[dest,i] = 1
		else:
			Pback[i,i] = 1

	Pfor = Pfor.tocoo()
	Pback = Pback.tocoo()

	allPfor = Pfor.dot(allPfor).tocoo()
	allPback = allPback.dot(Pback).tocoo()

Pplus = allPback.dot(allPfor) 
plt.spy(Pplus)  
plt.show()

	
