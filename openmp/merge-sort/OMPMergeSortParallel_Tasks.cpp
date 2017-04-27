/*
  Copyright (C) 2014 Intel Corporation
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:

  * Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in
    the documentation and/or other materials provided with the
    distribution.
  * Neither the name of Intel Corporation nor the names of its
    contributors may be used to endorse or promote products derived
    from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
  OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
  AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
  WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE.
*/
#include "OMPMergeSortParallel.h"
#include <algorithm>
#include <iostream>
#include <iterator>
#include <omp.h>
#include <utility>

namespace pss {

namespace internal {

// Merge sequences [xs,xe) and [ys,ye) to output sequence
// [zs,zs+(xe-xs)+(ye-ys)) Destroy input sequence iff destroy==true
// void parallel_merge(int *xs, int *xe, int *ys, int *ye, int *zs, bool
// destroy) {
//   const size_t MERGE_CUT_OFF = 2000;
//   while ((xe - xs) + (ye - ys) > MERGE_CUT_OFF) {
//     int *xm;
//     int *ym;
//     if (xe - xs < ye - ys) {
//       ym = ys + (ye - ys) / 2;
//       xm = std::upper_bound(xs, xe, *ym);
//     } else {
//       xm = xs + (xe - xs) / 2;
//       ym = std::lower_bound(ys, ye, *xm);
//     }

//     if (omp_get_num_threads() == 1) {
// #pragma omp parallel
//       {
// #pragma omp master
//         {
// #pragma omp task
//           { parallel_merge(xs, xm, ys, ym, zs, destroy); }
//         }
//       }
//     } else {
// #pragma omp task
//       { parallel_merge(xs, xm, ys, ym, zs, destroy); }
//     }
//     zs += (xm - xs) + (ym - ys);
//     xs = xm;
//     ys = ym;
//   }
//   serial_merge(xs, xe, ys, ye, zs);
// #pragma omp taskwait
// }
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
