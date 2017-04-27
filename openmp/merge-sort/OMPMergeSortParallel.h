#include "OMPMergeSortSerial.h"
#include <algorithm>
#include <iostream>
#include <iterator>
#include <omp.h>
#include <utility>

namespace pss {

namespace internal {

// Merge sequences [xs,xe) and [ys,ye) to output sequence
// [zs,zs+(xe-xs)+(ye-ys)) Destroy input sequence iff destroy==true
void parallel_merge(int *xs, int *xe, int *ys, int *ye, int *zs, bool destroy);

// Sorts [xs,xe), where zs[0:xe-xs) is temporary buffer supplied by caller.
// Result is in [xs,xe) if inplace==true, otherwise in [zs,zs+(xe-xs))
void parallel_stable_sort_aux(int *xs, int *xe, int *zs, int inplace);

} // namespace internal
} // namespace pss
