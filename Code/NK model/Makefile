# Declaration of variables
CC = gcc -O3
CC_FLAGS = 
LD_FLAGS     = -lm 

# File names
EXEC = run
SOURCES = $(wildcard *.c)
OBJECTS = nrutil.o libs.o seedgen.o r1279.o

nk: nk.o $(OBJECTS)
	$(CC) $(CC_FLAGS) nk.o $(OBJECTS) -o $(EXEC) $(LD_FLAGS) 
	
dnk: dnk.o $(OBJECTS)
	$(CC) $(CC_FLAGS) dnk.o $(OBJECTS) -o d$(EXEC) $(LD_FLAGS) 

d2nk: d2nk.o $(OBJECTS)
	$(CC) $(CC_FLAGS) d2nk.o $(OBJECTS) -o d2$(EXEC) $(LD_FLAGS) 

ddnk: ddnk.o $(OBJECTS)
	$(CC) $(CC_FLAGS) ddnk.o $(OBJECTS) -o dd$(EXEC) $(LD_FLAGS) 

dd2nk: dd2nk.o $(OBJECTS)
	$(CC) $(CC_FLAGS) dd2nk.o $(OBJECTS) -o dd2$(EXEC) $(LD_FLAGS) 

# To obtain object files
%.o: %.cpp
	$(CC) -c $< $(CC_FLAGS) -o $@ $(LD_FLAGS) 

# To remove generated files
clean:
	rm -f *.o
