# 08: Member Visibility (Encapsulation)

This lesson covers encapsulation, a core principle of object-oriented programming, which is managed in C++ through access specifiers: `public` and `private`.

- **`public`**: Public members are accessible from anywhere outside the class.
- **`private`**: Private members are only accessible from within other member functions of the same class. They cannot be accessed from outside the class.

This allows a class to hide its internal state and implementation details, exposing only a controlled public interface.

## Sample.class.hpp

The class now has both `public` and `private` members. By convention, private member variables are often prefixed with an underscore (`_`).

```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

class Sample {

public:

    int publicFoo;

    Sample(void);
    ~Sample(void);

    void publicBar(void) const;

private:

    int _privateFoo;

    void _privateBar(void) const;

};

#endif
```

## Sample.class.cpp

The constructor initializes both public and private members. The public function `publicBar` is able to call the private function `_privateBar`.

```cpp
#include <iostream>
#include "Sample.class.hpp"

Sample::Sample(void) : publicFoo(0), _privateFoo(0) {
    std::cout << "Constructor called" << std::endl;
    return;
}

Sample::~Sample(void) {
    std::cout << "Destructor called" << std::endl;
    return;
}

void Sample::publicBar(void) const {
    std::cout << "Member function publicBar called" << std::endl;
    this->_privateBar();
    return;
}

void Sample::_privateBar(void) const {
    std::cout << "Member function _privateBar called" << std::endl;
    return;
}
```

## main.cpp

The main function can access `publicFoo` and `publicBar`, but cannot directly access `_privateFoo` or `_privateBar`.

```cpp
#include <iostream>
#include "Sample.class.hpp"

int main() {
    Sample instance;

    instance.publicFoo = 42;
    std::cout << "instance.publicFoo: " << instance.publicFoo << std::endl;
    instance.publicBar();

    return 0;
}
```

## Execution Output
```bash
$ ./a.out
Constructor called
instance.publicFoo: 42
Member function publicBar called
Member function _privateBar called
Destructor called
```

## Compilation Error Example

Attempting to access a private member from `main` will result in a compile-time error.

```cpp
int main() {
    Sample instance;
    instance._privateFoo = 42; // ERROR
    instance._privateBar();   // ERROR
    return 0;
}
```
The compiler would complain that `_privateFoo` and `_privateBar` are private members and cannot be accessed from this context.
---

---

---

← [Index](./README.md) | [Previous: 07_Intra_Elearning_const.md](./07_Intra_Elearning_const.md) | [Next: 09_Intra_Elearning_class_vs_struct.md](./09_Intra_Elearning_class_vs_struct.md) →
