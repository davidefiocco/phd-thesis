#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>
#include <math.h>
#include "nrutil.h"
#include "libs.h"

int main(int argc, char **argv)
{
	int N;
	int K;

	float T;
	double gamma_max;
	double dgamma;
	double gamma = 0;
	double gammacum = 0;
	int dir = 1;
	int g_steps;
	int nconf;
	int dump_0_shear;
		
	int *minspins;
	int *minspinsback0, *minspinsback1, *minspinsback2;
	int **coups;
	int coups_ok;
	int *i_neighs;
	float *a;
	float *b;
	
	int *pow2;
	int is_min;
	int same;
	int absorbing = 0;
	long seed;
	int i, j;

	FILE *ofp;
	FILE *ifp;
	size_t dummyint=256;
	char *disorder_file;
	disorder_file = (char *) malloc (dummyint);
	char *conf_file;
	conf_file = (char *) malloc (dummyint);
	char dummystr[dummyint];
	char *out_file;
	out_file = (char *) malloc (dummyint);
	float dummyfloat;

	scanf("%s %d", dummystr, &N);
	scanf("%s %d", dummystr, &K);
	scanf("%s %lf", dummystr, &gamma_max);
	scanf("%s %lf", dummystr, &dgamma);
	scanf("%s %d", dummystr, &g_steps);
	scanf("%s %s", dummystr, disorder_file);
	scanf("%s %s", dummystr, conf_file);
	scanf("%s %d", dummystr, &nconf);
	scanf("%s %s", dummystr, out_file);
	scanf("%s %d", dummystr, &dump_0_shear);
	
	ifp = fopen(disorder_file, "r");
	free(disorder_file);
	
	minspins = ivector(0,N-1);
	minspinsback0 = ivector(0,N-1);
	minspinsback1 = ivector(0,N-1);
	minspinsback2 = ivector(0,N-1);
	coups = imatrix(0,N-1,0,K);
	a = vector(0, pow(2, K+1));
	b = vector(0, pow(2, K+1));
	pow2 = ivector(0,K+1);
	init_pow2(K, pow2);
	
	char *dummylin;
	dummylin = (char *) malloc (dummyint + 1);

	for(i = 0; i < 4; i++)
		getline (&dummylin, &dummyint, ifp);

    for(i = 0; i < N; i++) 
    {
        for(j = 0; j < K + 1; j++) 
        {
            fscanf(ifp, "%d ", &coups[i][j]);
            //printf("%d ", coups[i][j]);
        }
    }

	for(i = 0; i < 2; i++)
		getline (&dummylin, &dummyint, ifp);

    for(i = 0; i < pow(2, K+1); i++) 
    {
		fscanf(ifp, "%d %f %f", &dummyint, &a[i], &b[i]);
		//printf("%f %f \n", a[i], b[i]);
    }

	fclose(ifp);

	ifp = fopen(conf_file, "r");
	free(conf_file);
	
	getline(&dummylin, &dummyint, ifp);
	fscanf(ifp, "%s %s %f", &dummystr, &dummystr, &T);
	fscanf(ifp, "\n");
	
	for(i = 0; i < 7 + nconf; i++)
		getline(&dummylin, &dummyint, ifp);

	fscanf(ifp, "%f %f ", &dummyfloat, &dummyfloat);

	for(i = 0; i < N; i++) 
		fscanf(ifp, "%d ", &minspins[i]);
	
	fclose(ifp);

	ofp = fopen(out_file, "w+");	
	free(out_file);

	fprintf(ofp, "#AQS run \n");
	fprintf(ofp, "#T = %f \n", T);
	fprintf(ofp, "#Max gamma = %f \n", gamma_max);
	fprintf(ofp, "#dgamma = %f \n", dgamma);
	fprintf(ofp, "#gamma_steps = %d \n", g_steps);
	fprintf(ofp, "#***************************** \n");
	fprintf(ofp, "#Deformation starts...\n");
	fprintf(ofp, "#gamma Minimized_energy Minimized_configuration \n");
	
	for (i=0; i <= g_steps; i++)
	{
		if (absorbing == 0 || dump_0_shear == 0)
		{

			if (fmod(gammacum, 2*gamma_max) < dgamma/2. || fmod(gammacum, 2*gamma_max) > 2*gamma_max - dgamma/2)
			{	
				for (j=0; j < N; j++)
				{
					minspinsback2[j] = minspinsback1[j];
					minspinsback1[j] = minspinsback0[j];
					minspinsback0[j] = minspins[j];
				}
			}
			
			do 
				is_min = minimize(minspins, N, K, coups, a, b, gamma, pow2);
			while (is_min == 1);
			
			if (fmod(gammacum, 2*gamma_max) < dgamma/2. || fmod(gammacum, 2*gamma_max) > 2*gamma_max - dgamma/2)
			{
				same = 1;
				for (j=0; j < N; j++)
				{
					if (minspinsback0[j] != minspinsback2[j])
					{
						same = 0;
						break;
					}
				}
				if (same == 1) absorbing = 1;
			}
		}
		else if (absorbing == 1 && dump_0_shear == 1)
		{ 
			if (fmod(gammacum, 2*gamma_max) < dgamma/2. || fmod(gammacum, 2*gamma_max) > 2*gamma_max - dgamma/2)	
			{
				for (j=0; j < N; j++)
				{
					minspins[j] = minspinsback1[j];
					minspinsback1[j] = minspinsback2[j];
					minspinsback2[j] = minspins[j];
				}	
			}
		}
		
		if (fmod(gammacum, 2*gamma_max) < dgamma/2. || fmod(gammacum, 2*gamma_max) > 2*gamma_max - dgamma/2 || dump_0_shear == 0)
		{
			fprintf(ofp,"%f \t %f \t", gammacum, get_energy(N, K, minspins, coups, a, b, gamma, pow2)/N);
			print_conf(ofp, minspins, N);
		}
		
		if (gamma > gamma_max - dgamma/2) dir = -1;
		else if (gamma < -gamma_max + dgamma/2) dir = 1;
		if (dir > 0) gamma = gamma + dgamma;
		else gamma = gamma - dgamma;
		gammacum += dgamma;
		
	}
	
	fprintf(ofp,"#...deformation ends.\n");
	fclose(ofp);

	free_vector(a, 0, pow(2, K+1));
	free_vector(b, 0, pow(2, K+1));
	free_ivector(pow2, 0, K+1);
	free_imatrix(coups, 0,N-1,0,K);
	free_ivector(minspins, 0,N-1);
	
	return 0;
}
