# 05: The 'this' Pointer

This lesson introduces the `this` pointer. Inside a member function, `this` is a pointer to the current object instance. It's used to access member variables and functions of that specific instance.

The lesson also introduces making a member function `const`. A `const` member function promises not to modify any member variables of the object. Attempting to do so will result in a compilation error.

## Sample.class.hpp

The `bar` function is now declared as `const`.

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

The constructor now uses `this->foo` to initialize the member variable and calls `this->bar()`.

```cpp
#include <iostream>
#include "Sample.class.hpp"

Sample::Sample(void) {
    std::cout << "Constructor called" << std::endl;
    this->foo = 42;
    std::cout << "this->foo: " << this->foo << std::endl;
    this->bar();
    return;
}

Sample::~Sample(void) {
    std::cout << "Destructor called" << std::endl;
    return;
}

void Sample::bar(void) const {
    std::cout << "Member function bar called" << std::endl;
    return;
}
```

## main.cpp

The main function remains the same, simply instantiating the class.

```cpp
#include "Sample.class.hpp"

int main() {
    Sample instance;
    return 0;
}
```

## Execution Output

The output shows that the constructor sets the value of `foo`, prints it, and calls `bar`.

```bash
$ ./a.out
Constructor called
this->foo: 42
Member function bar called
Destructor called
```
---

---

---

← [Index](./README.md) | [Previous: 04_Intra_Elearning_Member_attributes_and_member_functions.md](./04_Intra_Elearning_Member_attributes_and_member_functions.md) | [Next: 06_Intra_Elearning_initialization_list.md](./06_Intra_Elearning_initialization_list.md) →
