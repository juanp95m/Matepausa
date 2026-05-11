# From C Parametric Macros to C++ Templates

## Key Concept

C macros provide simple text substitution without type safety, while C++ templates offer compile-time type-safe generic code.

## Problems with C Macros

- No type checking
- Multiple definitions needed for different types
- Text substitution can cause side effects

## Code Example

```cpp
// C approach - separate functions for each type
int max_int(int x, int y) { return (x >= y) ? x : y; }
float max_float(float x, float y) { return (x >= y) ? x : y; }
char max_char(char x, char y) { return (x >= y) ? x : y; }

// C macro - problematic
#define max(x, y) ((x) >= (y) ? (x) : (y))

// Problem: expressions with side effects fail
max_int(foo(a), foo(b));  // Works
max(foo(a), foo(b));       // May call foo 4 times!
```

## Key Points

1. Macros have no type information
2. Side effects in macro arguments can cause unexpected behavior
3. Need separate functions for each type in C
4. C++ templates solve these problems at compile time
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d07_-_00a_introduction.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_00a_introduction.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d07_-_01_templates.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_01_templates.md) →
