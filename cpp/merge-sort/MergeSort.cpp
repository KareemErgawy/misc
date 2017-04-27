#include <algorithm>
#include <iostream>

void mergeSort(int *First, int *Last) {
  if (First == Last || First+1 == Last) {
    return;
  }

  auto Mid = First + (Last - First) / 2;
  mergeSort(First, Mid);
  mergeSort(Mid, Last);
  std::inplace_merge(First, Mid, Last);
}

int main() {
  int Arr[] = {6, 5, 3, 1};
  size_t ArrSize = sizeof(Arr)/sizeof(int);
  mergeSort(Arr, Arr + ArrSize);
  for (size_t i=0 ; i<ArrSize ; ++i) {
    std::cout << Arr[i] << " ";
  }
  std::cout << std::endl;
  
  return 0;
}
