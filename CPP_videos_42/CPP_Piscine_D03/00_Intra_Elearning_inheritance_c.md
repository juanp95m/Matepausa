# C++ Inheritance

This lesson introduces the fundamental concept of inheritance in object-oriented programming with C++.

## Key Concepts

-   **Inheritance:** Inheritance is a mechanism that allows you to create a new class (the *derived* or *child* class) from an existing class (the *base* or *parent* class). The derived class inherits the members (attributes and methods) of the base class.

-   **"Is-A" Relationship:** Inheritance represents an "is-a" relationship. For example, if a `Cat` class inherits from an `Animal` class, it means a `Cat` *is an* `Animal`. This allows you to use a `Cat` object wherever an `Animal` object is expected.

-   **Syntax:** To make a class inherit from another, you use the `:` symbol in the derived class definition, followed by an access specifier and the name of the base class.
    ```cpp
    class DerivedClass : public BaseClass {
        // ...
    };
    ```

-   **`protected` Access Specifier:** Inheritance introduces a new access specifier, `protected`.
    -   `public`: Members are accessible from anywhere.
    -   `protected`: Members are accessible from within the class itself and from any class that derives from it. They are *not* accessible from outside the class hierarchy.
    -   `private`: Members are accessible *only* from within the class itself. They are *not* accessible by derived classes.

-   **Code Reusability:** Inheritance is a powerful tool for code reuse. Common functionality can be placed in a base class and shared among multiple derived classes, avoiding code duplication.

## Code Example

Here is a simple example demonstrating inheritance. An `Animal` class provides common properties and behaviors, and a `Cat` class inherits from it, adding its own specific functionality.

### `heritage.cpp`

```cpp
#include <string>
#include <iostream>

// Base Class
class Animal {

public:
    Animal(void);
    Animal(Animal const & src);
    Animal & operator=(Animal const & rhs);
    ~Animal(void);

    void run(int distance);

protected:
    int _numberOfLegs;
};

// Derived Class
class Cat : public Animal {

public:
    Cat(void);
    Cat(Cat const & src);
    Cat & operator=(Cat const & rhs);
    ~Cat(void);

    void scornSomeone(std::string const & target);
};

/* --- Animal Class Implementation --- */

Animal::Animal(void) : _numberOfLegs(4) {
    std::cout << "Animal constructor called" << std::endl;
    return;
}

Animal::Animal(Animal const & src) {
    *this = src;
    return;
}

Animal & Animal::operator=(Animal const & rhs) {
    this->_numberOfLegs = rhs._numberOfLegs;
    return *this;
}

Animal::~Animal(void) {
    std::cout << "Animal destructor called" << std::endl;
    return;
}

void Animal::run(int distance) {
    std::cout << "The animal runs " << distance << " meters." << std::endl;
}


/* --- Cat Class Implementation --- */

Cat::Cat(void) {
    std::cout << "Cat constructor called" << std::endl;
    return;
}

Cat::Cat(Cat const & src) {
    *this = src;
    return;
}

Cat & Cat::operator=(Cat const & rhs) {
    this->_numberOfLegs = rhs._numberOfLegs;
    return *this;
}

Cat::~Cat(void) {
    std::cout << "Cat destructor called" << std::endl;
    return;
}

void Cat::scornSomeone(std::string const & target) {
    std::cout << "The cat scorns " << target << "." << std::endl;
}


/* --- Main --- */

int main(void) {
    Cat myCat;

    myCat.run(5);
    myCat.scornSomeone("the mailman");

    return 0;
}
```

### Compilation and Execution

```bash
g++ -Wall -Wextra -Werror heritage.cpp
./a.out
```

### Output

```
Animal constructor called
Cat constructor called
The animal runs 5 meters.
The cat scorns the mailman.
Cat destructor called
Animal destructor called
```

---

---

---

← [Index](./README.md) | [Next: Index](./README.md) →
