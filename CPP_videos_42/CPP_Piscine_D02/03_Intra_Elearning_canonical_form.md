# C++ Canonical Form (Coplian Form)

This lesson explains the concept of the Canonical Form (also known as Coplian Form) in C++, which is a set of conventions for class design that ensures predictable and consistent behavior, especially regarding object copying and assignment.

## Key Components of a Canonical Class

A class is considered to be in canonical form if it includes the following four special member functions:

1.  **Default Constructor:** A constructor that can be called with no arguments. It initializes the object to a default state. If you define any other constructor, the compiler will no longer generate a default one for you.
2.  **Copy Constructor:** A constructor that takes a `const` reference to another object of the same class and creates a new object that is a copy of the one passed as an argument.
3.  **Assignment Operator Overload (`operator=`):** Overloads the assignment operator to handle copying the state from one existing object to another. It should handle self-assignment and return a reference to the current object (`*this`) to allow for chaining.
4.  **Destructor:** The destructor is responsible for cleaning up any resources the object has acquired. In canonical form, it's often declared `virtual` to ensure that the correct destructor is called for objects in an inheritance hierarchy (though the `virtual` keyword is introduced in a later lesson).

Adhering to the canonical form is a crucial best practice in C++ for managing resource ownership and preventing common bugs related to object lifecycle.

## Code Examples

Here is the implementation of a `Sample` class that follows the canonical form.

### `Sample.class.hpp`

```cpp
#ifndef SAMPLE_CLASS_H
# define SAMPLE_CLASS_H

# include <iostream>

class Sample {

public:
    Sample( void );
    Sample( int const n );
    Sample( Sample const & src );
    ~Sample( void );

    Sample & operator=( Sample const & rhs );

    int getFoo( void ) const;

private:
    int _foo;
};

std::ostream & operator<<( std::ostream & o, Sample const & i );

#endif
```

### `Sample.class.cpp`

```cpp
#include <iostream>
#include "Sample.class.hpp"

Sample::Sample(void) : _foo(0) {
	std::cout << "Default Constructor called" << std::endl;
	return;
}

Sample::Sample(int const n) : _foo(n) {
	std::cout << "Parametric Constructor called with " << n << std::endl;
	return;
}

Sample::Sample(Sample const & src) {
	std::cout << "Copy constructor called" << std::endl;
	*this = src;
	return;
}

Sample::~Sample(void) {
	std::cout << "Destructor called" << std::endl;
	return;
}

Sample & Sample::operator=(Sample const & rhs) {
	std::cout << "Assignation operator called" << std::endl;
	if (this != &rhs)
		this->_foo = rhs.getFoo();
	return *this;
}

int Sample::getFoo(void) const {
	return this->_foo;
}

std::ostream & operator<<(std::ostream & o, Sample const & i) {
	o << "The value of _foo is: " << i.getFoo();
	return o;
}
```

### `main.cpp`

```cpp
#include "Sample.class.hpp"

int main() {
    Sample instance1;
    Sample instance2(42);
    Sample instance3(instance1);

    std::cout << instance1 << std::endl;
    std::cout << instance2 << std::endl;
    std::cout << instance3 << std::endl;

    instance3 = instance2;
    std::cout << instance3 << std::endl;

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
Default Constructor called
Parametric Constructor called with 42
Copy constructor called
Assignation operator called
The value of _foo is: 0
The value of _foo is: 42
The value of _foo is: 0
Assignation operator called
The value of _foo is: 42
Destructor called
Destructor called
Destructor called
```

---

---

---

← [Index](./README.md) | [Previous: 02_Intra_Elearning_operator_overload.md](./02_Intra_Elearning_operator_overload.md) | [Next: 04_Intra_Elearning_conclusion.md](./04_Intra_Elearning_conclusion.md) →
