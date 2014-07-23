/***************************************************************************/
/*               r1279.c random number generator -ROUGH DRAFT              */
/*    note that 2047 = 2^11 - 1                                            */
/*    gcc -c -Wall -L/home/tolson/lib r1279.c -lsecs                       */
/***************************************************************************/
/* note #undef's at end of file */

# define INV_MAXINT 4.656612875e-10 /* 1.0/2147483647.  or  1/(2^31 - 1) */
# define NBITM1 31

/* the following are definitions for ran2   */
#define IM1 2147483563
#define IM2 2147483399
#define AM (1.0/IM1)
#define IMM1 (IM1-1)
#define IA1 40014
#define IA2 40692
#define IQ1 53668
#define IQ2 52774
#define IR1 12211
#define IR2 3791
#define NTAB 32
#define NDIV (1+IMM1/NTAB)
#define EPS 1.2e-7
#define RNMX (1.0-EPS)

/* the following are additional definitions for iran1   */
#define IA 16807
#define IM 2147483647
#define AMR1 (1.0/IM)
#define IQ 127773
#define IR 2836
#define NDIVR1 (1+(IM-1)/NTAB)

#include <stdlib.h>

unsigned int index1[2048], index2[2048], irand[2048], ioffset;

float r1279(void)

{
  ioffset = (ioffset + 1) &  2047;
  irand[ioffset] = irand[index1[ioffset]] * irand[index2[ioffset]];
  return (irand[ioffset] >> 1) * INV_MAXINT;
}

/****************************************************************************/
int ir1279(void)

{
  ioffset = (ioffset + 1) &  2047;
  irand[ioffset] = irand[index1[ioffset]] * irand[index2[ioffset]];
  return irand[ioffset] >> 1;
}

/****************************************************************************/

int ir1279range(int imin, int imax)

{
  float range;
  long tempval;

  range = (imax - imin +1) * INV_MAXINT;
  ioffset = (ioffset + 1) &  2047;
  irand[ioffset] = irand[index1[ioffset]] * irand[index2[ioffset]];
  tempval = imin + (int)( (irand[ioffset] >> 1) * range);
  if (tempval > imax) tempval = imax;
  return tempval;
}

/****************************************************************************/

void setr1279(long iseed)


{
  float rran2(long *idum);
  int ibit, ispoke, one_bit;
  long localseed;
  /*
	Initialize ioffset. This will be increased by (1 mod 2048) for
	each random number which is called. 
  */
  ioffset = 0;
  /*
	Set up the two arrays which give locations of the two random
	numbers which will be multiplied to get the new random number
  */
  for (ispoke = 0; ispoke <= 2047; ispoke++) {
    index1[ispoke] = (ispoke - 1279) & 2047;
    index2[ispoke] = (ispoke - 418) & 2047;
  }
  /*
	set up the initial array of 2048 integer random numbers
	Each bit is separately initialized using ran2 from numerical recipes
  */
  localseed = -abs(iseed);

  for (ispoke = 0; ispoke <= 2047; ispoke++) {
    irand[ispoke] = 0;
    for (ibit = 0; ibit <= NBITM1; ibit++) {
      one_bit = 0;
      if (rran2(&localseed) > 0.5) one_bit = 1;
      irand[ispoke] = irand[ispoke] | (one_bit << ibit);
    }
    irand[ispoke] = 2 * irand[ispoke] + 1;
  }
}  

/****************************************************************************/

void setseed(long *iseed)

{
  long int ssecs(void);

  long iran1(long *idum);
  long ran1seed;
    
  /*  int getpid; */    
  *iseed = abs(314159 * ssecs());
  ran1seed = -(*iseed);
  *iseed = abs (*iseed * iran1(&ran1seed) );
}

/****************************************************************************/

#include <stdio.h>
#include <sys/time.h>
#include <sys/resource.h>

long int ssecs(void)
{
	long int	seconds;

	time ( &seconds );
	return seconds;
}


/****************************************************************************/

long iran1(long *idum)
  /* integer version of ran1 */
{
  int j;
  long k;
  static long iy=0;
  static long iv[NTAB];
  /*  float temp; */

  if (*idum <= 0 || !iy) {
    if (-(*idum) < 1) *idum=1;
    else *idum = -(*idum);
    for (j=NTAB+7;j>=0;j--) {
      k=(*idum)/IQ;
      *idum=IA*(*idum-k*IQ)-IR*k;
      if (*idum < 0) *idum += IM;
      if (j < NTAB) iv[j] = *idum;
    }
    iy=iv[0];
  }
  k=(*idum)/IQ;
  *idum=IA*(*idum-k*IQ)-IR*k;
  if (*idum < 0) *idum += IM;
  j=iy/NDIVR1;
  iy=iv[j];
  iv[j] = *idum;
  return iy;
}

/****************************************************************************/

float rran2(long *idum)
{
  int j;
  long k;
  static long idum2=123456789;
  static long iy=0;
  static long iv[NTAB];
  float temp;
  
  if (*idum <= 0) {
    if (-(*idum) < 1) *idum=1;
    else *idum = -(*idum);
    idum2=(*idum);
    for (j=NTAB+7;j>=0;j--) {
      k=(*idum)/IQ1;
      *idum=IA1*(*idum-k*IQ1)-k*IR1;
      if (*idum < 0) *idum += IM1;
      if (j < NTAB) iv[j] = *idum;
    }
    iy=iv[0];
  }
  k=(*idum)/IQ1;
  *idum=IA1*(*idum-k*IQ1)-k*IR1;
  if (*idum < 0) *idum += IM1;
  k=idum2/IQ2;
  idum2=IA2*(idum2-k*IQ2)-k*IR2;
  if (idum2 < 0) idum2 += IM2;
  j=iy/NDIV;
  iy=iv[j]-idum2;
  iv[j] = *idum;
  if (iy < 1) iy += IMM1;
  if ((temp=AM*iy) > RNMX) return RNMX;
  else return temp;
}

/****************************************************************************/
#undef IM1
#undef IM2
#undef AM
#undef IMM1
#undef IA1
#undef IA2
#undef IQ1
#undef IQ2
#undef IR1
#undef IR2
#undef NTAB
#undef NDIV
#undef EPS
#undef RNMX

#undef IA 
#undef IM 
#undef AMR1
#undef IQ
#undef IR
#undef NDIVR1


#undef NBITM1
#undef INV_MAXINT
