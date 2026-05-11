# Exceptions

C++ provides a mechanism for handling errors through exceptions.

## Basic Try-Catch

```cpp
#include <stdexcept>

void test1() {
    try {
        // Do some stuff here
        if (/* there's an error */) {
            throw std::exception();
        } else {
            // Do some more stuff
        }
    }
    catch (std::exception& e) {
        // Handle the error here
    }
}
```

## Throwing Exceptions

```cpp
void test2() {
    // Do some stuff here
    if (/* there's an error */) {
        throw std::exception();
    } else {
        // Do some more stuff
    }
}
```

## Catching and Re-throwing

```cpp
void test3() {
    try {
        test2();
    }
    catch (std::exception& e) {
        // Handle error
    }
}
```

## Custom Exception Classes

```cpp
void test4() {
    class PEBKACException : public std::exception {
    public:
        virtual const char* what() const throw() {
            return "Problem exists between keyboard and chair";
        }
    };

    try {
        test3();
    }
    catch (PEBKACException& e) {
        // Handle the fact that the user is an idiot
    }
}
```

**Key Points**:
- Use `try` to enclose code that might throw.
- Use `catch` to handle exceptions.
- Throw by value, catch by reference (`std::exception& e`).
- Custom exceptions inherit from `std::exception`.
---

---

---

← [Index](./README.md) | [Previous: 00_Intra_Elearning_nested_classes.md](./00_Intra_Elearning_nested_classes.md) | [Next: Index](./README.md) →
