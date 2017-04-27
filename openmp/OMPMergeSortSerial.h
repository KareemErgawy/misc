namespace pss {
void parallel_stable_sort(int *xs, int *xe);

namespace internal {
void stable_sort_base_case(int *xs, int *xe, int *zs, int inplace);

//! Merge sequences [xs,xe) and [ys,ye) to output sequence [zs,(xe-xs)+(ye-ys)),
void serial_merge(int *xs, int *xe, int *ys, int *ye, int *zs);
} // namespace internal
} // namespace pss
