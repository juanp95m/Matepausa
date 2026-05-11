# Sub-Typing Polymorphism and Abstract Classes

This lesson covers two key OOP concepts in C++: sub-typing polymorphism and abstract classes.

## Sub-Typing Polymorphism (poly1.cpp)

Sub-typing allows a pointer of a base class type to point to an object of a derived class.

```cpp
#include <string>
#include <iostream>

class Character {
public:
    void sayHello(std::string const & target);
};

class Warrior : public Character {
public:
    void sayHello(std::string const & target);
};

class Cat {
    // ...
};

void Character::sayHello(std::string const & target) {
    std::cout << "Hello " << target << " !" << std::endl;
}

void Warrior::sayHello(std::string const & target) {
    std::cout << "F*** off " << target << ", I don't like you !" << std::endl;
}

int main() {
    // This is OK, obviously, Warrior IS a Warrior
    Warrior* a = new Warrior();

    // This is also OK because Warrior IS a Character
    Character* b = new Warrior();

    // This would NOT be ok because Character IS NOT a Warrior
    // Warrior* c = new Character();

    // This would NOT be ok either because Cat IS NOT a Character
    // (They are not even related)
    // Character* d = new Cat();

    a->sayHello("students");
    b->sayHello("students");
}
```

**Key Point**: If W IS-A C, then W can be assigned to a C pointer. The reverse is untrue.

## Abstract Classes and Interfaces (poly2.cpp)

A class with a pure virtual function (`= 0`) is abstract and cannot be instantiated.

```cpp
#include <string>
#include <iostream>

class ACharacter {
public:
    virtual void attack(std::string const & target) = 0;
    void sayHello(std::string const & target);
};

class Warrior : public ACharacter {
public:
    virtual void attack(std::string const & target);
};

void ACharacter::sayHello(std::string const & target) {
    std::cout << "Hello " << target << " !" << std::endl;
}

void Warrior::attack(std::string const & target) {
    std::cout << "*attacks " << target << " with a sword*" << std::endl;
}
```

**Example Interface**: An abstract class can act as an interface.

```cpp
class ICoffeeMaker {
public:
    virtual void fillWaterTank(IWaterSource * src) = 0;
    virtual ICoffee* makeCoffee(std::string const & type) = 0;
};
```

## Key Rules

- **Abstract Classes**: Classes with at least one pure virtual function. They cannot be instantiated.
- **Concrete Classes**: Classes that inherit from abstract classes and implement all pure virtual functions.
- **Instantiation**: You can only instantiate concrete (non-abstract) derived classes.

```cpp
int main() {
    // Valid: Warrior is concrete
    ACharacter* a = new Warrior();

    // Invalid: ACharacter is abstract
    // ACharacter* b = new ACharacter(); // ERROR!

    a->sayHello("students");
    a->attack("roger");
}
```
---

---

---

← [Index](./README.md) | [Previous: 00_Intra_Elearning_sub-typing_polymorphism.md](./00_Intra_Elearning_sub-typing_polymorphism.md) | [Next: Index](./README.md) →
