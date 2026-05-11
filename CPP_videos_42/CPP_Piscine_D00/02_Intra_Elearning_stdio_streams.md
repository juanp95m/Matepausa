# 02: Standard I/O Streams

This lesson explains C++ standard input and output streams (`std::cin`, `std::cout`), which are used for console I/O. It introduces the stream insertion (`<<`) and extraction (`>>`) operators. `std::endl` is used to insert a newline character and flush the output buffer.

## Code

```cpp
#include <iostream>

int main() {
    std::cout << "Hello world." << std::endl;

    char buff[512];

    std::cout << "Input a word: ";
    std::cin >> buff;

    std::cout << "You entered: [" << buff << "]" << std::endl;

    return 0;
}
```

## Interaction Example

The program first prints "Hello world." then prompts the user to input a word, reads it, and prints it back.

```bash
$ ./a.out
Hello world.
Input a word: unicorn
You entered: [unicorn]
```
---

---

---

← [Index](./README.md) | [Previous: 01_Intra_Elearning_Namespaces.md](./01_Intra_Elearning_Namespaces.md) | [Next: 03_Intra_Elearning_Class_and_instance.md](./03_Intra_Elearning_Class_and_instance.md) →
