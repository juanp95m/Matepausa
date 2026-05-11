# 13: Pointers to Members

This lesson covers a more advanced topic: pointers to class members. These are different from regular pointers. A pointer to a member points to a member *within a class*, not to a specific memory location. To use it, you must bind it to an actual instance of the class.

- **Pointer to a member variable**: Declared as `type ClassName::*pointerName;`.
- **Pointer to a member function**: Declared as `return_type (ClassName::*pointerName)(args...);`.

To access the member through the pointer, you use the `.*` (dereference pointer to member) operator for instances and `->*` for pointers to instances.

## Sample.class.hpp
```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

class Sample {

public:

    int foo;

    Sample(void);
    ~Sample(void);

    void bar(void) const;

};

#endif
```

## Sample.class.cpp
```cpp
#include <iostream>
#include "Sample.class.hpp"

Sample::Sample(void) : foo(0) { /* ... */ }
Sample::~Sample(void) { /* ... */ }

void Sample::bar(void) const {
    std::cout << "Member function bar called" << std::endl;
}
```

## main.cpp

The main function demonstrates how to declare, assign, and use pointers to both a member variable (`foo`) and a member function (`bar`).

```cpp
#include <iostream>
#include "Sample.class.hpp"

int main() {
    Sample instance;
    Sample* instancep = &instance;

    // Pointer to a member variable
    int Sample::*p = NULL;
    // Pointer to a member function
    void (Sample::*f)(void) const;

    p = &Sample::foo;
    f = &Sample::bar;

    std::cout << "Value of member foo: " << instance.foo << std::endl;

    // Use .* with an instance
    instance.*p = 21;
    std::cout << "Value of member foo: " << instance.foo << std::endl;
    (instance.*f)();

    // Use ->* with a pointer to an instance
    instancep->*p = 42;
    std::cout << "Value of member foo: " << instance.foo << std::endl;
    (instancep->*f)();

    return 0;
}
```

## Execution Output
```bash
$ ./a.out
Value of member foo: 0
Value of member foo: 21
Member function bar called
Value of member foo: 42
Member function bar called
```
---

---

---

← [Index](./README.md) | [Previous: 12_Intra_Elearning_non_member_attributes_and_non_member_functions.md](./12_Intra_Elearning_non_member_attributes_and_non_member_functions.md) | [Next: 14_Intra_Elearning_conclusion.md](./14_Intra_Elearning_conclusion.md) →
