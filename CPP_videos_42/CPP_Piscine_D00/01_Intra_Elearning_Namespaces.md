# 01: Namespaces

This lesson introduces namespaces, a feature in C++ for grouping related symbols and functions to avoid naming conflicts. The example demonstrates defining global variables and functions, and then defining variables and functions with the same name within different namespaces (`Foo` and `Bar`). It also shows how to create a namespace alias (`Muf = Bar`) and how to access members of a namespace using the scope resolution operator (`::`).

## Code

```cpp
#include <stdio.h>

// Global scope
int gl_var = 1;
int f(void) {
    return 2;
}

namespace Foo {
    int gl_var = 3;
    int f(void) {
        return 4;
    }
}

namespace Bar {
    int gl_var = 5;
    int f(void) {
        return 6;
    }
}

namespace Muf = Bar;

int main(void) {
    printf("gl_var: [%d]\n", gl_var);
    printf("f(): [%d]\n\n", f());

    printf("Foo::gl_var: [%d]\n", Foo::gl_var);
    printf("Foo::f(): [%d]\n\n", Foo::f());

    printf("Bar::gl_var: [%d]\n", Bar::gl_var);
    printf("Bar::f(): [%d]\n\n", Bar::f());

    printf("Muf::gl_var: [%d]\n", Muf::gl_var);
    printf("Muf::f(): [%d]\n\n", Muf::f());

    printf("::gl_var: [%d]\n", ::gl_var);
    printf("::f(): [%d]\n", ::f());

    return 0;
}
```

## Execution Output

The program is compiled and run, demonstrating how the different namespaces keep the variables and functions separate.

```bash
$ g++ -Wall -Wextra -Werror main.cpp
$ ./a.out
gl_var: [1]
f(): [2]

Foo::gl_var: [3]
Foo::f(): [4]

Bar::gl_var: [5]
Bar::f(): [6]

Muf::gl_var: [5]
Muf::f(): [6]

::gl_var: [1]
::f(): [2]
```
---

---

---

← [Index](./README.md) | [Previous: 00_Intra_Elearning_Introduction.md](./00_Intra_Elearning_Introduction.md) | [Next: 02_Intra_Elearning_stdio_streams.md](./02_Intra_Elearning_stdio_streams.md) →
