#include "OMPMergeSortParallel.h"
#include <algorithm>
#include <iostream>
#include <iterator>
#include <omp.h>
#include <utility>

namespace pss {

namespace internal {
void parallel_merge(int *xs, int *xe, int *ys, int *ye, int *zs, bool destroy) {
  const size_t MERGE_CUT_OFF = 2000;
  if ((xe - xs) + (ye - ys) > MERGE_CUT_OFF) {
    int *xm;
    int *ym;
    if (xe - xs < ye - ys) {
      ym = ys + (ye - ys) / 2;
      xm = std::upper_bound(xs, xe, *ym);
    } else {
      xm = xs + (xe - xs) / 2;
      ym = std::lower_bound(ys, ye, *xm);
    }

    if (omp_get_num_threads() == 1) {
#pragma omp parallel
      {
#pragma omp master
        {
#pragma omp task
          { parallel_merge(xs, xm, ys, ym, zs, destroy); }
          parallel_merge(xm, xe, ym, ye, zs + (xm - xs) + (ym - ys), destroy);
#pragma omp taskwait
        }
      }
    } else {
#pragma omp task
      { parallel_merge(xs, xm, ys, ym, zs, destroy); }
      parallel_merge(xm, xe, ym, ye, zs + (xm - xs) + (ym - ys), destroy);
#pragma omp taskwait
    }
  } else {
    serial_merge(xs, xe, ys, ye, zs);
  }
}

// Sorts [xs,xe), where zs[0:xe-xs) is temporary buffer supplied by caller.
// Result is in [xs,xe) if inplace==true, otherwise in [zs,zs+(xe-xs))
void parallel_stable_sort_aux(int *xs, int *xe, int *zs, int inplace) {
  const size_t SORT_CUT_OFF = 500;
  if (xe - xs <= SORT_CUT_OFF) {
    stable_sort_base_case(xs, xe, zs, inplace);
  } else {
    int *xm = xs + (xe - xs) / 2;
    int *zm = zs + (xm - xs);
    int *ze = zs + (xe - xs);
    if (omp_get_num_threads() == 1) {
// NOTE let's call this normalized parallel region
#pragma omp parallel
      {
#pragma omp master
        {
#pragma omp task
          { parallel_stable_sort_aux(xs, xm, zs, !inplace); }
          parallel_stable_sort_aux(xm, xe, zm, !inplace);
#pragma omp taskwait
        }
      }
    } else {
#pragma omp task
      { parallel_stable_sort_aux(xs, xm, zs, !inplace); }
      parallel_stable_sort_aux(xm, xe, zm, !inplace);
#pragma omp taskwait
    }

    if (inplace)
      parallel_merge(zs, zm, zm, ze, xs, inplace == 2);
    else
      parallel_merge(xs, xm, xm, xe, zs, false);
  }
}

} // namespace internal
} // namespace pss
