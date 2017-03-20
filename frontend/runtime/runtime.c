#include "runtime.h"

#include <stdio.h>
#include <stdlib.h>

/*
 * The runtime defines a main function which calls the compiler generated main
 * function.888
 */
int main() {
  cs411main();
  return 0;
}

/*
 * The runtime defines a function to print an integer.
 */
void cs411println(long i) {
  printf("%ld\n", i);
}

/*
 * Allocate memory for an object and initialize it.
 */
char* cs411newobject(long numbytes) {
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
long* cs411newarray(long numElements) {
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
void cs411error(long code) {
    /*    fprintf(stdout, "MiniJava failure %ld: %s\n", code, (code >= 0 && code < sizeof(errors) / sizeof(char *)) ? errors[code] : "Invalid error code"); */
    fprintf(stdout, "MiniJava failure %ld\n", code);
    exit(0);
}
