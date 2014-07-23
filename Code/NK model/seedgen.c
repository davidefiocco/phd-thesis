#include <stdio.h>
#include <sys/time.h>
#include <sys/resource.h>
#include "libs.h"

long secs();
long getpid();

long seedgen(){

    long 	s, seed, pid;

    pid 	= getpid();	/* get process ID for randomization 	*/
    s 		= secs();	/* get seconds from system clock	*/

    seed = abs(((s*181)*((pid-83)*359))%104729);

    return seed;

}

long int secs (){
        
    long int	seconds;

    time ( &seconds );
        
    return seconds;
}

