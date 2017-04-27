#include <algorithm>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include <omp.h>
#include <sched.h>
#include <sstream>
#include <iomanip>

int CoreTaskCounters[8];

void mergeSortSections(int *First, int *Last, int *Arr) {
  std::stringstream ss;
  ss << "Thread num, Core: " << omp_get_thread_num() << ", " << sched_getcpu();
  ss << " -- Range: [" << (First - Arr) << ", " << (Last - Arr) << ")"
     << std::endl;
  std::cout << ss.str();
  CoreTaskCounters[sched_getcpu()]++;

  if (First == Last || First + 1 == Last) {
    return;
  }

  auto Mid = First + (Last - First) / 2;

// #pragma omp parallel
  {
#pragma omp sections
    {
#pragma omp section
      mergeSortSections(First, Mid, Arr);

#pragma omp section
      mergeSortSections(Mid, Last, Arr);
    }
  }

  std::inplace_merge(First, Mid, Last);
}

void mergeSortTasks(int *First, int *Last, int *Arr) {
  std::stringstream ss;
  ss << "Thread num, Core: " << omp_get_thread_num() << ", " << sched_getcpu();
  ss << " -- Range: [" << (First - Arr) << ", " << (Last - Arr) << ")"
     << std::endl;
  std::cout << ss.str();
  CoreTaskCounters[sched_getcpu()]++;

  if (First == Last || First + 1 == Last) {
    return;
  }

  auto Mid = First + (Last - First) / 2;

#pragma omp parallel
  {
#pragma omp single
    {
#pragma omp task
      mergeSortTasks(First, Mid, Arr);

#pragma omp task
      mergeSortTasks(Mid, Last, Arr);

#pragma omp taskwait
    }
  }

  std::inplace_merge(First, Mid, Last);
}

int main() {
  omp_set_dynamic(0);
  omp_set_nested(1);

  const int ArrSize = 256;
  int Arr[ArrSize];

  std::srand(std::time(0));
  std::for_each(Arr, Arr + ArrSize, [](int &E) { E = std::rand() % 10; });

  std::cout << "=== Input ===" << std::endl;
  std::for_each(Arr, Arr + ArrSize, [](int E) { std::cout << E << " "; });
  std::cout << std::endl;
  std::cout << "=============" << std::endl;

#pragma omp parallel
  mergeSortSections(Arr, Arr + ArrSize, Arr);

  // mergeSortTasks(Arr, Arr + ArrSize, Arr);

  std::cout << "=== Output ===" << std::endl;
  std::for_each(Arr, Arr + ArrSize, [](int E) { std::cout << E << " "; });
  std::cout << std::endl;
  std::cout << "==============" << std::endl;

  std::cout << "=== Core/Task Distribution ===" << std::endl;
  std::cout << "Core           ";
  for (int i = 0; i < 8; i++) {
    std::cout << std::setw(3) << i << " ";
  }
  std::cout << std::endl;
  std::cout << "Assigned Tasks ";
  std::for_each(CoreTaskCounters, CoreTaskCounters + 8,
                [](int C) { std::cout << std::setw(3) << C << " "; });
  std::cout << std::endl;

  return 0;
}
