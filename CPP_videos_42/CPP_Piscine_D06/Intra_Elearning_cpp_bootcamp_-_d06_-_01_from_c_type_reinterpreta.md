# C++ Piscine - Day 06 - From C Type Reinterpretation

We discovered that C cast would allow us to convert types to other types, and that we needed to rearrange the bits to make them match the new type. But there is another particular type of conversion which is very interesting: the identity cast. The base value keeps the same bits after conversion in the same order, so there is no actual conversion during the cast. This particular type of conversion is called **reinterpretation**.

For that, here is a little example. We will work with an `a` variable of a `float` type, having a value `420.042`. For example, this value will be our reference value.

---

## Codigo: main.c

```c
#include <stdio.h>

int main( void ) {
    float a = 420.042f;                // Reference value
    void *b = &a;                     // Implicit reinterpretation cast
    void *c = (void *)&a;            // Explicit reinterpretation cast
    void *d = &a;                     // Implicit promotion -> Ok
    int *e = d;                       // Implicit demotion -> Hazardeous
    int *f = (int *)d;                // Explicit demotion -> Ok, I obey

    printf("%p, %f\n", &a, a);        // Imprime direccion y valor de a

    printf("%p\n", b);                 // Imprime direccion de b (igual a &a)
    printf("%p\n", c);                 // Imprime direccion de c (igual a &a)

    printf("%p\n", d);                 // Imprime direccion de d (igual a &a)
    printf("%p, %d\n", e, *e);         // Imprime direccion e interpreto bits como int
    printf("%p, %d\n", f, *f);        // Imprime direccion e interpreto bits como int

    return 0;
}
```

---

## Explicacion

### Jerarquia de tipos de direcciones

El tipo `void *` es el tipo mas generico para direcciones - puede almacenar la direccion de cualquier tipo.

| Conversion | Tipo | Resultado |
|------------|------|-----------|
| `void *b = &a;` | Implicit reinterpretation | Ok |
| `void *c = (void *)&a;` | Explicit reinterpretation | Ok |
| `void *d = &a;` | Implicit promotion (void* -> void*) | Ok |
| `int *e = d;` | Implicit demotion (void* -> int*) | **Hazardeous** |
| `int *f = (int *)d;` | Explicit demotion | Ok, I obey |

### Salida esperada

```
0x7fff5247eaa4, 420.041992   // &a y valor de a (float)
0x7fff5247eaa4              // b (misma direccion)
0x7fff5247eaa4              // c (misma direccion)
0x7fff5247eaa4              // d (misma direccion)
0x7fff5247eaa4, 1137837408  // e (bits interpretados como int)
0x7fff5247eaa4, 1137837408  // f (bits interpretados como int)
```

### Conceptos clave

1. **Reinterpretacion**: Los mismos bits se interpretan como otro tipo
2. **Jerarquia de tipos**: `void *` es mas generico que otros punteros
3. **Promocion implicita**: void* puede recibir cualquier direccion sin cast
4. **Democion implicita**: De void* a otro tipo necesita cast (peligroso)
5. **Democion explicita**: Con cast funciona, el programador sabe lo que hace

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_00b_from_c_type_conversion.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_00b_from_c_type_conversion.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_02_from_c_type_qualifier_re.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_02_from_c_type_qualifier_re.md) →