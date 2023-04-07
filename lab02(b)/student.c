#include <stdio.h>

struct student {
    char name[50];
    int id;
    int age;
};

int main() {
    struct student s;

    printf("Enter name: ");
    scanf("%s", s.name);

    printf("Enter ID: ");
    scanf("%d", &s.id);

    printf("Enter age: ");
    scanf("%d", &s.age);

    printf("Name: %s\n", s.name);
    printf("ID: %d\n", s.id);
    printf("Age: %d\n", s.age);

    return 0;
}