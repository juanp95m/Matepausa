# explicit Keyword

Key concept: Prevent implicit conversions in single-argument constructors.

## Key Points

1. **Prevents implicit conversion**: Stops compiler from using constructor as converter.
2. **Explicit still allowed**: Can still use explicit cast when needed.
3. **Multiple arguments**: Only applies to single-argument constructors by default.

```cpp
class A {};
class B {};

class C {
public:
    C(A const &) {}           // Implicit conversion allowed
    explicit C(B const &) {}   // No implicit conversion
};

void f(C const &) {}

int main() {
    A a;
    B b;

    C c1 = a;    // Ok - implicit conversion from A
    C c2 = b;    // ERROR - explicit keyword prevents implicit
    C c3(b);     // Ok - direct initialization allowed
    C c4 = C(b); // Ok - explicit cast allowed
    f(a);        // Ok
    f(b);        // ERROR - cannot implicitly convert B to C
    f(C(b));     // Ok - explicit conversion
}
```

## Summary

- Use `explicit` on constructors to prevent unwanted implicit conversions
- Improves type safety by requiring explicit intent
- Best practice: mark all single-argument constructors explicit unless implicit conversion is truly desired
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_08_cast_operators.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_08_cast_operators.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_10_conclusion.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_10_conclusion.md) →
