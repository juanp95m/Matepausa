# C++ Operator Overloading

This lesson explains how to overload operators in C++ to provide custom behavior for your classes.

## Key Concepts

-   **Operator Overloading:** C++ allows you to redefine the behavior of most operators for your own user-defined types (classes and structs). This is done by defining a special member function or a non-member function.

-   **Syntax:** To overload an operator, you use the `operator` keyword followed by the operator symbol you want to overload (e.g., `operator+`, `operator=`, `operator<<`).

-   **Member vs. Non-Member Functions:**
    -   Binary operators like `+` and `=` can be overloaded as member functions. In this case, the left-hand operand is the object the function is called on (`*this`), and the right-hand operand is passed as an argument.
    -   Some operators, like the stream insertion operator (`<<`), must be overloaded as non-member functions. This is because the left-hand operand is an object of a class you didn't write (e.g., `std::ostream`), so you can't add a member function to it.

-   **Return Types:**
    -   Assignment operators (`=`) should return a reference to the current object (`*this`) to allow for chaining assignments (e.g., `a = b = c`).
    -   Arithmetic operators (`+`, `-`, etc.) should return a new object (by value) that is the result of the operation.

## Code Examples

This example demonstrates how to create an `Integer` class that wraps a primitive `int` and overloads the assignment (`=`), addition (`+`), and stream insertion (`<<`) operators.

### `Integer.class.hpp`

```cpp
#ifndef INTEGER_CLASS_H
# define INTEGER_CLASS_H

# include <iostream>

class Integer {

public:

    Integer( int const n );
    ~Integer( void );

    int getValue( void ) const;

    Integer & operator=( Integer const & rhs );
    Integer   operator+( Integer const & rhs ) const;

private:

    int _n;

};

std::ostream & operator<<( std::ostream & o, Integer const & rhs );

#endif
```

### `Integer.class.cpp`

```cpp
#include "Integer.class.hpp"
#include <iostream>

Integer::Integer( int const n ) : _n(n) {
    std::cout << "Constructor called with value " << n << std::endl;
    return;
}

Integer::~Integer( void ) {
    std::cout << "Destructor called with value " << this->_n << std::endl;
    return;
}

int Integer::getValue( void ) const {
    return this->_n;
}

Integer & Integer::operator=( Integer const & rhs ) {
    std::cout << "Assignation operator called from " << this->_n;
    std::cout << " to " << rhs.getValue() << std::endl;

    this->_n = rhs.getValue();

    return *this;
}

Integer Integer::operator+( Integer const & rhs ) const {
    std::cout << "Addition operator called with " << this->_n;
    std::cout << " and " << rhs.getValue() << std::endl;
    return Integer( this->_n + rhs.getValue() );
}

std::ostream & operator<<( std::ostream & o, Integer const & rhs ) {
    o << rhs.getValue();
    return o;
}
```

### `main.cpp`

```cpp
#include <iostream>
#include "Integer.class.hpp"

int main() {
    Integer x(30);
    Integer y(10);
    Integer z(0);

    std::cout << "Value of x : " << x << std::endl;
    std::cout << "Value of y : " << y << std::endl;
    
    y = Integer( 12 );
    std::cout << "Value of y : " << y << std::endl;

    std::cout << "Value of z : " << z << std::endl;
    z = x + y;
    std::cout << "Value of z : " << z << std::endl;
    
    return 0;
}
```

### Compilation and Execution

```bash
g++ -Wall -Wextra -Werror Integer.class.cpp main.cpp
./a.out
```

### Output

```
Constructor called with value 30
Constructor called with value 10
Constructor called with value 0
Value of x : 30
Value of y : 10
Constructor called with value 12
Assignation operator called from 10 to 12
Destructor called with value 12
Value of y : 12
Value of z : 0
Addition operator called with 30 and 12
Constructor called with value 42
Assignation operator called from 0 to 42
Destructor called with value 42
Value of z : 42
Destructor called with value 42
Destructor called with value 12
Destructor called with value 30
```

---

---

---

← [Index](./README.md) | [Previous: 01_Intra_Elearning_adhoc_polymorphism.md](./01_Intra_Elearning_adhoc_polymorphism.md) | [Next: 03_Intra_Elearning_canonical_form.md](./03_Intra_Elearning_canonical_form.md) →
