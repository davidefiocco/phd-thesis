import sys
import numpy as np
import pylab as plt

M = int(sys.argv[1])
p = float(sys.argv[2]) 
gamma_max = int(sys.argv[3])
np.random.seed(123456)

allPfor = np.eye(M)
allPback = np.eye(M)

for gammastar in range(1, gamma_max):
    
    Pfor = np.zeros((M, M))
    Pback = np.zeros((M, M))    
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

    allPfor = np.dot(Pfor, allPfor) 
    allPback = np.dot(allPback, Pback)
    
Pplus = np.dot(allPback, allPfor) 
plt.spy(Pplus)  
plt.show()
