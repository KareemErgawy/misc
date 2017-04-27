#include "stack.hpp"
#include <iostream>

int main() {
  stack<int, 5> s;
  std::cout << "s.empty(): "<< s.empty() << std::endl;
  s.push(1);
  s.push(2);
  s.push(3);
  s.push(4);
  s.push(5);
  s.push(6);

  std::cout << "s.empty(): "<< s.empty() << std::endl;
  std::cout << s.pop() << std::endl;
  std::cout << s.pop() << std::endl;
  std::cout << s.pop() << std::endl;
  std::cout << s.pop() << std::endl;
  std::cout << s.pop() << std::endl;
  std::cout << s.pop() << std::endl;

  return 0;
}
