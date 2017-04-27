; ModuleID = '<stdin>'
source_filename = "../llvm/test/PIR/pir2omp_simple.ll"

%ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8

declare void @foo()

define void @simple() {
entry:
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* @0, i32 0, void (i32*, i32*, ...)* @simple.entry)
  br label %join

join:                                             ; preds = %entry
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define internal void @simple.entry(i32* noalias %.global_tid., i32* noalias %.bound_tid., ...) #0 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %.omp.sections.lb. = alloca i32, align 4
  %.omp.sections.ub. = alloca i32, align 4
  %.omp.sections.st. = alloca i32, align 4
  %.omp.sections.il. = alloca i32, align 4
  %.omp.sections.iv. = alloca i32, align 4
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  store i32 0, i32* %.omp.sections.lb., align 4
  store i32 1, i32* %.omp.sections.ub., align 4
  store i32 1, i32* %.omp.sections.st., align 4
  store i32 0, i32* %.omp.sections.il., align 4
  %0 = load i32*, i32** %.global_tid..addr, align 8
  %1 = load i32, i32* %0, align 4
  call void @__kmpc_for_static_init_4(%ident_t* @0, i32 %1, i32 34, i32* %.omp.sections.il., i32* %.omp.sections.lb., i32* %.omp.sections.ub., i32* %.omp.sections.st., i32 1, i32 1)
  %2 = load i32, i32* %.omp.sections.ub., align 4
  %3 = icmp slt i32 %2, 1
  %4 = select i1 %3, i32 %2, i32 1
  store i32 %4, i32* %.omp.sections.ub., align 4
  %5 = load i32, i32* %.omp.sections.lb., align 4
  store i32 %5, i32* %.omp.sections.iv., align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %entry
  %6 = load i32, i32* %.omp.sections.iv., align 4
  %7 = load i32, i32* %.omp.sections.ub., align 4
  %cmp = icmp sle i32 %6, %7
  br i1 %cmp, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %8 = load i32, i32* %.omp.sections.iv., align 4
  switch i32 %8, label %.omp.sections.exit [
    i32 0, label %.omp.sections.case
    i32 1, label %.omp.sections.case1
  ]

.omp.sections.case:                               ; preds = %omp.inner.for.body
  call void @simple.entry.forked()
  br label %.omp.sections.exit

.omp.sections.case1:                              ; preds = %omp.inner.for.body
  call void @simple.entry.cont()
  br label %.omp.sections.exit

.omp.sections.exit:                               ; preds = %.omp.sections.case1, %.omp.sections.case, %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %.omp.sections.exit
  %9 = load i32, i32* %.omp.sections.iv., align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %.omp.sections.iv., align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  call void @__kmpc_for_static_fini(%ident_t* @0, i32 %1)
  ret void
}

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

define void @simple.entry.forked() {
forked:
  call void @foo()
  br label %exit

exit:                                             ; preds = %forked
  ret void
}

define void @simple.entry.cont() {
cont:
  call void @foo()
  br label %exit

exit:                                             ; preds = %cont
  ret void
}

declare void @__kmpc_for_static_init_4(%ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare void @__kmpc_for_static_fini(%ident_t*, i32)

attributes #0 = { noreturn nounwind uwtable }
