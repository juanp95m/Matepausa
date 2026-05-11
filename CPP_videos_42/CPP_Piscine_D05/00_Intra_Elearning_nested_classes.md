# Nested Classes

A class can be defined inside another class. The nested class has access to its enclosing class's private members.

```cpp
class Cat {
public:
    class Leg {
        // ...
    };
};

class Dog {
public:
    class Leg {
        // ...
    };
};
```

**Note**: `Cat::Leg` and `Dog::Leg` are distinct types. Each nested class provides logical grouping and encapsulation.
---

---

---

← [Index](./README.md) | [Next: 01_Intra_Elearning_exceptions.md](./01_Intra_Elearning_exceptions.md) →
