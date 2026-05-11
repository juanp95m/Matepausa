# C++ Ad Hoc Polymorphism (Function Overloading)

This lesson introduces the concept of ad hoc polymorphism, more commonly known as function overloading, in C++.

## Key Concepts

-   **Function Overloading:** In C++, you can define multiple functions with the same name, as long as they have different parameter lists. The difference can be in the number of parameters, the type of parameters, or both.
-   **Compile-Time Polymorphism:** Function overloading is a form of compile-time polymorphism. The compiler determines which version of the function to call based on the arguments you provide.
-   **Not Just for Member Functions:** Function overloading can be used for regular functions as well as class member functions.

## Code Examples

The following code demonstrates function overloading with a class named `Sample`.

### `Sample.class.hpp`

```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

class Sample {

public:
    Sample( void );
    ~Sample( void );
    void bar( char const c ) const;
    void bar( int const n ) const;
    void bar( float const z ) const;
    void bar( Sample const & i ) const;
};

#endif
```

### `Sample.class.cpp`

```cpp
#include <iostream>
#include "Sample.class.hpp"

Sample::Sample( void ) {
    std::cout << "Constructor called" << std::endl;
}

Sample::~Sample( void ) {
    std::cout << "Destructor called" << std::endl;
}

void Sample::bar( char const c ) const {
    std::cout << "Member function bar called with char overload : " << c << std::endl;
}

void Sample::bar( int const n ) const {
    std::cout << "Member function bar called with int overload : " << n << std::endl;
}

void Sample::bar( float const z ) const {
    std::cout << "Member function bar called with float overload : " << z << std::endl;
}

void Sample::bar( Sample const & i ) const {
    (void)i;
    std::cout << "Member function bar called with Sample class overload" << std::endl;
}
```

### `main.cpp`

```cpp
#include "Sample.class.hpp"

int main() {
    Sample instance;

    instance.bar('a');
    instance.bar(42);
    instance.bar(3.14f);
    instance.bar(instance);

    return 0;
}
```

### Compilation and Execution

```bash
g++ -Wall -Wextra -Werror Sample.class.cpp main.cpp
./a.out
```

### Output

```
Constructor called
Member function bar called with char overload : a
Member function bar called with int overload : 42
Member function bar called with float overload : 3.14
Member function bar called with Sample class overload
Destructor called
```

---

---

---

← [Index](./README.md) | [Previous: 00_Intra_Elearning_introduction.md](./00_Intra_Elearning_introduction.md) | [Next: 02_Intra_Elearning_operator_overload.md](./02_Intra_Elearning_operator_overload.md) →
