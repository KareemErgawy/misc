#include <algorithm>
#include <iostream>
#include <iterator>
#include <omp.h>
#include <utility>
#include "OMPMergeSortParallel.h"

namespace pss {

namespace internal {

void stable_sort_base_case(int *xs, int *xe, int *zs, int inplace) {
  std::stable_sort(xs, xe);
  if (inplace != 2) {
    int *ze = zs + (xe - xs);
    if (!inplace)
      // Initialize the temporary buffer and move keys to it.
      for (; zs < ze; ++xs, ++zs)
        *zs = *xs;
  }
}
//! Merge sequences [xs,xe) and [ys,ye) to output sequence [zs,(xe-xs)+(ye-ys)),
void serial_merge(int *xs, int *xe, int *ys, int *ye, int *zs) {
  if (xs != xe) {
    if (ys != ye) {
      for (;;) {
        if (*ys < *xs) {
          *zs = *ys;
          ++zs;
          if (++ys == ye) {
            break;
          }
        } else {
          *zs = *xs;
          ++zs;
          if (++xs == xe) {
            goto movey;
          }
        }
      }
    }
    ys = xs;
    ye = xe;
  }
movey:
  std::copy(ys, ye, zs);
}

//! Raw memory buffer with automatic cleanup.
class raw_buffer {
  void *ptr;

public:
  //! Try to obtain buffer of given size.
  raw_buffer(size_t bytes) : ptr(operator new(bytes, std::nothrow)) {}
  //! True if buffer was successfully obtained, zero otherwise.
  operator bool() const { return ptr; }
  //! Return pointer to buffer, or  NULL if buffer could not be obtained.
  void *get() const { return ptr; }
  //! Destroy buffer
  ~raw_buffer() { operator delete(ptr); }
};
} // namespace internal

void parallel_stable_sort(int *xs, int *xe) {
  internal::raw_buffer z = internal::raw_buffer(sizeof(int) * (xe - xs));
  internal::parallel_stable_sort_aux(xs, xe, (int *)z.get(), 2);
}

} // namespace pss
