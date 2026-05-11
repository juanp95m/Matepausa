# Default Template Types

## Key Concept

Template parameters can have default values, providing fallback types when not specified.

## Default Type Syntax

```cpp
template<typename T = float>
class Vertex {
public:
    Vertex(T const & x, T const & y, T const & z)
        : _x(x), _y(y), _z(z) {}

    T const & getX() const { return this->_x; }
    T const & getY() const { return this->_y; }
    T const & getZ() const { return this->_z; }

private:
    T const _x;
    T const _y;
    T const _z;
};
```

## Usage

```cpp
int main() {
    // Uses default type (float)
    Vertex<> v1(1.5f, 2.5f, 3.5f);

    // Explicit type specification
    Vertex<int> v2(1, 2, 3);

    std::cout << v1 << std::endl;  // Vertex(1.5, 2.5, 3.5)
    std::cout << v2 << std::endl;  // Vertex(1, 2, 3)
}
```

## Key Points

1. Default template types use `= value` syntax
2. Empty `<>` uses all defaults
3. Mixed: `Vertex<int>` uses int, others fall back to float
4. Useful for generic containers and classes
---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d07_-_01_templates.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_01_templates.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d07_-_03_specialization.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_03_specialization.md) →
