#ifndef _NK_UTILS_H_
#define _NK_UTILS_H_

int compi(const void *a, const void *b);
void init_spins(int N, int *spins);
void init_pow2(int K, int *pow2);
int init_couplings(int N, int K, int **coups);
void init_ab(int K, float *a, float min, float max);
int get_confvalue(int N, int K, int i, int *spins, int **coups, int *pow2);
float get_energy(int N, int K, int *spins, int **coups, float *a, float *b, double gamma, int *pow2);
float get_ijenergy(int N, int K, int i, int j, int *spins, int **coups, float *a, float *b, double gamma, int *pow2);
void flip_spin(int *spins, int i);
void print_conf(FILE *ofp, int *spins, int N);
void mc_move(int *spins, int N, int K, int **coups, float *a, float *b, float T, double gamma, int *pow2);
int minimize(int *spins, int N, int K, int **coups, float *a, float *b, double gamma, int *pow2);

#endif /* _NK_UTILS_H_ */
