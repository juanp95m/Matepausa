# Template Specialization

## Key Concept

Specialization allows custom implementations for specific types while using the generic template for others.

## Full Specialization

```cpp
template<typename T, typename U>
class Pair {
public:
    Pair(T const & lhs, U const & rhs) : _lhs(lhs), _rhs(rhs) {
        std::cout << "Generic template" << std::endl;
    }
    T const & fst() const { return this->_lhs; }
    U const & snd() const { return this->_rhs; }
private:
    T const & _lhs;
    U const & _rhs;
};
```

## Partial Specialization (first type is int)

```cpp
template<typename U>
class Pair<int, U> {
public:
    Pair(int lhs, U const & rhs) : _lhs(lhs), _rhs(rhs) {
        std::cout << "Int partial specialization" << std::endl;
    }
    int fst() const { return this->_lhs; }
    U const & snd() const { return this->_rhs; }
private:
    int _lhs;
    U const & _rhs;
};
```

## Full Specialization (both types known)

```cpp
template<>
class Pair<bool, bool> {
public:
    Pair(bool lhs, bool rhs) {
        std::cout << "Bool/bool specialization" << std::endl;
        this->_n = 0;
        this->_n |= static_cast<int>(lhs) << 0;
        this->_n |= static_cast<int>(rhs) << 1;
    }
    bool fst() const { return (this->_n & 0x1); }
    bool snd() const { return (this->_n & 0x2); }
private:
    int _n;
};
```

## Key Points

1. Generic template used when no specialization matches
2. Partial specialization fixes some parameters, leaves others generic
3. Full specialization fixes all parameters
4. Compiler picks most specific matching specialization
5. Useful for optimization or special behavior for specific types
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d07_-_02_default_type.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_02_default_type.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d07_-_04_conclusion.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_04_conclusion.md) →
