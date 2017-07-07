// clang++ -fopenmp -I${CLANG_BIN_DIR}/../projects/openmp/runtime/src/simple.cpp
// -o simple.o clang++ -S -emit-llvm -fopenmp
// -I${CLANG_BIN_DIR}/../projects/openmp/runtime/src/ simple.cpp -o simple.ll

#include <iostream>
#include <omp.h>
#include <sstream>
int omp_get_num_threads();

void task0(float x, int y) {
  // std::stringstream ss;
  // ss << "task0 executed by thread: " << omp_get_thread_num()
  //           << std::endl;
  // std::cout << ss.str();
}

void task1(int x) {
  // std::stringstream ss;
  // ss << "task1 executed by thread: " << omp_get_thread_num()
  //           << std::endl;
  // std::cout << ss.str();
}

int read_int() {
  int x;
  std::cin >> x;
  return x;
}

int main() {
  int x;
  float y;
  int *z;
  x = read_int();
  y = read_int();
  task0(y, x);
  z = &x;

  if (omp_get_num_threads() == 1) {
#pragma omp parallel
    {
#pragma omp master
      {
#pragma omp task
        { task0(y, x); }
        task1(*z);
#pragma omp taskwait
      }
    }
  } else {
#pragma omp task
    { task0(y, x); }
    task1(*z);
#pragma omp taskwait
  }
  return 0;
}
