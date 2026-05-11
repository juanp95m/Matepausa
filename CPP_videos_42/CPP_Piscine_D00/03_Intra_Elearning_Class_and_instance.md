# 03: Class and Instance

This lesson introduces the fundamental concepts of classes and instances (objects) in C++. A class is a blueprint for creating objects. An instance is a specific object created from a class. The example shows a simple `Sample` class with a constructor and a destructor.

- The **constructor** (`Sample::Sample`) is a special method that is automatically called when an object of the class is created.
- The **destructor** (`Sample::~Sample`) is called when the object is destroyed (e.g., when it goes out of scope).

## Sample.class.hpp

This is the header file, which contains the class definition.

```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

class Sample {

public:

    Sample(void);
    ~Sample(void);

};

#endif
```

## Sample.class.cpp

This is the implementation file, containing the logic for the constructor and destructor.

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
```

## main.cpp

The main function creates an instance of the `Sample` class.

```cpp
#include "Sample.class.hpp"

int main() {
    Sample instance;
    return 0;
}
```

## Execution Output

When the program runs, the constructor is called upon the creation of `instance`, and the destructor is called when `main` finishes and the instance goes out of scope.

```bash
$ ./a.out
Constructor called
Destructor called
```
---

---

---

← [Index](./README.md) | [Previous: 02_Intra_Elearning_stdio_streams.md](./02_Intra_Elearning_stdio_streams.md) | [Next: 04_Intra_Elearning_Member_attributes_and_member_functions.md](./04_Intra_Elearning_Member_attributes_and_member_functions.md) →
