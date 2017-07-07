#include <string>

void reverseWord(std::string &, int, int);

std::string reverseWords(std::string s) {
  size_t idx = 0;
  size_t len = s.length();

  while (idx < len) {
    for (; idx < len && s[idx] == ' '; ++idx)
      ;
    int begin = idx;
    for (; idx < len && s[idx] != ' '; ++idx)
      ;
    reverseWord(s, begin, idx - 1);
  }

  return s;
}

void reverseWord(std::string &s, int begin, int end) {
  while (begin < end) {
    char temp = s[begin];
    s[begin] = s[end];
    s[end] = temp;
    ++begin;
    --end;
  }
}
