# Type Qualifier Cast

Key concept: Converting between `const`/`volatile` qualified pointers.

## Key Points

1. **Implicit promotion**: Adding const is safe and allowed automatically.
2. **Implicit demotion**: Removing const is unsafe and forbidden by compiler.
3. **Explicit demotion**: Using explicit cast allows removing const qualifier.

```cpp
int a = 42;
int const *b = &a;          // Implicit promotion -> Ok
int const *c = (int const *)&a;  // Explicit type qualifier cast
int const *d = &a;          // Implicit promotion -> Ok
int *e = d;                 // Implicit demotion -> ERROR!
int *f = (int *)d;          // Explicit demotion -> Ok
```

The compiler prevents accidental removal of const, but explicit casts bypass this safety check.

## Summary

- Implicit `const` addition: allowed
- Implicit `const` removal: prohibited
- Explicit `const` removal: compiles but may cause undefined behavior
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_01_from_c_type_reinterpreta.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_01_from_c_type_reinterpreta.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_03_upcast_and_downcast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_03_upcast_and_downcast.md) →
