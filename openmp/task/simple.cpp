// ./bin/clang++ -fopenmp -I/usr/lib/gcc/x86_64-redhat-linux/6.3.1/include/ ../../crap/code/openmp/task/simple.cpp -o ../../crap/code/openmp/task/simple.o
// clang++ -S -emit-llvm -fopenmp -I${CLANG_BIN_DIR}/../projects/openmp/runtime/src/ simple.cpp -o simple.ll

// #include <iostream>
// #include <sstream>
// #include <omp.h>
int omp_get_num_threads();

void task0() {
  // std::stringstream ss;
  // ss << "task0 executed by thread: " << omp_get_thread_num()
  //           << std::endl;
  // std::cout << ss.str();
}

void task1() {
  // std::stringstream ss;
  // ss << "task1 executed by thread: " << omp_get_thread_num()
  //           << std::endl;
  // std::cout << ss.str();
}

int main() {
  // if (omp_get_num_threads() == 1) {
#pragma omp parallel
    {
#pragma omp master 
      {
#pragma omp task
        { /*task0();*/ }
        // task1();
// #pragma omp taskwait
      }
    }
//   } else {
// #pragma omp task
//     { task0(); }
//     task1();
// #pragma omp taskwait
  // }
  return 0;
}
