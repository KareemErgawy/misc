// clang++ -fopenmp -I${CLANG_BIN_DIR}/../projects/openmp/runtime/src/simple.cpp -o simple.o
// clang++ -S -emit-llvm -fopenmp -I${CLANG_BIN_DIR}/../projects/openmp/runtime/src/ simple.cpp -o simple.ll

#include <iostream>
#include <omp.h>
#include <sstream>
int omp_get_num_threads();
int init_size();
float *init_arr();
int rand_val();

int main() {
  int i;
  int n;
  float *a, *b;

  n = init_size();
  a = init_arr();
  b = init_arr();

  // for (i = 1; i < n; i++) /* i is private by default */
  //   b[i] = (a[i] + a[i - 1]) / 2.0;

#pragma omp parallel for
  for (i = 1; i < n; i++) /* i is private by default */ {
    if (rand_val() < rand_val()) {
      continue;
    }

    b[i] = (a[i] + a[i - 1]) / 2.0;
  }

  return 0;
}
