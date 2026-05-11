# 12: Static (Non-Member) Attributes and Functions

This lesson introduces `static` members. Static members belong to the class itself, not to any specific instance of the class.

- A **`static` member variable** is shared among all instances of the class. There is only one copy of it, regardless of how many objects are created. It must be defined and initialized outside the class, usually in the `.cpp` file.
- A **`static` member function** can be called on the class itself, without needing an instance (`ClassName::staticFunction()`). It can only access other static members of the class, not instance-specific members (like non-static variables).

This is useful for things like counting the number of instances created.

## Sample.class.hpp

```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

class Sample {

public:

    Sample(void);
    ~Sample(void);

    static int getNbInst(void);

private:

    static int _nbInst;

};

#endif
```

## Sample.class.cpp

The static variable `_nbInst` is defined and initialized to 0 at the global scope. The constructor increments it, and the destructor decrements it.

```cpp
#include <iostream>
#include "Sample.class.hpp"

// Definition and initialization of the static member
int Sample::_nbInst = 0;

Sample::Sample(void) {
    std::cout << "Constructor called" << std::endl;
    Sample::_nbInst += 1;
    return;
}

Sample::~Sample(void) {
    std::cout << "Destructor called" << std::endl;
    Sample::_nbInst -= 1;
    return;
}

int Sample::getNbInst(void) {
    return Sample::_nbInst;
}
```

## main.cpp

```cpp
#include <iostream>
#include "Sample.class.hpp"

void f(void) {
    Sample instance;
    std::cout << "Number of instances: " << Sample::getNbInst() << std::endl;
    return;
}

int main() {
    std::cout << "Number of instances: " << Sample::getNbInst() << std::endl;
    f();
    std::cout << "Number of instances: " << Sample::getNbInst() << std::endl;
    return 0;
}
```

## Execution Output

The output shows how the static counter `_nbInst` changes as instances are created and destroyed.

```bash
$ ./a.out
Number of instances: 0
Constructor called
Number of instances: 1
Destructor called
Number of instances: 0
```
---

---

---

← [Index](./README.md) | [Previous: 11_Intra_Elearning_comparisons_c.md](./11_Intra_Elearning_comparisons_c.md) | [Next: 13_Intra_Elearning_pointers_to_members.md](./13_Intra_Elearning_pointers_to_members.md) →
