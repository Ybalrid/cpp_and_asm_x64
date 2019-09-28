#include "func.asm.hpp"
#include <cstdio>

int main()
{
  printf("%d\n", compute_answer());
  printf("8 = %d\n", sum_4_ints(2, 2, 2, 2));
  printf("6 = %d\n", sum_6_ints(1, 1, 1, 1, 1, 1));

  int my_int = 0;
  increment_pointer_int(&my_int);
  printf("1 = %d\n", my_int);

  int a = 1, b = 2;

  printf("before swap %d %d\n", a, b);
  swap(&a, &b);
  printf("after swap %d %d\n", a, b);
  return 0;
}
