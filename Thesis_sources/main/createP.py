import sys
import numpy as np
import pylab as plt

M = int(sys.argv[1])
p = float(sys.argv[2]) 
gamma_max = int(sys.argv[3])
np.random.seed(123456)

allPplus = np.eye(M)
allPminus = np.eye(M)

for gammastar in range(1, gamma_max):
    
    Pplus = np.zeros((M, M))
    Pminus = np.zeros((M, M))    
    unstable = np.random.rand(M) < p 
    for i in xrange(M):
        if unstable[i]:
            dest = np.random.randint(M) 
            Pplus[dest,i] = 1
        else:
            Pplus[i,i] = 1 
    for i in xrange(M):
        if unstable[i]: 
            dest = np.random.randint(M)
            Pminus[dest,i] = 1
        else:
            Pminus[i,i] = 1

    allPplus = np.dot(Pplus, allPplus) 
    allPminus = np.dot(allPminus, Pminus)
    
Pplus = np.dot(allPminus, allPplus) 
plt.spy(Pplus)  
plt.show()
