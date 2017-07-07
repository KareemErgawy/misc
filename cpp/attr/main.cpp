#include <iostream>

void f() {
  std::cout << "f\n";
}
void g() {
  std::cout << "g\n";
}
void h() {
  std::cout << "h\n";
}
void i() {
  std::cout << "i\n";
}
void p() {
  std::cout << "p\n";
}
void q() {
  std::cout << "q\n";
}
void r() {
  std::cout << "r\n";
}

int main() {
  int n = 44;
  int x = 1;

  // compile with -Wimplicit-fallthrough
  switch (n) {
  case 22:
  case 33:  // no warning: no statements between case labels
    f();
  case 44:  // warning: unannotated fall-through
    g();
    [[clang::fallthrough]];
  case 55:  // no warning
    if (x) {
      h();
      break;
    }
    else {
      i();
      [[clang::fallthrough]];
    }
  case 66:  // no warning
    p();
    q();
  case 77:  // warning: unannotated fall-through
    r();
} 
  return 0;
}
