# Custom Cast Operators

Key concept: User-defined conversion operators in classes.

## Key Points

1. **operator type()**: Define implicit conversions from your class to another type.
2. **Multiple conversions**: Can define conversions to multiple types.
3. **Implicit calls**: Called automatically when type conversion needed.

```cpp
class Foo {
private:
    float _v;
public:
    Foo(float const v) : _v(v) {}

    float getV(void) { return this->_v; }

    operator float() { return this->_v; }
    operator int() { return static_cast<int>(this->_v); }
};

int main() {
    Foo a(420.024f);
    float b = a;    // calls operator float()
    int c = a;      // calls operator int()
    std::cout << a.getV() << std::endl;
    std::cout << b << std::endl;
    std::cout << c << std::endl;
    return 0;
}
```

## Summary

- Define `operator target_type()` for automatic conversions
- Can provide multiple conversion operators
- Enables fluent interfaces but can cause surprising conversions
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_07_const_cast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_07_const_cast.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_09_explicit_keyword.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_09_explicit_keyword.md) →
