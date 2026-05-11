# static_cast

Key concept: Compile-time type conversions with semantic validation.

## Key Points

1. **Value conversions**: Converts between numeric types (double to int, etc.).
2. **Class hierarchy**: Handles upcasts and explicit downcasts.
3. **Validation**: Compiler checks if conversion makes semantic sense.

```cpp
// Value conversion
int a = 42;
double b = a;              // Implicit promotion -> Ok
int c = b;                 // Implicit demotion -> ERROR!
int d = static_cast<int>(b); // Explicit demotion -> Ok

// Class hierarchy
class Parent {};
class Child1 : public Parent {};
class Child2 : public Parent {};

Child1 a;
Parent *b = &a;                      // Implicit upcast -> Ok
Child1 *c = b;                       // Implicit downcast -> ERROR!
Child2 *d = static_cast<Child2 *>(b); // Explicit downcast -> compiles
// ERROR: static_cast from Child1* to Unrelated*
Unrelated *e = static_cast<Unrelated *>(&a);
```

## Summary

- Performs compile-time type checking
- Works for numeric conversions, pointer upcast/downcast
- Rejects invalid conversions between unrelated types
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_03_upcast_and_downcast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_03_upcast_and_downcast.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_05_dynamic_cast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_05_dynamic_cast.md) →
