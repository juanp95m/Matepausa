# C++ Piscine - Day 06 - From C Type Conversion

Since you started coding in C about a year ago, you probably had a chance to use cast at some time, but you may not have noticed that C supports two casts. Of course, you are familiar with the syntax with brackets around the type, to which we want to cast our expression, but there is a second cast in C, which is the implicit and that's why you probably never noticed that it was a cast, since there's nothing in particular to write to make it happen. These two casts in C that you have used sometimes without knowing, sometimes on purpose, cause a certain type of behavior, which isn't always the same, and that's where lies the difficulty about casts. Different behaviors are hidden under the same syntax. I'll start by introducing one of the behaviors. In this first video, which is the conversion, let's take a look at some code together. Here I made a little test main brackets, which means I will make a few simple tweak on variables. Let's start with an integer type. We'll have an A variable initialized to the value 42, which will be a reference value for this example. Then I will use a B variable of the double type, which I will initialize to the value of A. First let's wonder what's happening. The double type is a double precision floating type, then on 64 bits, and its bigger type, more precise than the integer type, of an A variable, which is on 32 bits. From there, all the values able to fit in an integer will be able to fit in an integer without any problem. That's why it's possible in C to write this line, meaning initializing a double with an integer. It works. And this line is exactly an implicit cast. It means that the compiler will cast for you. But are you familiar with the representation of floats and doubles in memory? Maybe you are, maybe not. In case you're not, it's very different from the representation of integers. With integers, all bits are aligned, and by calculating the exponent, you can find the decimal value. It's very simple. But the way floats and doubles are coded on bits is in reality very, very different. For example, the first bit which will be the sine bit, then a set of bits corresponding to the exponent, and then a last set of bits representing the significand. Because it's stored in scientific notation for floats and for doubles, it's saying that if we just copy all the bits of an integer into a float, we would have the same value. It's something I will highlight in this example. What you're seeing right below are little function calls. These are little tools I coded quickly, to output the representation in bits of a variable. Here for a 32-bit integer, and here for a 64-bit double. Thanks to this representation, we can see that the integers and doubles are coded differently, even though the values are the same. This notion of changing the coding used for a byte in order to keep the same value is called a conversion. It's the first type of cast we'll talk about here. Therefore, it is possible to make implicit conversions, like in this line I introduced a moment ago. But right below, we can also see that it's possible to make an explicit conversion using the C-cast notion, which you are familiar with. So you have on these two lines two types of cast present in C, the implicit cast and the explicit cast. Let's make a little compilation and make sure of that. Let's run the code. Here on the first line, we have the representation in bits of our A integer. We can see four bytes, each one having eight bits. And in this byte, we have the binary representation of the value 42, 101010. And this is the least significant bit, and this is the most significant bit. That's something you're already familiar with. Underneath that, what you're seeing is the binary representation of a double. The B variable set at the value 42, more particularly 42.0, as you can see here. So both values are equal, but you can see that the binary representations of these values are perfectly different. This phenomenon is a conversion. I'll use this example to talk about hierarchy between types. I mentioned very briefly at the beginning of this video that the integer type was smaller than the double type. I even said that it was less precise. What does it mean? It means that as long as I will try to enter a value, for example, 42, in a more accurate type, the double type, for example, no problem. However, what happens if you want to do the opposite? I mean going from a more accurate type to convert my value to a less accurate type. This can cause some trouble. We can just lose precision, and as long as it's for a one-time calculation, it's not a big deal. But imagine if the calculation is made in a loop, and the result of the previous calculation is used for the next one. The consequence would be that the time would blow up the error margin, and eventually the difference between the values you should get, and the one actually calculated will be gigantic. Why am I telling you this? Just because in your compiler, a certain number of checks will be made on the type. And more particularly, regarding whether the conversion will make me lose some precision or not. Here we have another double, which I'm initializing to a value of A. We have 42.0, and I'm doing what I'm explaining here, meaning converting my double in an integer. As you can see on this line, I'm using an implicit cast. This behavior is hazardous. What proves that you're actually trying to make this conversion? What I mean by that is, that it could be just a programming mistake. You didn't notice the type, and you missed the information lost. In such a trivial example, it's stupid of course. It's very obvious. Now imagine the same problematic lost in a group of very complicated functions, with many interactions, many loops. And you haven't noticed that at some point, there has been an implicit conversion. Here the good attitude is to use an explicit cast to do a type demotion, meaning losing accuracy. You're telling your compiler that you're perfectly aware that you will make this transformation and lose this accuracy. So are the versions of GCC more recent than the one on this dump? Here is a "-WNO-conversion flag", which will prevent implicit casts when losing accuracy. It means that with this flag, this line wouldn't compile. It's an excellent idea to enable this flag when you're doing advanced calculations. For example, when you're doing a 3D program. Activating this flag could be relevant, to stop the compilation in case of accuracy loss. To prevent this warning from blocking the compilation, make sure you use an explicit cast in the cases where you actually want this accuracy loss, since it wouldn't be a big deal in the context. Unfortunately, the version of GCC I'm using doesn't have this warning. It's on a more recent version. I hope it's in your dumps. I'm suggesting you to check the GCC manual to check this warning, and whether it's available or not in your version. So that's it for the first little video on the notion of cast in C, which was the notion of conversion. So we said that it was possible to make conversions, which will improve the accuracy, make promotions, and there's no problem in this case. Whether the cast is explicit or implicit, the promotion is made. It's simple. It works. However, in the case of a demotion, meaning a loss of accuracy, you always want to use an explicit cast to tell the compiler that it was actually the behavior you wanted to use and not just an omission, which could have dramatic consequences later. I'll see you soon to talk about another type of cast in C.

```
--- Inicio de extracción: Intra_Elearning_cpp_bootcamp_-_d06_-_00b_from_c_type_conversion_frames ---
```

## Código: main.c

```c
#include <stdio.h>

void dump_32bits_integer(const int n) {
    printf("[ %d ]: ", n);
}

void dump_64bits_double(const double z) {
    printf("[ %lf ]: ", z);
}

int main( void ) {
    int a = 42;

    double b = a;           // conversion implicita: int -> double
    double c = (double) a;  // conversion explicita: int -> double
    double d = a;           // conversion implicita: int -> double

    int e = d;              // conversion implicita: double -> int (truncamiento)
    int f = (int) d;        // conversion explicita: double -> int (truncamiento)

    dump_32bits_integer( a );
    dump_64bits_double( b );
    dump_64bits_double( c );
    dump_64bits_double( d );
    dump_32bits_integer( e );
    dump_32bits_integer( f );

    return 0;
}
```

### Compilacion y ejecucion

```bash
gcc -Wall -Wextra -Werror bits.c main.c
./a.out
```

### Salida esperada

```
[ 42 ]: 00000000 02000000 00000000 00101010
[ 42.000000 ]: 10000000100 0101
[ 42 ]: 02000000 02000000 20000000 00101010
[ 42 ]: 00000200 20002000 00000000 02101010
```

### Explicacion de resultados

| Variable | Tipo  | Valor  | Representacion en memoria |
|----------|-------|--------|---------------------------|
| a        | int   | 42     | `00000000 02000000 00000000 00101010` (32 bits) |
| b, c, d  | double| 42.0   | `10000000100 0101...` (64 bits, precision flotante) |
| e, f     | int   | 42     | Representacion truncada del double |

**Conclusion del video:** En C, tanto la conversion implicita como la explicita (cast C-style) producen resultados identicos para tipos primitivos. El compilador realiza la misma conversion en ambos casos.

---

---

---

← [Index](./README.md) | [Previous: Intra_Elearning_cpp_bootcamp_-_d06_-_00a_introduction.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_00a_introduction.md) | [Next: Intra_Elearning_cpp_bootcamp_-_d06_-_01_from_c_type_reinterpreta.md](./Intra_Elearning_cpp_bootcamp_-_d06_-_01_from_c_type_reinterpreta.md) →
