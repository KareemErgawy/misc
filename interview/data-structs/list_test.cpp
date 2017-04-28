#include "list.hpp"
#include <iostream>

int main() {
  list<int> l;
  auto *It = l.insert_front(1);
  It = l.insert_front(2);
  It = l.insert_front(3);
  It = l.begin();

  while (It != l.end()) {

    std::cout << It->elem() << std::endl;
    It = It->next();
  }

  return 0;
}
