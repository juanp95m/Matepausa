# C++ Templates

## Key Concept

Templates enable writing generic, type-safe functions and classes that work with any data type. The compiler generates specialized code at compile time.

---

## Codigo: main.cpp

```cpp
#include <iostream>

template< typename T >
T max(T const & x, T const & y) {
    return (x > y) ? x : y;
}

int foo(int x) {
    std::cout << "Long computing time" << std::endl;
    return x;
}

int main( void ) {
    int a = 21;
    int b = 42;
    float c = -1.7f;
    float d = 4.2f;

    std::cout << "Max of " << a << " and " << b << " is ";
    std::cout << max<int>(a, b) << std::endl;          // Explicit instanciation
    std::cout << "Max of " << a << " and " << b << " is ";
    std::cout << max(a, b) << std::endl;              // Implicit instanciation

    std::cout << "Max of " << c << " and " << d << " is ";
    std::cout << max<float>(c, d) << std::endl;       // Explicit instanciation
    std::cout << "Max of " << c << " and " << d << " is ";
    std::cout << max(c, d) << std::endl;              // Implicit instanciation

    return 0;
}
```

---

## Conceptos Clave

1. **Declaracion de parametros**: Usa `typename` o `class` para declarar parametros de tipo en templates
2. **Deduccion de tipos**: Los templates realizan deduccion automatica de tipos en llamadas a funciones
3. **Dos tipos de instanciacion**:
   - **Explicit**: `max<int>(a, b)` - especificas el tipo entre <>
   - **Implicit**: `max(a, b)` - el compilador deduce el tipo
4. **Tiempo de compilacion**: Los templates se resuelven en compile-time, sin overhead en runtime
5. **Generacion de codigo**: Cada tipo unico genera codigo especializado separado

---

## Explicacion del Ejemplo

| Llamada | Tipo | Instanciacion | Resultado |
|---------|------|---------------|-----------|
| `max<int>(a, b)` | int | Explicit | 42 |
| `max(a, b)` | int | Implicit (deduce int) | 42 |
| `max<float>(c, d)` | float | Explicit | 4.2 |
| `max(c, d)` | float | Implicit (deduce float) | 4.2 |

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d07_-_00b_from_c_parametric_macros.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_00b_from_c_parametric_macros.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d07_-_02_default_type.md](./Intra_Elearning_cpp_bootcamp_-_d07_-_02_default_type.md) →