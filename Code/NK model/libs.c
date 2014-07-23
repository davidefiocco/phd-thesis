#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "r1279.h"
#include "nrutil.h"		

int compi(const void *a, const void *b)
{
    const int *the_a = a;
    const int *the_b = b;
    if (*the_a > *the_b) return 1;
    else if (*the_a < *the_b) return -1;
    else return 0;
}

void myselectionsort(int n, int *a)
{
	int t, t_min, min, min_idx, ext;
	for (t=1; t < n-1; t++)
	{
	min = a[t];
	for (t_min=t; t_min < n; t_min++)
		if (min >= a[t_min])
		{
			min = a[t_min];
			min_idx = t_min;
		}
	ext = a[t];
	a[t] = min;
	a[min_idx] = ext;
	}
}

void init_spins(int N, int *spins)
{
	int i, j;
	
	for (i=0; i < N; i++)
	{
		spins[i] = 0;
	}
	
	for (i=0; i < N/2; i++)
	{
		do
		{
			j = ir1279range(0,N-1);
		}
		while(spins[j] == 1);
		
		spins[j] = 1;
	}

}

void init_pow2(int K, int *pow2)
{
	int i;
	
	for (i=0; i < K+2; i++)
	{
		pow2[i] = pow(2,i);
	}

}

int init_couplings(int N, int K, int **coups)
{
	int i,j,l,m;
	int r1, r2;
	int n1, n2;
	int coupled_sum = 0;
	int attempt;
	int maxiter = 100000000;
	int success = 0;
	int *aux_coup = ivector(0,N*K);
	int **coupled = imatrix(0,N,0,N);
	
	for (i=0; i < N*K; i++)
	{
		aux_coup[i] = i % N;
	}

	for (i=0; i < N; i++)
		coups[i][0] = i;
		for (j=0; j < N; j++)
			coupled[i][j] = 0;

	for (attempt=0; attempt < maxiter; attempt++)
	{
		r1 = ir1279range(0,N*K-1);
		r2 = ir1279range(0,N*K-1);
		i = aux_coup[r1];
		j = aux_coup[r2];
		if ((i >= 0) && (j >= 0) && (i != j) && (coupled[i][j] != 1))
		{
			n1 = 0;
			n2 = 0;
			for (l=0; l < N; l++)
			{
				n1 += coupled[i][l];
				n2 += coupled[j][l];
			}
			if ((n1 < K) && (n2 < K))
			{
				aux_coup[r1] = -1;
				aux_coup[r2] = -1;
				coupled[i][j] = 1;
				coupled[j][i] = 1;
				coups[i][n1+1] = j;
				coups[j][n2+1] = i;
				
				coupled_sum = 0;
					for (l=0; l < N; l++)
						for (m=0; m < N; m++)
							coupled_sum += coupled[l][m];
				
				if (coupled_sum == N*K) 
				{	
					success = 1;
					break;
				}	
			}
		}
	}	
	
	for (i=0; i < N; i++)
	{
		myselectionsort(K+1, coups[i]);
	}
	//if (success ==1)
		//for (i=0; i < N; i++)
		//{
			//for (j=0; j < N; j++)
				//printf("%d ", coupled[i][j]);
			//printf("\n");
	//}	
	
	return success;
}

void init_ab(int K, float *a, float min, float max)
{
	int i;
	
	for (i=0; i < pow(2, K+1); i++)
		a[i] = min + r1279()*(max - min);

}

int get_confvalue(int N, int K, int i, int *spins, int **coups, int *pow2)
{
	int conf_value = 0;
	int j;
	
	for (j=0; j < K+1; j++)
		if (spins[coups[i][j]] != 0) conf_value += pow2[j]*spins[coups[i][j]];
	
	return conf_value;
}

float get_ijenergy(int N, int K, int i, int j, int *spins, int **coups, float *a, float *b, double gamma, int *pow2)
{
	int m, l;
	int conf;
	float Ep;
	
	Ep = 0;

//	check only neighbors of spins i,j

	for (m=0; m<N; m++)
	{
		for (l=0; l<K+1; l++)
		{ 
			if (m == coups[i][l] || m == coups[j][l])
			{
				conf = get_confvalue(N, K, m, spins, coups, pow2);
				Ep += -(1 + sin(2.0*M_PI*(a[conf] + gamma*b[conf])));
				break;
			}
		}
	}
	
	return 0.5*Ep;
}

float get_energy(int N, int K, int *spins, int **coups, float *a, float *b, double gamma, int *pow2)
{
	int i;
	int conf;
	float E;
	
	E = 0;
	
	for (i=0; i<N; i++)
	{
		conf = get_confvalue(N, K, i, spins, coups, pow2);
		E += -(1 + sin(2.0*M_PI*(a[conf] + gamma*b[conf])));
	}
	
	return 0.5*E;
}

void flip_spin(int *spins, int i)
{
	if (spins[i] == 0) spins[i] = 1;
	else if (spins[i] == 1) spins[i] = 0;	
}

void print_conf(FILE *opf, int *spins, int N)
{
	int i;
	for (i=0; i < N; i++)
		fprintf(opf, "%d ", spins[i]);
	fprintf(opf,"\n");
}

void mc_move(int *spins, int N, int K, int **coups, float *a, float *b, float T, double gamma, int *pow2)
{
	int i,j,k;
	float E, Etrial;
	float r;

	for (k=0; k < N; k++)
	{

		do 
		{
			i = ir1279range(0,N-1);
			j = ir1279range(0,N-1);
		}
		while(spins[i] == spins[j]);
		
		E = get_energy(N, K, spins, coups, a, b, gamma, pow2);
		flip_spin(spins, i);
		flip_spin(spins, j);
		Etrial = get_energy(N, K, spins, coups, a, b, gamma, pow2);
		
		r = r1279();
		
		if (r > fmin(1, exp(-(Etrial - E)/T)))
		{
			flip_spin(spins, i);
			flip_spin(spins, j);
		}	
	}
	
}

int minimize(int *spins, int N, int K, int **coups, float *a, float *b, double gamma, int *pow2)
{
	int min_flipi, min_flipj;
	float E, En, dE, dEn;
	int status = 0;
	
	int i, j;
	min_flipi = N;
	min_flipj = N;
	
	dE = 0.0;
	
	for (i=0; i<N; i++) 
	{
		for (j=i+1; j<N; j++) 
		{
			if(spins[i] != spins[j])
			{
				E = get_ijenergy(N, K, i, j, spins, coups, a, b, gamma, pow2);
				//E = get_energy(N, K, spins, coups, a, b, gamma, pow2);
				flip_spin(spins, i);
				flip_spin(spins, j);
				En = get_ijenergy(N, K, i, j, spins, coups, a, b, gamma, pow2);
				//En = get_energy(N, K, spins, coups, a, b, gamma, pow2);
				dEn = En - E;	
						
				if (dEn < dE)
				{
					dE = dEn;
					min_flipi = i;
					min_flipj = j;
				}
				flip_spin(spins, i);
				flip_spin(spins, j);
			}
		}
	}
	
	if (min_flipi < N && min_flipj < N)
	{
		flip_spin(spins, min_flipi);
		flip_spin(spins, min_flipj);
		status = 1;
	}
	
	//printf("%d", status);
	
	return status;
	
}
