# Sub-Typing Polymorphism

This lesson demonstrates sub-typing polymorphism, where a pointer of a base class type can point to an object of a derived class.

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
    // OK: Warrior IS a Warrior
    Warrior* a = new Warrior();

    // OK: Warrior IS a Character
    Character* b = new Warrior();

    // NOT OK: Character IS NOT a Warrior
    // Warrior* c = new Character();

    // NOT OK: Cat IS NOT a Character (unrelated)
    // Character* d = new Cat();

    a->sayHello("students");
    b->sayHello("students");
}
```

**Key Principle**: If `W IS-A C`, then a `C*` can point to a `W`. The reverse is untrue. Even if two classes are related by inheritance, the base class pointer cannot hold a derived class instance if the relationship doesn't hold in that direction.
---

---

---

← [Index](./README.md) | [Next: 01_Intra_Elearning_abstract_classes_and_interfaces.md](./01_Intra_Elearning_abstract_classes_and_interfaces.md) →
