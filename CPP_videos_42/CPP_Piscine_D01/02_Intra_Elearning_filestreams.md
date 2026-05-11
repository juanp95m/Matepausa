# C++ Filestreams

This lesson covers the basics of file I/O in C++ using filestreams.

## Key Concepts

-   **`ifstream` (Input File Stream):** Used for reading from files. You can open a file by passing the filename to the `ifstream` constructor or by using the `.open()` method. You can then read from the file using the `>>` operator, just like you would with `std::cin`.

-   **`ofstream` (Output File Stream):** Used for writing to files. You can open a file for writing by passing the filename to the `ofstream` constructor. You can then write to the file using the `<<` operator, just like you would with `std::cout`.

-   **Closing Files:** It's important to close the file streams using the `.close()` method when you are finished with them. This releases the file handle and ensures that all data is written to the file.

## Code Example: `fstream1.cpp`

The following code demonstrates how to read two integers from a file named `numbers` and write a string to a file named `test.out`.

```cpp
#include <iostream>
#include <fstream>

int main()
{
    std::ifstream ifs("numbers");
    unsigned int dst;
    unsigned int dst2;

    ifs >> dst >> dst2;

    std::cout << dst << " " << dst2 << std::endl;
    ifs.close();

    std::ofstream ofs("test.out");

    ofs << "i like ponies a whole damn lot" << std::endl;
    ofs.close();
}
```

### Compilation and Execution

Assuming you have a file named `numbers` with the content `8 12`, you can compile and run the code as follows:

```bash
g++ fstream1.cpp
./a.out
```

### Output

The program will print the two integers it read from the `numbers` file to the standard output:

```
8 12
```

It will also create a file named `test.out` with the following content:

```
i like ponies a whole damn lot
```

---

---

---

← [Index](./README.md) | [Previous: 01_Intra_Elearning_references.md](./01_Intra_Elearning_references.md) | [Next: Index](./README.md) →
