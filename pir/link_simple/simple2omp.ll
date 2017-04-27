; ModuleID = '<stdin>'
source_filename = "simple.ll"

%ident_t = type { i32, i32, i32, i32, i8* }
%anon = type { i8 }
%kmp_task_t_with_privates = type { %kmp_task_t }
%kmp_task_t = type { i8*, i32 (i32, i8*)*, i32, %kmp_cmplrdata_t, %kmp_cmplrdata_t }
%kmp_cmplrdata_t = type { i32 (i32, i8*)* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8

declare void @foo()

define void @simpleParallelRegion() {
entry:
  call void (%ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%ident_t* @0, i32 0, void (i32*, i32*, ...)* @simpleParallelRegion.entry)
  br label %join

join:                                             ; preds = %entry
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define internal void @simpleParallelRegion.entry(i32* noalias %.global_tid., i32* noalias %.bound_tid., ...) #0 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  %0 = load i32*, i32** %.global_tid..addr, align 8
  %1 = load i32, i32* %0, align 4
  %2 = call i32 @__kmpc_master(%ident_t* @0, i32 %1)
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %omp_if.then, label %omp_if.end

omp_if.then:                                      ; preds = %entry
  call void @__kmpc_end_master(%ident_t* @0, i32 %1)
  br label %omp_if.end

omp_if.end:                                       ; preds = %omp_if.then, %entry
  ret void
}

declare void @__kmpc_fork_call(%ident_t*, i32, void (i32*, i32*, ...)*, ...)

define void @simpleParallelRegion.entry.forked() {
forked:
  call void @foo()
  br label %exit

exit:                                             ; preds = %forked
  ret void
}

define void @simpleParallelRegion.entry.cont() {
cont:
  call void @foo()
  br label %exit

exit:                                             ; preds = %cont
  ret void
}

declare i32 @__kmpc_master(%ident_t*, i32)

declare void @__kmpc_end_master(%ident_t*, i32)

; Function Attrs: alwaysinline nounwind uwtable
define internal void @.omp_outlined.(i32 %.global_tid., i32* %.part_id., i8* %.privates., void (i8*, ...)* %.copy_fn., i8* %.task_t., %anon* %__context) #1 {
entry:
  %.global_tid..addr = alloca i32, align 4
  %.part_id..addr = alloca i32*, align 8
  %.privates..addr = alloca i8*, align 8
  %.copy_fn..addr = alloca void (i8*, ...)*, align 8
  %.task_t..addr = alloca i8*, align 8
  %__context.addr = alloca %anon*, align 8
  store i32 %.global_tid., i32* %.global_tid..addr, align 4
  store i32* %.part_id., i32** %.part_id..addr, align 8
  store i8* %.privates., i8** %.privates..addr, align 8
  store void (i8*, ...)* %.copy_fn., void (i8*, ...)** %.copy_fn..addr, align 8
  store i8* %.task_t., i8** %.task_t..addr, align 8
  store %anon* %__context, %anon** %__context.addr, align 8
  %0 = load %anon*, %anon** %__context.addr, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal i32 @.omp_task_entry.(i32, %kmp_task_t_with_privates*) #2 {
entry:
  %retval = alloca i32, align 4
  %addr = alloca i32, align 4
  %addr1 = alloca %kmp_task_t_with_privates*, align 8
  store i32 %0, i32* %addr, align 4
  store %kmp_task_t_with_privates* %1, %kmp_task_t_with_privates** %addr1, align 8
  %2 = load i32, i32* %addr, align 4
  %3 = load %kmp_task_t_with_privates*, %kmp_task_t_with_privates** %addr1, align 8
  %4 = getelementptr inbounds %kmp_task_t_with_privates, %kmp_task_t_with_privates* %3, i32 0, i32 0
  %5 = getelementptr inbounds %kmp_task_t, %kmp_task_t* %4, i32 0, i32 2
  %6 = getelementptr inbounds %kmp_task_t, %kmp_task_t* %4, i32 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast i8* %7 to %anon*
  %9 = bitcast %kmp_task_t_with_privates* %3 to i8*
  call void @.omp_outlined.(i32 %2, i32* %5, i8* null, void (i8*, ...)* null, i8* %9, %anon* %8)
  ret i32 0
}

attributes #0 = { noreturn nounwind uwtable }
attributes #1 = { alwaysinline nounwind uwtable }
attributes #2 = { noinline uwtable }
