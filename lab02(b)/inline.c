#include <stdio.h>

static inline int add(int x, int y) {
    return x + y;
}

int main() {
    int a = 5, b = 10;
    int result = add(a, b);
    printf("The sum of %d and %d is %d\n", a, b, result);
    return 0;
}