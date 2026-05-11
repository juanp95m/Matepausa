# C++ Templates

## Key Concept

Templates enable writing generic, type-safe functions and classes that work with any data type. The compiler generates specialized code at compile time.

## Template Syntax

```cpp
template<typename T>
T max(T const & x, T const & y) {
    return (x >= y) ? x : y;
}
```

## Instantiation Types

```cpp
int main() {
    int a = 21, b = 42;
    float c = -1.7f, d = 4.2f;

    // Explicit instantiation
    std::cout << max<int>(a, b) << std::endl;

    // Implicit instantiation - compiler deduces type
    std::cout << max(a, b) << std::endl;

    std::cout << max<float>(c, d) << std::endl;
    std::cout << max(c, d) << std::endl;
}
```

## Key Points

1. Use `typename` or `class` to declare template type parameters
2. Templates perform type deduction for function calls
3. Both explicit `<int>` and implicit instantiation work
4. Templates are resolved at compile time - no runtime overhead
5. Each unique type generates separate code
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d07_-_00b_from_c_parametric_macros.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_00b_from_c_parametric_macros.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d07_-_02_default_type.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_02_default_type.md) →
