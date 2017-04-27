- To build the tasks based version:
```
clang++ -O3 -std=c++11 -fopenmp OMPMergeSortParallel_Tasks.cpp OMPMergeSortSerial.cpp  test.cpp -I${CLANG_BIN_DIR}/../projects/openmp/runtime/src/ -o tasks.out
```

- To build the sections based version:
```
clang++ -O3 -std=c++11 -fopenmp OMPMergeSortParallel_Sections.cpp OMPMergeSortSerial.cpp  test.cpp -I${CLANG_BIN_DIR}/../projects/openmp/runtime/src/ -o sections.out
```
