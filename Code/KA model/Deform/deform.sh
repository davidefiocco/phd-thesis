# bash script template to launch the athermal quasi-static deformation of the KA sample
# requires a version of the LAMMPS executables to be placed in the current directory
# the grep pipes are a dirty (but functional) way to filter the long screen output of LAMMPS, and get the relevant part only (which is a tiny fraction of it)

./lmp_linux < batch.in |grep -A5 minimization|grep -A3 PotEng|grep -B1 Loop|grep -v Loop|grep -v '\-\-' > results/deformation.log
