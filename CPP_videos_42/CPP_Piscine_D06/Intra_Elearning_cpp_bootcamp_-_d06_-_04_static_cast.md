# static_cast

Key concept: Compile-time type conversions with semantic validation.

## Key Points

1. **Value conversions**: Converts between numeric types (double to int, etc.).
2. **Class hierarchy**: Handles upcasts and explicit downcasts.
3. **Validation**: Compiler checks if conversion makes semantic sense.

---

## Ejemplo 1: Clases (main.cpp)

```cpp
#include <iostream>

class Parent {};
class Child1 : public Parent {};
class Child2 : public Parent {};
class Unrelated {};

int main( void ) {
    Child1 a;        // Reference value
    Parent *b = &a;   // Implicit upcast -> Ok
    Child1 *c = b;    // Implicit downcast -> Hell no!
    Child2 *d = static_cast<Child2 *>(b);  // Explicit downcast -> Ok, I obey
    Unrelated *e = static_cast<Unrelated *>(&a);  // Explicit conversion -> No|
    return 0;
}
```

### Explicacion

| Conversion | Tipo | Resultado |
|------------|------|-----------|
| `Parent *b = &a;` | Implicit upcast | Ok |
| `Child1 *c = b;` | Implicit downcast | ERROR (requires explicit cast) |
| `static_cast<Child2 *>(b)` | Explicit downcast | Compila, funciona |
| `static_cast<Unrelated *>(&a)` | Explicit conversion to unrelated type | Compila, pero comportamiento indefinido |

---

## Ejemplo 2: Valores numericos (values.cpp)

```cpp
#include <iostream>

int main( void ) {
    int a = 42;     // Reference value
    double b = a;   // Implicit promotion -> Ok
    int c = b;      // Implicit demotion -> Hell no!
    int d = static_cast<int>(b);  // Explicit demotion -> Ok, I obey
    return 0;
}
```

### Explicacion

| Conversion | Tipo | Resultado |
|------------|------|-----------|
| `double b = a;` | Implicit promotion | Ok |
| `int c = b;` | Implicit demotion | ERROR (precision loss warning/error) |
| `static_cast<int>(b)` | Explicit demotion | Compila, funciona |

---

## Resumen

- `static_cast` realiza verificaciones en tiempo de compilacion
- Funciona para conversiones numericas y punteros en jerarquia de clases
- Rechaza conversiones invalidas entre tipos no relacionados
- El compilador puede emitir warnings con `-Wconversion`

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_03_upcast_and_downcast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_03_upcast_and_downcast.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_05_dynamic_cast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_05_dynamic_cast.md) →