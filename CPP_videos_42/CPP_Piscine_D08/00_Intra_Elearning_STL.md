# Introduction to the STL (Standard Template Library)

The STL provides powerful container classes and algorithms for C++ development.

---

## stl1.cpp - STL Containers

```cpp
#include <iostream>
#include <map>
#include <vector>
#include <list>

class IOperation;

int main() {
    std::list<int> lst1;
    std::map<std::string, IOperation*> map1;
    std::vector<int> v1;
    std::vector<int> v2(42, 100);

    lst1.push_back(1);
    lst1.push_back(17);
    lst1.push_back(42);

    map1["opA"] = new OperationA;
    map1["opB"] = new OperationB;

    std::list<int>::const_iterator it;
    std::list<int>::const_iterator ite = lst1.end();

    for (it = lst1.begin(); it != ite; ++it) {
        std::cout << *it << std::endl;
    }

    return 0;
}
```

### Explanation

| Container | Name | Features |
|-----------|------|----------|
| `std::list<int>` | lst1 | Doubly linked list |
| `std::map<std::string, IOperation*>` | map1 | Key-value map |
| `std::vector<int>` | v1, v2 | Dynamic arrays |

### Key Methods

- `push_back(element)` - adds element to the end
- `begin()` - iterator to the first element
- `end()` - past-the-end iterator (not the last element)
- `const_iterator` - read-only iterator

---

## stl2.cpp - Algorithms

```cpp
#include <iostream>
#include <algorithm>
#include <list>

void displayInt(int i) {
    std::cout << i << std::endl;
}

int main() {
    std::list<int> lst;

    lst.push_back(1);
    lst.push_back(23);
    lst.push_back(3);
    lst.push_back(17);
    lst.push_back(20);

    for_each(lst.begin(), lst.end(), displayInt);

    return 0;
}
```

### Output

```
1
23
3
17
20
```

### Explanation

- `for_each(begin, end, function)` - applies a function to each element in the range
- `displayInt` is a functor (function) that prints each integer

---

## Common Containers

| Container | Description | Use Case |
|-----------|-------------|----------|
| `std::vector<T>` | Dynamic array | Fast index access, efficient end insertion |
| `std::list<T>` | Doubly linked list | Fast insert/delete at any position |
| `std::map<K, V>` | Balanced tree | Key-value pairs sorted by key |

---

## Key Points

1. **STL containers store elements by value** (or pointer if polymorphism needed)
2. **Iterators** to traverse containers: `begin()`, `end()`
3. **`<algorithm>`** provides useful functions like `for_each`
4. **`.end()` returns a past-the-end iterator** (NOT the last element)
5. **Templates**: containers are generic and work with any data type

---

← [Index](./README.md) | [Previous: D07](../CPP_Piscine_D07/Intra_Elearning_cpp_bootcamp_-_d07_-_04_conclusion.md) | [Next: D00](../CPP_Piscine_D00/README.md) →