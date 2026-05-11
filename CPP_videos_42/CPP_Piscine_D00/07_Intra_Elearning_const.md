# 07: Const Members and Functions

This lesson focuses on the use of the `const` keyword for member variables and member functions.

- A **`const` member variable** must be initialized in the constructor's member initialization list. Its value cannot be changed after initialization.
- A **`const` member function** is a function that promises not to modify the object's state (i.e., it will not change any member variables).

## Sample.class.hpp

The class now includes a `const` float `pi`. The `bar` function is also `const`.

```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

class Sample {

public:

    float const pi;
    int qd;

    Sample(float const f);
    ~Sample(void);

    void bar(void) const;

};

#endif
```

## Sample.class.cpp

The `const` member `pi` is initialized in the member initialization list. `qd` is also initialized here.

```cpp
#include <iostream>
#include "Sample.class.hpp"

Sample::Sample(float const f) : pi(f), qd(42) {
    std::cout << "Constructor called" << std::endl;
    return;
}

Sample::~Sample(void) {
    std::cout << "Destructor called" << std::endl;
    return;
}

void Sample::bar(void) const {
    std::cout << "this->pi = " << this->pi << std::endl;
    std::cout << "this->qd = " << this->qd << std::endl;
    return;
}
```

## main.cpp
```cpp
#include "Sample.class.hpp"

int main() {
    Sample instance(3.14f);
    instance.bar();
    return 0;
}
```

## Execution Output

The program initializes the `const` member and calls the `const` function.

```bash
$ g++ -Wall -Wextra -Werror *.cpp && ./a.out
Constructor called
this->pi = 3.14
this->qd = 42
Destructor called
```

## Compilation Error Example

If you try to modify a member variable inside a `const` member function, the compiler will produce an error.

Consider this change in `Sample::bar`:
```cpp
void Sample::bar(void) const {
    // ...
    this->qd = 0; // ERROR: qd cannot be modified in a const function
    return;
}
```

The compiler would output an error similar to this:
```
Sample.class.cpp: In member function ‘void Sample::bar() const’:
Sample.class.cpp:21:14: error: assignment of member ‘Sample::qd’ in read-only object
     this->qd = 0;
              ^
```
---

---

---

← [Index](./README.md) | [Previous: 06_Intra_Elearning_initialization_list.md](./06_Intra_Elearning_initialization_list.md) | [Next: 08_Intra_Elearning_visibility.md](./08_Intra_Elearning_visibility.md) →
