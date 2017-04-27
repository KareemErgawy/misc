#include "queue.hpp"
#include <iostream>

int main() {
  queue<int, 2> s1;
  std::cout << "s1.empty(): " << s1.empty() << std::endl;
  std::cout << "s1.full(): " << s1.full() << std::endl;
  s1.dump();
  s1.enqueue(1);
  s1.dump();
  s1.enqueue(2);
  s1.dump();
  std::cout << s1.dequeue() << std::endl;
  s1.enqueue(3);
  s1.dump();
  std::cout << s1.dequeue() << std::endl;
  std::cout << s1.dequeue() << std::endl;

  return 0;
}
