# 11: Comparing Instances

This lesson discusses how to compare instances of a class. There are two main types of comparison:

1.  **Physical Equality**: Comparing the memory addresses of two instances (`&instance1 == &instance2`). This checks if two pointers refer to the exact same object in memory.
2.  **Structural/Logical Equality**: Comparing the actual values of the member variables to see if two different instances hold the same data. This requires a custom comparison function.

## Sample.class.hpp

A `compare` member function is added to the class to perform a structural comparison against another `Sample` instance.

```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

class Sample {

public:

    Sample(int v);
    ~Sample(void);

    int getFoo(void) const;
    int compare(Sample* other) const;

private:

    int _foo;

};

#endif
```

## Sample.class.cpp

The `compare` function returns:
- `-1` if the current instance's `_foo` is less than the other's.
- `1` if it's greater.
- `0` if they are equal.

```cpp
#include <iostream>
#include "Sample.class.hpp"

Sample::Sample(int v) : _foo(v) { /* ... */ }
Sample::~Sample(void) { /* ... */ }

int Sample::getFoo(void) const {
    return this->_foo;
}

int Sample::compare(Sample* other) const {
    if (this->_foo < other->getFoo())
        return -1;
    else if (this->_foo > other->getFoo())
        return 1;
    return 0;
}
```

## main.cpp

The `main` function demonstrates both physical and structural comparisons.

```cpp
#include <iostream>
#include "Sample.class.hpp"

int main() {
    Sample instance1(42);
    Sample instance2(42);

    if (&instance1 == &instance1)
        std::cout << "instance1 and instance1 are physically equal" << std::endl;
    else
        std::cout << "instance1 and instance1 are not physically equal" << std::endl;

    if (&instance1 == &instance2)
        std::cout << "instance1 and instance2 are physically equal" << std::endl;
    else
        std::cout << "instance1 and instance2 are not physically equal" << std::endl;

    if (instance1.compare(&instance1) == 0)
        std::cout << "instance1 and instance1 are structurally equal" << std::endl;
    else
        std::cout << "instance1 and instance1 are not structurally equal" << std::endl;

    if (instance1.compare(&instance2) == 0)
        std::cout << "instance1 and instance2 are structurally equal" << std::endl;
    else
        std::cout << "instance1 and instance2 are not structurally equal" << std::endl;

    return 0;
}
```

## Execution Output

The output shows that `instance1` is physically equal to itself, but not to `instance2` (as they are two separate objects). However, because they both hold the value `42`, they are structurally equal.

```bash
$ ./a.out
instance1 and instance1 are physically equal
instance1 and instance2 are not physically equal
instance1 and instance1 are structurally equal
instance1 and instance2 are structurally equal
```
---

---

---

← [Index](./README.md) | [Previous: 10_Intra_Elearning_accessors_c.md](./10_Intra_Elearning_accessors_c.md) | [Next: 12_Intra_Elearning_non_member_attributes_and_non_member_functions.md](./12_Intra_Elearning_non_member_attributes_and_non_member_functions.md) →
