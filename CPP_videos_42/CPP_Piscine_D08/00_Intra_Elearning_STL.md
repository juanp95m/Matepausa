# Introduction to the STL (Standard Template Library)

The STL provides powerful container classes and algorithms for C++ development.

## STL Containers

```cpp
#include <iostream>
#include <map>
#include <vector>
#include <list>

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

## Common Containers

- **std::vector**: Dynamic array, fast random access
- **std::list**: Doubly linked list, fast insertion/removal
- **std::map**: Key-value pairs, sorted by key

## Iterators and Algorithms

```cpp
#include <iostream>
#include <algorithm>
#include <list>

void displayInt(int i) {
    std::cout << i << std::endl;
}

int main() {
    std::list<int> lst;
    lst.push_back(10);
    lst.push_back(23);
    lst.push_back(3);
    lst.push_back(17);
    lst.push_back(20);

    for_each(lst.begin(), lst.end(), displayInt);

    return 0;
}
```

Output:
```
10
23
3
17
20
```

**Key Points**:
- STL containers store elements by value (or pointer)
- Use iterators to traverse containers
- `<algorithm>` provides useful functions like `for_each`
---

---

---

← [Index](./README.md) | [Next: Index](./README.md) →
