#include <cstdio>

// To simplify linking, we consider that the ASM defined functions are pure-C
// functions And define the symbol that correspond to their name as an extern
// symbol with C linkage
extern "C" int compute_answer();
extern "C" int sum_4_ints(int, int, int, int); // this is a prototype, the arguments don't have names but you
                                               // can put them there if you want :-)
extern "C" int  sum_6_ints(int, int, int, int, int, int);
extern "C" void increment_pointer_int(int*);

// The calling conventions are pretty much set in stone for x64, and correspond
// to "put 4 first args in registers, the rest on the stack" See the assembly
// file comments for info about how to access these args

int main()
{
  printf("%d\n", compute_answer());
  printf("8 = %d\n", sum_4_ints(2, 2, 2, 2));
  printf("6 = %d\n", sum_6_ints(1, 1, 1, 1, 1, 1));

  int my_int = 0;
  increment_pointer_int(&my_int);
  printf("1 = %d\n", my_int);
  return 0;
}
