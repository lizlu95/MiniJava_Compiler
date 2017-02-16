#include "runtime.h"

#include <stdio.h>
#include <stdlib.h>
#include <sys/resource.h>

/*
 * The runtime defines a main function which calls the compiler generated main
 * function.
 */
int main() {
    struct rlimit lim;
    int res;
    
    /* Set the resource limit to give us just one second of CPU time */
    lim.rlim_cur = 2;
    lim.rlim_max = 2;
    res = setrlimit(RLIMIT_CPU, &lim);
    if (res != 0) {
	printf("Setting rlimit got %d\n", res);
	exit(1);
    }

    cs411main();
    return 0;
}

#ifdef __APPLE__
#define EXTRA "_"
#else
#define EXTRA ""
#endif
#define TRAMP(x) \
asm("	.globl	" EXTRA #x "\n" \
    "	" EXTRA #x ":\n" \
    "	subq	$8, %rsp\n" \
    "	pushq	%rdi\n" \
    "	pushq	%rsi\n" \
    "	pushq	%rdx\n" \
    "	pushq	%rcx\n" \
    "	pushq	%r8\n" \
    "	pushq	%r9\n" \
    "	pushq	%r10\n" \
    "	pushq	%r11\n" \
    "	callq	" EXTRA #x "real\n" \
    "	popq	%r11\n" \
    "	popq	%r10\n" \
    "	popq	%r9\n" \
    "	popq	%r8\n" \
    "	popq	%rcx\n" \
    "	popq	%rdx\n" \
    "	popq	%rsi\n" \
    "	popq	%rdi\n" \
    "	addq	$8, %rsp\n" \
    "	ret"); 

TRAMP(cs411println)
TRAMP(cs411newobject)
TRAMP(cs411newarray)
TRAMP(cs411error)

/*
 * The runtime defines a function to print an integer.
 */
void cs411printlnreal(long i) {
    printf("%ld\n", i);
}

/*
 * Allocate memory for an object and initialize it.
 */
char* cs411newobjectreal(long numbytes) {
    char* object = malloc(numbytes);
    int i;
    for (i=0; i<numbytes; i++)
	object[i] = 0;
    return object;
}

/*
 * Allocate memory for an array and initialize it.
 * 
 * The returned pointer points to element 0 of the
 * array. The element at index[-1] position is the 
 * length of the array.
 */
long* cs411newarrayreal(long numElements) {
    long* arr = malloc((numElements+1)*sizeof(long));
    int i;
    arr[0] = numElements;
    arr++;
    for (i=0; i<numElements; i++) {
	arr[i] = 0;
    }
    return arr;
}

char *errors[] = {
    "No error",
    "Index out of bounds",
};

/*
 * Report a failure - the integer code indicates the type of failure.
 */
void cs411errorreal(long code) {
    /*    fprintf(stdout, "MiniJava failure %ld: %s\n", code, (code >= 0 && code < sizeof(errors) / sizeof(char *)) ? errors[code] : "Invalid error code"); */
    fprintf(stdout, "MiniJava failure %ld\n", code);
    exit(0);
}
