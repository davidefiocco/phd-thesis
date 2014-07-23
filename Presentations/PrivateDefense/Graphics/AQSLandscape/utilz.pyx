#gcc -shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing  -I/usr/include/python2.7 -o utilz.so utilz.c

import numpy as np
cimport numpy as np
cimport cython

DTYPE = np.float

cdef extern from "math.h":
	float exp(float x) 
	
ctypedef np.float_t DTYPE_t
@cython.boundscheck(False)

def minimum_image(np.ndarray[DTYPE_t, ndim=1, negative_indices=False] dx, float box):
	if dx[0] < - box*0.5:
		dx[0] = dx[0] + box
	elif dx[0] > box*0.5:
		dx[0] = dx[0] - box

	if dx[1] < - box*0.5:
		dx[1] = dx[1] + box
	elif dx[1] > box*0.5:
		dx[1] = dx[1] - box

	return dx

def get_f(np.ndarray[DTYPE_t, ndim=1, negative_indices=False] r, np.ndarray[DTYPE_t, ndim=2, negative_indices=False] r0, float L):
	
	cdef float f = 0.
	cdef np.ndarray[DTYPE_t, ndim=1, negative_indices=False] drv = np.zeros(2)
	
	for i in range(np.size(r0[:,0])):
		drv = minimum_image(r - r0[i], L)
		f = f + exp((-drv[0]*drv[0] - drv[1]*drv[1])/(0.4))
	
	return f

def get_z(np.ndarray[DTYPE_t, ndim=1, negative_indices=False] x, np.ndarray[DTYPE_t, ndim=1, negative_indices=False] y, np.ndarray[DTYPE_t, ndim=2, negative_indices=False] r0, float L):
	
	cdef int xsize = np.size(x)
	cdef int ysize = np.size(y)
	cdef np.ndarray[DTYPE_t, ndim=1, negative_indices=False] r = np.zeros(2)
	cdef np.ndarray[DTYPE_t, ndim=2, negative_indices=False] z = np.zeros((xsize, ysize))
	
	for i in xrange(xsize):
		for j in xrange(ysize):
			r = np.array([x[i],y[j]])
			z[i,j] = get_f(r, r0, L)

	return z
