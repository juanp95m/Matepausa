# 06: Member Initialization List

This lesson introduces the member initialization list, which is the preferred way to initialize class members in C++. Instead of assigning values to members inside the constructor's body, you initialize them in a list between the constructor's parameter list and its body.

This is more efficient and is required for certain types of members, such as `const` members and reference members.

Two classes are shown to contrast the two methods:

- `Sample1`: Initializes members inside the constructor body.
- `Sample2`: Uses a member initialization list.

## Sample1.class.hpp
```cpp
#ifndef SAMPLE1_CLASS_H
# define SAMPLE1_CLASS_H

class Sample1 {

public:

    char a1;
    int a2;
    float a3;

    Sample1(char p1, int p2, float p3);
    ~Sample1(void);

};

#endif
```

## Sample1.class.cpp
```cpp
#include <iostream>
#include "Sample1.class.hpp"

Sample1::Sample1(char p1, int p2, float p3) {
    std::cout << "Constructor called" << std::endl;

    this->a1 = p1;
    std::cout << "this->a1 = " << this->a1 << std::endl;
    this->a2 = p2;
    std::cout << "this->a2 = " << this->a2 << std::endl;
    this->a3 = p3;
    std::cout << "this->a3 = " << this->a3 << std::endl;
}

Sample1::~Sample1(void) {
    std::cout << "Destructor called" << std::endl;
}
```

## Sample2.class.hpp
```cpp
#ifndef SAMPLE2_CLASS_H
# define SAMPLE2_CLASS_H

class Sample2 {

public:

    char a1;
    int a2;
    float a3;

    Sample2(char p1, int p2, float p3);
    ~Sample2(void);

};

#endif
```

## Sample2.class.cpp
```cpp
#include <iostream>
#include "Sample2.class.hpp"

// Initialization list is here -> : a1(p1), a2(p2), a3(p3)
Sample2::Sample2(char p1, int p2, float p3) : a1(p1), a2(p2), a3(p3) {
    std::cout << "Constructor called" << std::endl;
    std::cout << "this->a1 = " << this->a1 << std::endl;
    std::cout << "this->a2 = " << this->a2 << std::endl;
    std::cout << "this->a3 = " << this->a3 << std::endl;
}

Sample2::~Sample2(void) {
    std::cout << "Destructor called" << std::endl;
}
```

## main.cpp
```cpp
#include "Sample1.class.hpp"
#include "Sample2.class.hpp"

int main() {
    Sample1 instance1('a', 42, 4.2f);
    Sample2 instance2('b', 84, 8.4f);
    return 0;
}
```

## Execution Output

The program is compiled and run, demonstrating both approaches.

```bash
$ g++ -Wall -Wextra -Wno-unused -Werror Sample1.class.cpp Sample2.class.cpp main.cpp
$ ./a.out
Constructor called
this->a1 = a
this->a2 = 42
this->a3 = 4.2
Constructor called
this->a1 = b
this->a2 = 84
this->a3 = 8.4
Destructor called
Destructor called
```
---

---

---

← [Index](./README.md) | [Previous: 05_Intra_Elearning_this.md](./05_Intra_Elearning_this.md) | [Next: 07_Intra_Elearning_const.md](./07_Intra_Elearning_const.md) →
