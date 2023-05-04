#include<stdio.h>
int main()
{
 dataArray(7);
}
void dataArray (int num) {

int i;

int array[10];

for ( i=0; i<10; i=i+1){

array[i] = compare(num, i);
printf("%d\n",array[i]);
}

}

int compare (int a, int b) {

if (sub(a, b) >= 0)

return 1;

else 

return 0;

}

int sub (int a, int b) {

return a - b;

}