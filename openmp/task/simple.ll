; ModuleID = 'simple.cpp'
source_filename = "simple.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::basic_istream" = type { i32 (...)**, i64, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%ident_t = type { i32, i32, i32, i32, i8* }
%"class.std::ios_base::Init" = type { i8 }
%struct.anon = type { float*, i32* }
%struct.kmp_task_t_with_privates = type { %struct.kmp_task_t, %struct..kmp_privates.t }
%struct.kmp_task_t = type { i8*, i32 (i32, i8*)*, i32, %union.kmp_cmplrdata_t, %union.kmp_cmplrdata_t }
%union.kmp_cmplrdata_t = type { i32 (i32, i8*)* }
%struct..kmp_privates.t = type { float, i32 }

$__clang_call_terminate = comdat any

@_ZSt3cin = external global %"class.std::basic_istream", align 8
@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_simple.cpp, i8* null }]

; Function Attrs: noinline nounwind uwtable
define void @_Z5task0fi(float %x, i32 %y) #0 {
entry:
  %x.addr = alloca float, align 4
  %y.addr = alloca i32, align 4
  store float %x, float* %x.addr, align 4
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

; Function Attrs: noinline uwtable
define i32 @_Z8read_intv() #1 {
entry:
  %x = alloca i32, align 4
  %call = call dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* @_ZSt3cin, i32* dereferenceable(4) %x)
  %0 = load i32, i32* %x, align 4
  ret i32 %0
}

declare dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"*, i32* dereferenceable(4)) #2

; Function Attrs: noinline norecurse uwtable
define i32 @main() #3 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca float, align 4
  %z = alloca i32*, align 8
  %agg.captured = alloca %struct.anon, align 8
  %0 = call i32 @__kmpc_global_thread_num(%ident_t* @0)
  store i32 0, i32* %retval, align 4
  %call = call i32 @_Z8read_intv()
  store i32 %call, i32* %x, align 4
  %call1 = call i32 @_Z8read_intv()
  %conv = sitofp i32 %call1 to float
  store float %conv, float* %y, align 4
  %1 = load float, float* %y, align 4
  %2 = load i32, i32* %x, align 4
  call void @_Z5task0fi(float %1, i32 %2)
  store i32* %x, i32** %z, align 8
  %call2 = call i32 @omp_get_num_threads()
  %cmp = icmp eq i32 %call2, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 0
  store float* %y, float** %3, align 8
  %4 = getelementptr inbounds %struct.anon, %struct.anon* %agg.captured, i32 0, i32 1
  store i32* %x, i32** %4, align 8
  %5 = call i8* @__kmpc_omp_task_alloc(%ident_t* @0, i32 %0, i32 1, i64 48, i64 16, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates*)* @.omp_task_entry. to i32 (i32, i8*)*))
  %6 = bitcast i8* %5 to %struct.kmp_task_t_with_privates*
  %7 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %6, i32 0, i32 0
  %8 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %7, i32 0, i32 0
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast %struct.anon* %agg.captured to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 16, i32 8, i1 false)
  %11 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %6, i32 0, i32 1
  %12 = bitcast i8* %9 to %struct.anon*
  %13 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %11, i32 0, i32 0
  %14 = getelementptr inbounds %struct.anon, %struct.anon* %12, i32 0, i32 0
  %ref = load float*, float** %14, align 8
  %15 = load float, float* %ref, align 4
  store float %15, float* %13, align 8
  %16 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %11, i32 0, i32 1
  %17 = getelementptr inbounds %struct.anon, %struct.anon* %12, i32 0, i32 1
  %ref3 = load i32*, i32** %17, align 8
  %18 = load i32, i32* %ref3, align 4
  store i32 %18, i32* %16, align 4
  %19 = call i32 @__kmpc_omp_task(%ident_t* @0, i32 %0, i8* %5)
  %20 = load i32*, i32** %z, align 8
  %21 = load i32, i32* %20, align 4
  call void @_Z5task1i(i32 %21)
  %22 = call i32 @__kmpc_omp_taskwait(%ident_t* @0, i32 %0)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

declare i32 @omp_get_num_threads() #2

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #4 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #7
  call void @_ZSt9terminatev() #8
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: alwaysinline uwtable
define internal void @.omp_task_privates_map.(%struct..kmp_privates.t* noalias, float** noalias, i32** noalias) #5 {
entry:
  %.addr = alloca %struct..kmp_privates.t*, align 8
  %.addr1 = alloca float**, align 8
  %.addr2 = alloca i32**, align 8
  store %struct..kmp_privates.t* %0, %struct..kmp_privates.t** %.addr, align 8
  store float** %1, float*** %.addr1, align 8
  store i32** %2, i32*** %.addr2, align 8
  %3 = load %struct..kmp_privates.t*, %struct..kmp_privates.t** %.addr, align 8
  %4 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %3, i32 0, i32 0
  %5 = load float**, float*** %.addr1, align 8
  store float* %4, float** %5, align 8
  %6 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %3, i32 0, i32 1
  %7 = load i32**, i32*** %.addr2, align 8
  store i32* %6, i32** %7, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal i32 @.omp_task_entry.(i32, %struct.kmp_task_t_with_privates* noalias) #1 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %.global_tid..addr.i = alloca i32, align 4
  %.part_id..addr.i = alloca i32*, align 8
  %.privates..addr.i = alloca i8*, align 8
  %.copy_fn..addr.i = alloca void (i8*, ...)*, align 8
  %.task_t..addr.i = alloca i8*, align 8
  %__context.addr.i = alloca %struct.anon*, align 8
  %.firstpriv.ptr.addr.i = alloca float*, align 8
  %.firstpriv.ptr.addr1.i = alloca i32*, align 8
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
  %9 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %3, i32 0, i32 1
  %10 = bitcast %struct..kmp_privates.t* %9 to i8*
  %11 = bitcast %struct.kmp_task_t_with_privates* %3 to i8*
  store i32 %2, i32* %.global_tid..addr.i, align 4
  store i32* %5, i32** %.part_id..addr.i, align 8
  store i8* %10, i8** %.privates..addr.i, align 8
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t*, float**, i32**)* @.omp_task_privates_map. to void (i8*, ...)*), void (i8*, ...)** %.copy_fn..addr.i, align 8
  store i8* %11, i8** %.task_t..addr.i, align 8
  store %struct.anon* %8, %struct.anon** %__context.addr.i, align 8
  %12 = load %struct.anon*, %struct.anon** %__context.addr.i, align 8
  %13 = load void (i8*, ...)*, void (i8*, ...)** %.copy_fn..addr.i, align 8
  %14 = load i8*, i8** %.privates..addr.i, align 8
  call void (i8*, ...) %13(i8* %14, float** %.firstpriv.ptr.addr.i, i32** %.firstpriv.ptr.addr1.i) #7
  %15 = load float*, float** %.firstpriv.ptr.addr.i, align 8
  %16 = load i32*, i32** %.firstpriv.ptr.addr1.i, align 8
  %17 = load float, float* %15, align 4
  %18 = load i32, i32* %16, align 4
  invoke void @_Z5task0fi(float %17, i32 %18)
          to label %.omp_outlined..exit unwind label %lpad.i

lpad.i:                                           ; preds = %entry
  %19 = landingpad { i8*, i32 }
          catch i8* null
  %20 = extractvalue { i8*, i32 } %19, 0
  store i8* %20, i8** %exn.slot.i, align 8
  %21 = extractvalue { i8*, i32 } %19, 1
  store i32 %21, i32* %ehselector.slot.i, align 4
  %exn.i = load i8*, i8** %exn.slot.i, align 8
  call void @__clang_call_terminate(i8* %exn.i) #8
  unreachable

.omp_outlined..exit:                              ; preds = %entry
  ret i32 0
}

declare i32 @__kmpc_global_thread_num(%ident_t*)

declare i8* @__kmpc_omp_task_alloc(%ident_t*, i32, i32, i64, i64, i32 (i32, i8*)*)

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #6

declare i32 @__kmpc_omp_task(%ident_t*, i32, i8*)

declare i32 @__kmpc_omp_taskwait(%ident_t*, i32)

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #1 section ".text.startup" {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #7
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #7

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_simple.cpp() #1 section ".text.startup" {
entry:
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline noreturn nounwind }
attributes #5 = { alwaysinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (git@github.com:Parallel-IR/clang-pir.git d2e749e4297552f06eb611b478e6469b4ef482e5) (git@github.com:Parallel-IR/llvm-pir.git 9f49b844b0dccbcacb8aa455da9a7f07e74fb057)"}
