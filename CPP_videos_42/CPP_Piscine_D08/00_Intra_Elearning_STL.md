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

### Explicacion

| Contenedor | Uso | Caracteristicas |
|------------|-----|-----------------|
| `std::list<int>` | lst1 | Lista doblemente enlazada |
| `std::map<std::string, IOperation*>` | map1 | Mapa clave-valor |
| `std::vector<int>` | v1, v2 | Arrays dinamicos |

### Metodos clave

- `push_back(elemento)` - anade elemento al final
- `begin()` - iterador al primer elemento
- `end()` - iterador past-the-end (no al ultimo)
- `const_iterator` - iterador de solo lectura

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

### Explicacion

- `for_each(begin, end, function)` - aplica una funcion a cada elemento del rango
- `displayInt` es un functor (funcion) que imprime cada entero

---

## Common Containers

| Contenedor | Descripcion | Uso |
|------------|-------------|-----|
| `std::vector<T>` | Array dinamico | Acceso rapido por indice, inserccion al final eficiente |
| `std::list<T>` | Lista doblemente enlazada | Inserccion/eliminacion rapida en cualquier posicion |
| `std::map<K, V>` | Arbol balanceado | Pares clave-valor ordenados por clave |

---

## Key Points

1. **STL containers almacenan elementos por valor** (o puntero si se necesita polimorfismo)
2. **Iteradores** para recorrer contenedores: `begin()`, `end()`
3. **`<algorithm>`** proporciona funciones utiles como `for_each`
4. **`.end()` retorna un iterador past-the-end** (NO es el ultimo elemento)
5. **Templates**: los contenedores son genericos y funcionan con cualquier tipo de dato

---

← [Index](./README.md) | [Previous: D07](../CPP_Piscine_D07/Intra_Elearning_cpp_bootcamp_-_d07_-_04_conclusion.md) | [Next: D00](../CPP_Piscine_D00/README.md) →