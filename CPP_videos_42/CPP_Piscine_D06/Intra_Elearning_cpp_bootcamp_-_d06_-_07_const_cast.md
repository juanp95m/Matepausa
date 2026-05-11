# const_cast

Key concept: Adding or removing const/volatile qualifiers.

## Key Points

1. **Only qualifier**: Only changes const/volatile, not the underlying type.
2. **Dual purpose**: Can both add and remove const.
3. **Undefined behavior**: Modifying a originally-const object is undefined.

```cpp
int a = 42;
int const *b = &a;              // Implicit promotion -> Ok
int *c = b;                     // Implicit demotion -> ERROR!
int *d = const_cast<int *>(b);  // Explicit demotion -> Ok

// Using const_cast to call non-const member function
class Foo {
public:
    void modify() {}
};
void process(const Foo& f) {
    const_cast<Foo&>(f).modify();  // Undefined if f was truly const
}
```

## Summary

- Only C++ cast that can modify constness
- Should be used carefully - bypassing const is dangerous
- Legitimate use: calling non-const member functions on const objects you know aren't truly const
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_06_reinterpret_cast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_06_reinterpret_cast.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_08_cast_operators.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_08_cast_operators.md) →
