; ModuleID = '../../crap/code/openmp/section/simple.cpp'
source_filename = "../../crap/code/openmp/section/simple.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }

$__clang_call_terminate = comdat any

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8

; Function Attrs: noinline nounwind uwtable
define void @_Z8section0v() #0 {
entry:
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @_Z8section1v() #0 {
entry:
  ret void
}

; Function Attrs: noinline norecurse uwtable
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* @0, i32 0, void (i32*, i32*, ...)* bitcast (void (i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*))
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid.) #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
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
  invoke void @_Z8section0v()
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %.omp.sections.case
  br label %.omp.sections.exit

.omp.sections.case1:                              ; preds = %omp.inner.for.body
  invoke void @_Z8section1v()
          to label %invoke.cont2 unwind label %terminate.lpad

invoke.cont2:                                     ; preds = %.omp.sections.case1
  br label %.omp.sections.exit

.omp.sections.exit:                               ; preds = %invoke.cont2, %invoke.cont, %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %.omp.sections.exit
  %9 = load i32, i32* %.omp.sections.iv., align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %.omp.sections.iv., align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  call void @__kmpc_for_static_fini(%ident_t* @0, i32 %1)
  ret void

terminate.lpad:                                   ; preds = %.omp.sections.case1, %.omp.sections.case
  %10 = landingpad { i8*, i32 }
          catch i8* null
  %11 = extractvalue { i8*, i32 } %10, 0
  call void @__clang_call_terminate(i8* %11) #3
  unreachable
}

declare void @__kmpc_for_static_init_4(%ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #2 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #4
  call void @_ZSt9terminatev() #3
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

declare void @__kmpc_for_static_fini(%ident_t*, i32)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline noreturn nounwind }
attributes #3 = { noreturn nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (git@github.com:llvm-mirror/clang.git a9d35f1f36d9d4205e18e2ed841d68137b9c8897) (git@github.com:llvm-mirror/llvm.git 8985450e52e924056c248786af72c1ea21a62f3a)"}
