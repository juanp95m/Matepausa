# Upcast and Downcast

Key concept: Converting between base and derived class pointers.

## Key Points

1. **Upcast**: Converting derived to base class - always safe and implicit.
2. **Downcast**: Converting base to derived class - unsafe, requires explicit cast.
3. **Safety**: Compiler cannot verify correct type at downcast time.

```cpp
class Parent {};
class Child1 : public Parent {};
class Child2 : public Parent {};

Child1 a;
Parent *b = &a;          // Implicit upcast -> Ok
Parent *c = (Parent *)&a; // Explicit upcast
Parent *d = &a;           // Implicit upcast -> Ok
Child1 *e = d;            // Implicit downcast -> ERROR!
Child2 *f = (Child2 *)d;  // Explicit downcast -> compiles but unsafe
```

The implicit downcast is rejected because the compiler cannot guarantee the object is actually of that derived type.

## Summary

- Upcast (derived to base): safe, implicit
- Downcast (base to derived): dangerous, requires explicit cast
- Wrong downcast leads to undefined behavior
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_02_from_c_type_qualifier_re.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_02_from_c_type_qualifier_re.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_04_static_cast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_04_static_cast.md) →
