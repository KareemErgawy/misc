; ModuleID = 'simple.cpp'
source_filename = "simple.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%ident_t = type { i32, i32, i32, i32, i8* }
%struct.anon = type { i32**, i32* }
%struct.kmp_task_t_with_privates = type { %struct.kmp_task_t }
%struct.kmp_task_t = type { i8*, i32 (i32, i8*)*, i32, %union.kmp_cmplrdata_t, %union.kmp_cmplrdata_t }
%union.kmp_cmplrdata_t = type { i32 (i32, i8*)* }

$__clang_call_terminate = comdat any

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8

; Function Attrs: noinline nounwind uwtable
define void @_Z5task0Pii(i32* %x, i32 %y) #0 {
entry:
  %x.addr = alloca i32*, align 8
  %y.addr = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @_Z5task1i(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  ret void
}

; Function Attrs: noinline norecurse uwtable
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  %call = call i32 @_Z8read_intv()
  store i32 %call, i32* %x, align 4
  %call1 = call i32 @_Z8read_intv()
  store i32 %call1, i32* %y, align 4
  store i32* %x, i32** %z, align 8
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* @0, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32**, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32** %z, i32* %y, i32* %x)
  ret i32 0
}

declare i32 @_Z8read_intv() #2

; Function Attrs: noinline nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32** dereferenceable(8) %z, i32* dereferenceable(4) %y, i32* dereferenceable(4) %x) #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %z.addr = alloca i32**, align 8
  %y.addr = alloca i32*, align 8
  %x.addr = alloca i32*, align 8
  %agg.captured = alloca %struct.anon, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  store i32** %z, i32*** %z.addr, align 8
  store i32* %y, i32** %y.addr, align 8
  store i32* %x, i32** %x.addr, align 8
  %0 = load i32**, i32*** %z.addr, align 8
  %1 = load i32*, i32** %y.addr, align 8
  %2 = load i32*, i32** %x.addr, align 8
  %3 = load i32*, i32** %.global_tid..addr, align 8
  %4 = load i32, i32* %3, align 4
  %5 = call i32 @__kmpc_master(%ident_t* @0, i32 %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %omp_if.then, label %omp_if.end

omp_if.then:                                      ; preds = %entry
  %7 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 0
  store i32** %0, i32*** %7, align 8
  %8 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 1
  store i32* %1, i32** %8, align 8
  %9 = call i8* @__kmpc_omp_task_alloc(%ident_t* @0, i32 %4, i32 1, i64 40, i64 16, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates*)* @.omp_task_entry. to i32 (i32, i8*)*))
  %10 = bitcast i8* %9 to %struct.kmp_task_t_with_privates*
  %11 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %10, i32 0, i32 0
  %12 = call i32 @__kmpc_omp_task(%ident_t* @0, i32 %4, i8* %9)
  %13 = load i32, i32* %2, align 4
  invoke void @_Z5task1i(i32 %13)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %omp_if.then
  %14 = call i32 @__kmpc_omp_taskwait(%ident_t* @0, i32 %4)
  call void @__kmpc_end_master(%ident_t* @0, i32 %4)
  br label %omp_if.end

lpad:                                             ; preds = %omp_if.then
  %15 = landingpad { i8*, i32 }
          catch i8* null
  %16 = extractvalue { i8*, i32 } %15, 0
  store i8* %16, i8** %exn.slot, align 8
  %17 = extractvalue { i8*, i32 } %15, 1
  store i32 %17, i32* %ehselector.slot, align 4
  call void @__kmpc_end_master(%ident_t* @0, i32 %4)
  br label %terminate.handler

omp_if.end:                                       ; preds = %invoke.cont, %entry
  ret void

terminate.handler:                                ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  call void @__clang_call_terminate(i8* %exn) #5
  unreachable
}

declare void @__kmpc_end_master(%ident_t*, i32)

declare i32 @__kmpc_master(%ident_t*, i32)

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #3 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #6
  call void @_ZSt9terminatev() #5
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: noinline uwtable
define internal i32 @.omp_task_entry.(i32, %struct.kmp_task_t_with_privates* noalias) #4 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %.global_tid..addr.i = alloca i32, align 4
  %.part_id..addr.i = alloca i32*, align 8
  %.privates..addr.i = alloca i8*, align 8
  %.copy_fn..addr.i = alloca void (i8*, ...)*, align 8
  %.task_t..addr.i = alloca i8*, align 8
  %__context.addr.i = alloca %struct.anon*, align 8
  %exn.slot.i = alloca i8*
  %ehselector.slot.i = alloca i32
  %.addr = alloca i32, align 4
  %.addr1 = alloca %struct.kmp_task_t_with_privates*, align 8
  store i32 %0, i32* %.addr, align 4
  store %struct.kmp_task_t_with_privates* %1, %struct.kmp_task_t_with_privates** %.addr1, align 8
  %2 = load i32, i32* %.addr, align 4
  %3 = load %struct.kmp_task_t_with_privates*, %struct.kmp_task_t_with_privates** %.addr1, align 8
  %4 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %3, i32 0, i32 0
  %5 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %4, i32 0, i32 2
  %6 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %4, i32 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast i8* %7 to %struct.anon*
  %9 = bitcast %struct.kmp_task_t_with_privates* %3 to i8*
  store i32 %2, i32* %.global_tid..addr.i, align 4
  store i32* %5, i32** %.part_id..addr.i, align 8
  store i8* null, i8** %.privates..addr.i, align 8
  store void (i8*, ...)* null, void (i8*, ...)** %.copy_fn..addr.i, align 8
  store i8* %9, i8** %.task_t..addr.i, align 8
  store %struct.anon* %8, %struct.anon** %__context.addr.i, align 8
  %10 = load %struct.anon*, %struct.anon** %__context.addr.i, align 8
  %11 = getelementptr inbounds %struct.anon, %struct.anon* %10, i32 0, i32 0
  %ref.i = load i32**, i32*** %11, align 8
  %12 = load i32*, i32** %ref.i, align 8
  %13 = getelementptr inbounds %struct.anon, %struct.anon* %10, i32 0, i32 1
  %ref1.i = load i32*, i32** %13, align 8
  %14 = load i32, i32* %ref1.i, align 4
  invoke void @_Z5task0Pii(i32* %12, i32 %14)
          to label %.omp_outlined..1.exit unwind label %lpad.i

lpad.i:                                           ; preds = %entry
  %15 = landingpad { i8*, i32 }
          catch i8* null
  %16 = extractvalue { i8*, i32 } %15, 0
  store i8* %16, i8** %exn.slot.i, align 8
  %17 = extractvalue { i8*, i32 } %15, 1
  store i32 %17, i32* %ehselector.slot.i, align 4
  %exn.i = load i8*, i8** %exn.slot.i, align 8
  call void @__clang_call_terminate(i8* %exn.i) #5
  unreachable

.omp_outlined..1.exit:                            ; preds = %entry
  ret i32 0
}

declare i8* @__kmpc_omp_task_alloc(%ident_t*, i32, i32, i64, i64, i32 (i32, i8*)*)

declare i32 @__kmpc_omp_task(%ident_t*, i32, i8*)

declare i32 @__kmpc_omp_taskwait(%ident_t*, i32)

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline noreturn nounwind }
attributes #4 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (git@github.com:llvm-mirror/clang.git 51cbbdf858b4dcf5a17db3990ab6c1493d32be21) (git@github.com:llvm-mirror/llvm.git 20c757b9a3e8e710ab7a4e8167a7c13fe572cf6f)"}
