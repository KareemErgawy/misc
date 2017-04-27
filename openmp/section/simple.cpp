// ./bin/clang++ -fopenmp -I/usr/lib/gcc/x86_64-redhat-linux/6.3.1/include/ ../../crap/code/openmp/section/simple.cpp -o ../../crap/code/openmp/section/simple.o
// ./bin/clang++ -S -emit-llvm -fopenmp -I/usr/lib/gcc/x86_64-redhat-linux/6.3.1/include/ ../../crap/code/openmp/section/simple.cpp -o ../../crap/code/openmp/section/simple.ll

#include <iostream>
#include <sstream>
#include <omp.h>

void section0() {
  std::stringstream ss;
  ss << "section0 executed by thread: " << omp_get_thread_num()
            << std::endl;
  std::cout << ss.str();
}

void section1() {
std::stringstream ss;
ss << "section1 executed by thread: " << omp_get_thread_num()
          << std::endl;
std::cout << ss.str();
}

int main() {

#pragma omp parallel
  {
    #pragma omp sections
    {
    #pragma omp section
    section0();

    #pragma omp section
    section1();
    }
  }

  return 0;
}
