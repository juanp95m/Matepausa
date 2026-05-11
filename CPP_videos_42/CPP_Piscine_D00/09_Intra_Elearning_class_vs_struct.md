# 09: Class vs. Struct

This lesson compares `class` and `struct` in C++. In C++, they are almost identical. The only difference is their default member visibility:

- **`class`**: Members are `private` by default.
- **`struct`**: Members are `public` by default.

The choice between them is often a matter of convention. `struct` is typically used for simple Plain Old Data (POD) types with few or no methods, while `class` is used for more complex objects with hidden data and a public interface.

## Sample1 (struct)

`Sample1` is defined as a `struct`. Without any access specifiers, its members are public.

```cpp
// Sample1.class.hpp
#ifndef SAMPLE1_CLASS_H
# define SAMPLE1_CLASS_H

struct Sample1 {
    int foo;
    Sample1(void);
    ~Sample1(void);
    void bar(void) const;
};
#endif
```

## Sample2 (class)

`Sample2` is defined as a `class`. Without any access specifiers, its members are private.

```cpp
// Sample2.class.hpp
#ifndef SAMPLE2_CLASS_H
# define SAMPLE2_CLASS_H

class Sample2 {
    int foo;
    Sample2(void);
    ~Sample2(void);
    void bar(void) const;
};
#endif
```

## main.cpp and Compilation

When `main` tries to access members of both, it succeeds for `Sample1` but fails for `Sample2`.

```cpp
#include "Sample1.class.hpp"
#include "Sample2.class.hpp"

int main() {
    Sample1 instance1; // OK, constructor is public
    instance1.foo = 42; // OK, foo is public

    Sample2 instance2; // ERROR, constructor is private
    instance2.foo = 42; // ERROR, foo is private
    return 0;
}
```

### `Sample1` (struct) - Successful Compilation
```bash
$ g++ ... Sample1.class.cpp main.cpp && ./a.out
# Compiles and runs successfully
```

### `Sample2` (class) - Compilation Error
```bash
$ g++ ... Sample2.class.cpp main.cpp
main.cpp: In function ‘int main()’:
main.cpp:8:11: error: ‘Sample2::Sample2()’ is private
     Sample2 instance2;
           ^
main.cpp:9:15: error: ‘int Sample2::foo’ is private
     instance2.foo = 42;
               ^
```
This demonstrates that the members of `Sample2` are `private` by default and cannot be accessed from `main`.
---

---

---

← [Index](./README.md) | [Previous: 08_Intra_Elearning_visibility.md](./08_Intra_Elearning_visibility.md) | [Next: 10_Intra_Elearning_accessors_c.md](./10_Intra_Elearning_accessors_c.md) →
