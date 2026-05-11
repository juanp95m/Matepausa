# Cast Operators Summary

Key concept: Overview of all C++ cast operators and their capabilities.

## Cast Operators Comparison

| Cast | Conv. | Reint. | Upcast | Downcast | Type qual |
|------|-------|--------|--------|-----------|------------|
| Implicit | Yes | Yes | Yes | - | - |
| static_cast | Yes | - | Yes | Yes | - |
| dynamic_cast | - | - | Yes | Yes | - |
| const_cast | - | - | - | - | Yes |
| reinterpret_cast | - | Yes | - | Yes | - |
| C-style cast | Yes | Yes | Yes | Yes | Yes |

## Semantic Checks

| Cast | Semantic Check | Reliable at Run | Tested at Run |
|------|----------------|-----------------|---------------|
| Implicit | Yes | Yes | - |
| static_cast | Yes | - | - |
| dynamic_cast | Yes | Yes | Yes |
| const_cast | - | - | - |
| reinterpret_cast | - | - | - |
| C-style cast | - | - | - |

## Key Points

1. **Prefer C++ casts**: Use `static_cast`, `dynamic_cast`, `const_cast`, `reinterpret_cast` over C-style casts.
2. **Use appropriate cast**: Each cast has specific purpose - choose the right one.
3. **C-style cast is powerful but dangerous**: Can do any conversion, bypassing compiler checks.

```cpp
// Best practice: use specific C++ casts
double d = 3.14;
int i = static_cast<int>(d);          // Value conversion
Base* b = static_cast<Base*>(ptr);   // Downcast
Derived* d = dynamic_cast<Derived*>(b); // Safe downcast
int* p = const_cast<int*>(cp);        // Remove const
void* p = reinterpret_cast<void*>(i); // Raw memory
```

## Summary

- C++ casts provide better type safety than C-style casts
- `static_cast`: general purpose conversions
- `dynamic_cast`: safe runtime-checked downcasts
- `const_cast`: add/remove const
- `reinterpret_cast`: low-level bit reinterpretation
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_09_explicit_keyword.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_09_explicit_keyword.md) | [Next: Index](./README.md) →
