/*
 * A minuscule "runtime" environment for minijava.
 *
 * We develop this in C and compile it with the
 * gcc compiler.
 *
 * See the accompanying makefile.
 */


/* 
 * This function should be created by the minijava compiler. 
 * It will be called by the runtime to start the minijava program.
 */
void cs411main();

/*
 * The mj runtime defines a function to print an integer.
 */
void cs411println(long i);

/*
 * Allocate memory for an object and intialize it.
 */
char* cs411newobject(long numbytes);

/*
 * Allocate memory for an array and intialize it.
 * 
 * The returned pointer points to element 0 of the
 * array. The element at index[-1] position is the 
 * length of the array.
 */
long* cs411newarray(long numElements);

#define MJ_INDEX_OUT_OF_BOUNDS (1)
/*
 * Report a failure - the integer code indicates the type of failure.
 */
void cs411error(long code);
