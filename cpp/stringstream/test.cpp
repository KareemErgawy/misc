#include <iostream>
#include <sstream>

using namespace std;

int main() {
  string s("12,c,da,32.1");
  stringstream ss(s);
  unsigned long first;
  ss >> first;
  cout << first << endl;

  return 0;
}
