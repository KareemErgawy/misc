#include <cstdlib>
#include <iostream>

template <typename T, unsigned CAPACITY> class stack {
public:
  stack() : Size(0) {}

  bool empty() const { return Size == 0; }

  void push(const T &E) {
    if (Size >= CAPACITY) {
      std::cerr << "Trying to push to a full stack!" << std::endl;
      return;
    }

    Elements[Size] = E;
    ++Size;
  }

  T pop() {
    if (empty()) {
      std::cerr << "Trying to pop from an empty stack!" << std::endl;
      std::abort();
    }

    return Elements[--Size];
  }

  void dump() {
    for (int i = 0; i < CAPACITY; ++i) {
      if (i < Size) {
        std::cout << Elements[i] << " ";
      } else {
        std::cout << "_ ";
      }
    }
    std::cout << std::endl;
  }

private:
  T Elements[CAPACITY];
  int Size;
};
