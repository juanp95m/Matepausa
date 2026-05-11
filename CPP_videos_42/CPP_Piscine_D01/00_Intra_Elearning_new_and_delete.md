# New and Delete in C++

This document explains the usage of `new` and `delete` operators for dynamic memory allocation in C++, as an alternative to C's `malloc` and `free`.

## Single Object Allocation

The `new` operator allocates memory for an object on the heap and calls its constructor. The `delete` operator calls the object's destructor and deallocates the memory.

```cpp
#include <iostream>
#include <string>

class Student
{
private:
    std::string _login;
public:
    Student(std::string login) : _login(login)
    {
        std::cout << "Student " << this->_login << " is born" << std::endl;
    }
    ~Student()
    {
        std::cout << "Student " << this->_login << " died" << std::endl;
    }
};

int main()
{
    // Object allocated on the stack, automatically destroyed when it goes out of scope.
    Student bob = Student("bfubar");

    // Object allocated on the heap, requires manual destruction.
    Student* jim = new Student("jfubar");

    // ... some stuff can be done here ...

    delete jim; // jim is destroyed by calling destructor, then memory is freed.
    return (0); // bob is destroyed as main() exits.
}
```

- **Stack Allocation**: `bob` is created on the stack. Its destructor is called automatically when the `main` function ends.
- **Heap Allocation**: `jim` is created on the heap using `new`. It must be explicitly destroyed using `delete`. Failure to do so results in a memory leak.

## Array Allocation

To allocate an array of objects, you can use `new[]`. This calls the default constructor for each object in the array. To deallocate the array, you must use `delete[]`.

```cpp
#include <iostream>
#include <string>

class Student
{
private:
    std::string _login;
public:
    Student() : _login("default")
    {
        std::cout << "Student " << this->_login << " is born" << std::endl;
    }
    ~Student()
    {
        std::cout << "Student " << this->_login << " died" << std::endl;
    }
};

int main()
{
    // Allocates an array of 42 Student objects on the heap.
    Student* students = new Student[42];

    // ... do some stuff here ...

    // Deallocates the entire array of students.
    delete [] students;
    return (0);
}
```

- **Array Allocation**: `new Student[42]` allocates memory for 42 `Student` objects and calls the default constructor for each one.
- **Array Deallocation**: `delete[] students` calls the destructor for every object in the array before freeing the memory. Using `delete students` (without `[]`) would only deallocate the first element, leading to resource leaks.

---

---

---

← [Index](./README.md) | [Next: 01_Intra_Elearning_references.md](./01_Intra_Elearning_references.md) →
