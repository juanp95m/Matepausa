# 04: Member Attributes and Member Functions

This lesson builds upon the previous one by adding a public member attribute (`foo`) and a public member function (`bar`) to the `Sample` class.

- **Member attributes** (or member variables) are variables that belong to an object of a class.
- **Member functions** (or methods) are functions that belong to an object of a class and can operate on its data.

## Sample.class.hpp

The class now has an integer `foo` and a function `bar`.

```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

class Sample {

public:

    int foo;

    Sample(void);
    ~Sample(void);

    void bar(void);

};

#endif
```

## Sample.class.cpp

The implementation for the `bar` function is added.

```cpp
#include <iostream>
#include "Sample.class.hpp"

Sample::Sample(void) {
    std::cout << "Constructor called" << std::endl;
    return;
}

Sample::~Sample(void) {
    std::cout << "Destructor called" << std::endl;
    return;
}

void Sample::bar(void) {
    std::cout << "Member function bar called" << std::endl;
    return;
}
```

## main.cpp

The main function now accesses the public member `foo` and calls the public member function `bar` using the dot operator (`.`).

```cpp
#include <iostream>
#include "Sample.class.hpp"

int main() {
    Sample instance;

    instance.foo = 42;
    std::cout << "instance.foo: " << instance.foo << std::endl;

    instance.bar();

    return 0;
}
```

## Execution Output

The output shows the constructor call, the modification and access of `instance.foo`, the call to `instance.bar()`, and finally the destructor call.

```bash
$ ./a.out
Constructor called
instance.foo: 42
Member function bar called
Destructor called
```
---

---

---

← [Index](./README.md) | [Previous: 03_Intra_Elearning_Class_and_instance.md](./03_Intra_Elearning_Class_and_instance.md) | [Next: 05_Intra_Elearning_this.md](./05_Intra_Elearning_this.md) →
