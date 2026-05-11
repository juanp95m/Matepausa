# dynamic_cast

Key concept: Runtime-safe downcasting using RTTI (Run-Time Type Information).

## Key Points

1. **Runtime checking**: Validates downcast at runtime, not compile-time.
2. **Polymorphic requirement**: Base class must have at least one virtual function.
3. **Safe failure**: Returns NULL (for pointers) or throws std::bad_cast (for references).

```cpp
#include <iostream>
#include <typeinfo>
#include <exception>

class Parent { public: virtual ~Parent() {} };
class Child1 : public Parent {};
class Child2 : public Parent {};

Child1 a;
Parent *b = &a;

// Pointer version - returns nullptr on failure
Child1 *c = dynamic_cast<Child1 *>(b);
if (c == nullptr)
    std::cout << "Conversion is NOT Ok" << std::endl;
else
    std::cout << "Conversion is Ok" << std::endl;

// Reference version - throws std::bad_cast on failure
try {
    Child2 &d = dynamic_cast<Child2 &>(*b);
    std::cout << "Conversion is Ok" << std::endl;
}
catch (std::bad_cast &bc) {
    std::cout << "Conversion is NOT Ok: " << bc.what() << std::endl;
}
```

## Summary

- Only works with polymorphic types (virtual functions)
- Returns NULL for pointers, throws exception for references
- Safe way to attempt downcasts at runtime
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_04_static_cast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_04_static_cast.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_06_reinterpret_cast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_06_reinterpret_cast.md) →
