#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>
#include <math.h>
#include "r1279.h"
#include "nrutil.h"
#include "libs.h"

int main(int argc, char **argv)
{
	
	int N;
	int K;

	float T;
	int t_steps;
	
	int *spins, *minspins;
	int **coups;
	int coups_ok;
	int *i_neighs;
	float *a;
	float *b;
	
	int *pow2;
	int is_min;
	long seed;
	int i, j;

	FILE *ofp;
	size_t dummyint=256;
	char dummystr[dummyint];
	char *disorder_file;
	disorder_file = (char *) malloc (dummyint);
	char *out_file;
	out_file = (char *) malloc (dummyint);

	scanf("%s %d", dummystr, &N);
	scanf("%s %d", dummystr, &K);
	scanf("%s %f", dummystr, &T);
	scanf("%s %d", dummystr, &t_steps);
	scanf("%s %s", dummystr, disorder_file);
	scanf("%s %s", dummystr, out_file);
	
	ofp = fopen(disorder_file, "w+");

	spins = ivector(0,N-1);
	coups = imatrix(0,N-1,0,K);
	a = vector(0, pow(2, K+1));
	b = vector(0, pow(2, K+1));
	pow2 = ivector(0,K+1);

    seed = seedgen();
    setr1279(seed);

	init_spins(N, spins);
	do
		coups_ok = init_couplings(N, K, coups);
	while (coups_ok == 0);
	init_pow2(K, pow2);
	init_ab(K, a, 0.0, 1.0);
	init_ab(K, b, -1.0, 1.0);

	//for (i=0; i < N; i++)
	//{
		//spins[i] = ir1279range(0,1);
	//}

	fprintf(ofp, "#Disorder\n", seed);
	fprintf(ofp, "#seed = %d \n", seed);
	fprintf(ofp, "#***************************** \n");
	fprintf(ofp, "#Couplings \n");
	
	for (i=0; i < N; i++)
	{
		for (j=0; j < K + 1; j++)
			fprintf(ofp, "%d ", coups[i][j]);
		fprintf(ofp, "\n");
	}			
	
	fprintf(ofp, "#***************************** \n");
	fprintf(ofp, "#a b \n");
	
	for (i=0; i < pow(2, K+1); i++)
	{
		fprintf(ofp, "%d %f %f \n", i, a[i], b[i]);
	}
	fclose(ofp);

	ofp = fopen(out_file, "w+");
	fprintf(ofp, "#Parameters\n");
	fprintf(ofp, "#T = %f \n", T);
	fprintf(ofp, "#t_steps = %d \n", t_steps);
	fprintf(ofp, "#seed = %d \n", seed);
	fprintf(ofp, "#***************************** \n");
	fprintf(ofp,"#Equilibration starts...\n");
	fprintf(ofp,"#step Minimized_energy Minimized_configuration \n");

	for (i=0; i < t_steps; i++)
	{
		
		minspins = ivector(0,N-1);
		memcpy(minspins, spins, N*sizeof(int));
		
		do 
			is_min = minimize(minspins, N, K, coups, a, b, 0, pow2);
		while (is_min == 1);

		fprintf(ofp,"%d \t %f \t", i, get_energy(N, K, minspins, coups, a, b, 0, pow2)/N);
		print_conf(ofp, minspins, N);
		
		mc_move(spins, N, K, coups, a, b, T, 0, pow2);
		is_min = 1;
		
		free_ivector(minspins,0,N-1);
	}
	
	fprintf(ofp,"#...equilibration ends.\n");
	
	fclose(ofp);
	
	free_vector(a, 0, pow(2, K+1));
	free_vector(b, 0, pow(2, K+1));
	free_ivector(pow2, 0, K+1);
	free_imatrix(coups, 0,N-1,0,K);
	free_ivector(spins, 0,N-1);
	
	return 0;
}
