#include <cstdlib>
#include <iostream>

template <typename T, unsigned CAPACITY> class queue {
public:
  queue() : Tail(0), Head(0), Size(0) {}

  bool empty() const { return Size == 0; }

  bool full() {
    return Size == CAPACITY;
  }

  void enqueue(const T &E) {
    if (full()) {
      dump();
      std::cerr << "Trying to enqueue to a full queue!" << std::endl;
      return;
    }

    Elements[Tail] = E;
    Tail = (Tail + 1) % CAPACITY;
    ++Size;
  }

  T dequeue() {
    if (empty()) {
      dump();
      std::cerr << "Trying to dequeue from an empty queue!" << std::endl;
      std::abort();
    }

    int Temp = Head;
    Head = (Head + 1) % CAPACITY;
    --Size;
    return Elements[Temp];
  }

  void dump() {
    for (int i = 0; i < CAPACITY; ++i) {
      if (i == Tail) {
        std::cout << "(T)";
      }

      if (i == Head) {
        std::cout << "(H)";
      }

      if ((Head < Tail && i >= Head && i < Tail) ||
          (!empty() && Head >= Tail && (i >= Head || i < Tail))) {
        std::cout << Elements[i] << " ";
      } else {
        std::cout << "_ ";
      }
    }

    std::cout << std::endl;
  }
private:
  T Elements[CAPACITY];
  int Head;
  int Tail;
  int Size;
};
