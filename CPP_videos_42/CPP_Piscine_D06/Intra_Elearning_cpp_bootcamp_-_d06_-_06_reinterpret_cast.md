# reinterpret_cast

Key concept: Low-level bit reinterpretation without type safety.

## Key Points

1. **Raw memory**: Reinterprets bits without any conversion logic.
2. **Implementation-defined**: Behavior may vary between platforms.
3. **Use cases**: Low-level programming, device drivers, serialization.

---

## Ejemplo: main.cpp

```cpp
#include <iostream>

int main( void ) {
    float a = 420.042f;                            // Reference value
    void *b = &a;                                  // Implicit promotion -> Ok
    int *c = reinterpret_cast<int *>(&a);          // Explicit demotion -> Ok, I obey
    int &d = reinterpret_cast<int &>(a);          // Explicit demotion -> Ok, I obey
    return 0;
}
```

### Explicacion

| Conversion | Tipo | Resultado |
|------------|------|-----------|
| `void *b = &a;` | Implicit promotion (float* -> void*) | Ok |
| `reinterpret_cast<int *>(&a)` | Explicit demotion (void* -> int*) | Compila, reinterpretacion de bits |
| `reinterpret_cast<int &>(a)` | Explicit demotion (float& -> int&) | Compila, reinterpretacion de bits |

### Que hace reinterpret_cast?

- **NO convierte** el valor, solo reinterpreta los bits
- `float a = 420.042f;` tiene cierta representacion en memoria (32 bits IEEE 754)
- `reinterpret_cast<int &>(a)` lee esos mismos 32 bits como si fueran un `int`
- El resultado es un entero con un valor diferente (basado en la representacion binaria)

---

## Resumen

- `reinterpret_cast` no realiza ninguna conversion logica, solo reinterpreta bits
- Es la forma "compilable" de hacer casts inseguros
- El comportamiento es dependiente de la implementacion (puede variar entre plataformas)
- Debe usarse con precaucion y solo cuando sea verdaderamente necesario

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_05_dynamic_cast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_05_dynamic_cast.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_07_const_cast.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_07_const_cast.md) →