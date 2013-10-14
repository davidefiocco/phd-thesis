import sys
import numpy as np
import pylab as plt

M = int(sys.argv[1])
p = float(sys.argv[2]) 
gamma_max = int(sys.argv[3])
np.random.seed(123456)

allPfwd = np.eye(M)
allPrev = np.eye(M)

for gammastar in range(1, gamma_max):
    
    Pfwd = np.zeros((M, M))
    Prev = np.zeros((M, M))    
    unstable = np.random.rand(M) < p 
    for i in xrange(M):
        if unstable[i]:
            dest = np.random.randint(M) 
            Pfwd[dest,i] = 1
        else:
            Pfwd[i,i] = 1 
    for i in xrange(M):
        if unstable[i]: 
            dest = np.random.randint(M)
            Prev[dest,i] = 1
        else:
            Prev[i,i] = 1

    allPfwd = np.dot(Pfwd, allPfwd) 
    allPrev = np.dot(allPrev, Prev)
    
Pplus = np.dot(allPrev, allPfwd) 
plt.spy(Pplus)  
plt.show()
