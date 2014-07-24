# bash script template to launch the entire sequence of sample creation, equilibration, relaxation and production
# requires a version of the LAMMPS executables to be placed in the current directory

./lmp_linux < make.in
./lmp_linux < equilibrate.in
./lmp_linux < relax.in
./lmp_linux < evolve.in
