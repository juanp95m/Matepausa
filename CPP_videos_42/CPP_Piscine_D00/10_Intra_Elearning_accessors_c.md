# 10: Accessors (Getters and Setters)

This lesson explains how to properly interact with private member variables using public accessor methods, commonly known as getters and setters.

- A **getter** is a public member function that returns the value of a private member variable. It's typically named `getVariableName` and should be `const` because it doesn't modify the object's state.
- A **setter** is a public member function that modifies the value of a private member variable. It's typically named `setVariableName` and often includes logic to validate the new value before assignment.

This pattern allows the class to maintain control over its internal state.

## Sample.class.hpp

The class has a private integer `_foo` and provides a public getter `getFoo` and a public setter `setFoo`.

```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

class Sample {

public:

    Sample(void);
    ~Sample(void);

    int getFoo(void) const;
    void setFoo(int v);

private:

    int _foo;

};

#endif
```

## Sample.class.cpp

The setter includes a check to ensure the new value is non-negative.

```cpp
#include <iostream>
#include "Sample.class.hpp"

Sample::Sample(void) : _foo(0) {
    std::cout << "Constructor called" << std::endl;
    return;
}

Sample::~Sample(void) {
    std::cout << "Destructor called" << std::endl;
    return;
}

int Sample::getFoo(void) const {
    return this->_foo;
}

void Sample::setFoo(int v) {
    if (v >= 0)
        this->_foo = v;
    return;
}
```

## main.cpp

The `main` function uses the getter and setter to interact with the private `_foo` member.

```cpp
#include <iostream>
#include "Sample.class.hpp"

int main() {
    Sample instance;

    std::cout << "instance.getFoo(): " << instance.getFoo() << std::endl;
    instance.setFoo(42);
    std::cout << "instance.getFoo(): " << instance.getFoo() << std::endl;
    instance.setFoo(-42); // This will be ignored by the setter
    std::cout << "instance.getFoo(): " << instance.getFoo() << std::endl;

    return 0;
}
```

## Execution Output

The output demonstrates that the value of `_foo` is only changed when a valid (non-negative) value is passed to the setter.

```bash
$ ./a.out
Constructor called
instance.getFoo(): 0
instance.getFoo(): 42
instance.getFoo(): 42
Destructor called
```
---

---

---

← [Index](./README.md) | [Previous: 09_Intra_Elearning_class_vs_struct.md](./09_Intra_Elearning_class_vs_struct.md) | [Next: 11_Intra_Elearning_comparisons_c.md](./11_Intra_Elearning_comparisons_c.md) →
