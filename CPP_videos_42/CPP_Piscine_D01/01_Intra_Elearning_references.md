# C++ References vs. Pointers

This document provides a concise overview of C++ references, comparing them with pointers for context.

## 1. Understanding References

A reference is an alias for an existing variable. Once a reference is initialized to a variable, it cannot be changed to refer to another variable. Think of it as a constant, non-null, automatically dereferenced pointer.

### `ref1.cpp`: Basic Syntax

This example demonstrates how a reference (`ballsRef`) and a pointer (`ballsPtr`) can both be used to modify a variable (`numberOfBalls`).

```cpp
#include <iostream>

int main()
{
    int numberOfBalls = 42;

    int* ballsPtr = &numberOfBalls;
    int& ballsRef = numberOfBalls;

    std::cout << numberOfBalls << " " << *ballsPtr << " " << ballsRef << std::endl;

    *ballsPtr = 21;
    std::cout << numberOfBalls << std::endl;

    ballsRef = 84;
    std::cout << numberOfBalls << std::endl;

    return (0);
}
```
- **Initialization**: A pointer holds a memory address, while a reference is initialized with the variable itself.
- **Modification**: Modifying the reference or dereferencing the pointer changes the original variable's value.

## 2. Passing Parameters

References are commonly used for passing parameters to functions, providing a cleaner syntax than pointers.

### `ref2.cpp`: Passing by Pointer vs. Reference

This example shows four ways to pass a string to a function.

```cpp
#include <iostream>
#include <string>

// Modifies the string via a pointer
void byPtr(std::string* str) {
    *str += " and ponies";
}

// Reads the string via a const pointer
void byConstPtr(std::string const * str) {
    std::cout << *str << std::endl;
}

// Modifies the string via a reference
void byRef(std::string& str) {
    str += " and ponies";
}

// Reads the string via a const reference
void byConstRef(std::string const & str) {
    std::cout << str << std::endl;
}

int main() {
    std::string str = "i like butterflies";
    std::cout << str << std::endl;
    byPtr(&str);
    byConstPtr(&str);

    str = "i like otters";
    std::cout << str << std::endl;
    byRef(str);
    byConstRef(str);

    return (0);
}
```
- **Clarity**: The calls `byRef(str)` and `byConstRef(str)` have a cleaner syntax than their pointer counterparts, which require passing an address with `&`.
- **Safety**: Using `const` references is a common C++ idiom for passing objects that should not be modified by the function, avoiding both the risk of modification and the overhead of copying.

## 3. Returning by Reference

Functions can also return references, which allows the function call to be used as an l-value (on the left side of an assignment).

### `ref3.cpp`: Getters Returning References and Pointers

This `Student` class provides different ways to access its private `_login` member.

```cpp
#include <iostream>
#include <string>

class Student {
private:
    std::string _login;

public:
    Student(std::string const & login) : _login(login) {}

    std::string& getLoginRef() { return this->_login; }
    std::string const & getLoginRefConst() const { return this->_login; }
    std::string* getLoginPtr() { return &(this->_login); }
    std::string const * getLoginPtrConst() const { return &(this->_login); }
};

int main() {
    Student bob = Student("bfubar");
    Student const jim = Student("jfubar");

    std::cout << bob.getLoginRefConst() << " " << jim.getLoginRefConst() << std::endl;
    std::cout << *(bob.getLoginPtrConst()) << " " << *(jim.getLoginPtrConst()) << std::endl;

    // Modify the login using a reference return
    bob.getLoginRef() = "bobfubar";
    std::cout << bob.getLoginRefConst() << std::endl;

    // Modify the login using a pointer return
    *(bob.getLoginPtr()) = "bobbyfubar";
    std::cout << bob.getLoginRefConst() << std::endl;

    return (0);
}
```
- **Modifiable l-value**: `bob.getLoginRef() = "bobfubar";` is possible because the function returns a direct reference to the `_login` member.
- **Const Correctness**: The `const` student object `jim` can only call `const`-qualified member functions like `getLoginRefConst()`.

## Conclusion: Pointer or Reference?

- **Use a reference when**: You have an object that will **always exist** and you will **not change** what it refers to.
- **Use a pointer when**: The object **might not exist** (i.e., it can be `nullptr`) or you need to **change what it points to**.

---

---

---

← [Index](./README.md) | [Previous: 00_Intra_Elearning_new_and_delete.md](./00_Intra_Elearning_new_and_delete.md) | [Next: 02_Intra_Elearning_filestreams.md](./02_Intra_Elearning_filestreams.md) →
