int foo(int);
int baz(int);

int bar(int i) {
  if (i > 3) {
    return foo(i);
  } else {
    return baz(i);
  }
}
