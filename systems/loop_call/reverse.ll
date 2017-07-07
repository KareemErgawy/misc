; ModuleID = 'reverse.cpp'
source_filename = "reverse.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }

@.str = private unnamed_addr constant [42 x i8] c"basic_string::_M_construct null not valid\00", align 1

; Function Attrs: uwtable
define void @_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.std::__cxx11::basic_string"* noalias sret %agg.result, %"class.std::__cxx11::basic_string"* nocapture readonly %s) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
entry:
  %__dnew.i.i.i.i = alloca i64, align 8
  %_M_string_length.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %s, i64 0, i32 1
  %0 = load i64, i64* %_M_string_length.i, align 8, !tbaa !1
  %cmp40 = icmp eq i64 %0, 0
  %.pre42 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %s, i64 0, i32 0, i32 0
  br i1 %cmp40, label %if.end.i.i.i.i.thread, label %for.cond.preheader.preheader

for.cond.preheader.preheader:                     ; preds = %entry
  br label %for.cond.preheader

if.end.i.i.i.i.thread:                            ; preds = %entry
  %1 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %2 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %1, %union.anon** %2, align 8, !tbaa !8
  %3 = load i8*, i8** %.pre42, align 8, !tbaa !9
  %4 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %4) #5
  store i64 0, i64* %__dnew.i.i.i.i, align 8, !tbaa !10
  br label %if.end.if.end6_crit_edge.i.i.i.i

for.cond.preheader:                               ; preds = %for.cond.preheader.preheader, %while.cond.backedge
  %idx.041 = phi i64 [ %idx.2.lcssa, %while.cond.backedge ], [ 0, %for.cond.preheader.preheader ]
  %cmp133 = icmp ult i64 %idx.041, %0
  br i1 %cmp133, label %land.rhs.lr.ph, label %for.end

land.rhs.lr.ph:                                   ; preds = %for.cond.preheader
  %5 = load i8*, i8** %.pre42, align 8, !tbaa !9
  br label %land.rhs

land.rhs:                                         ; preds = %land.rhs.lr.ph, %for.inc
  %idx.134 = phi i64 [ %idx.041, %land.rhs.lr.ph ], [ %inc, %for.inc ]
  %arrayidx.i = getelementptr inbounds i8, i8* %5, i64 %idx.134
  %6 = load i8, i8* %arrayidx.i, align 1, !tbaa !11
  %cmp3 = icmp eq i8 %6, 32
  br i1 %cmp3, label %for.inc, label %for.end.loopexit

for.inc:                                          ; preds = %land.rhs
  %inc = add nuw i64 %idx.134, 1
  %cmp1 = icmp ult i64 %inc, %0
  br i1 %cmp1, label %land.rhs, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc, %land.rhs
  %idx.1.lcssa.ph = phi i64 [ %inc, %for.inc ], [ %idx.134, %land.rhs ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond.preheader
  %idx.1.lcssa = phi i64 [ %idx.041, %for.cond.preheader ], [ %idx.1.lcssa.ph, %for.end.loopexit ]
  %conv4 = trunc i64 %idx.1.lcssa to i32
  %cmp636 = icmp ult i64 %idx.1.lcssa, %0
  br i1 %cmp636, label %land.rhs7.lr.ph, label %for.end15

land.rhs7.lr.ph:                                  ; preds = %for.end
  %7 = load i8*, i8** %.pre42, align 8, !tbaa !9
  br label %land.rhs7

land.rhs7:                                        ; preds = %land.rhs7.lr.ph, %for.inc13
  %idx.237 = phi i64 [ %idx.1.lcssa, %land.rhs7.lr.ph ], [ %inc14, %for.inc13 ]
  %arrayidx.i31 = getelementptr inbounds i8, i8* %7, i64 %idx.237
  %8 = load i8, i8* %arrayidx.i31, align 1, !tbaa !11
  %cmp10 = icmp eq i8 %8, 32
  br i1 %cmp10, label %for.end15.loopexit, label %for.inc13

for.inc13:                                        ; preds = %land.rhs7
  %inc14 = add nuw i64 %idx.237, 1
  %cmp6 = icmp ult i64 %inc14, %0
  br i1 %cmp6, label %land.rhs7, label %for.end15.loopexit

for.end15.loopexit:                               ; preds = %land.rhs7, %for.inc13
  %idx.2.lcssa.ph = phi i64 [ %idx.237, %land.rhs7 ], [ %inc14, %for.inc13 ]
  br label %for.end15

for.end15:                                        ; preds = %for.end15.loopexit, %for.end
  %idx.2.lcssa = phi i64 [ %idx.1.lcssa, %for.end ], [ %idx.2.lcssa.ph, %for.end15.loopexit ]
  %sub = add i64 %idx.2.lcssa, 4294967295
  %conv16 = trunc i64 %sub to i32
  %cmp22.i = icmp slt i32 %conv4, %conv16
  br i1 %cmp22.i, label %while.body.lr.ph.i, label %while.cond.backedge

while.cond.backedge.loopexit:                     ; preds = %while.body.i
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %while.cond.backedge.loopexit, %for.end15
  %cmp = icmp ult i64 %idx.2.lcssa, %0
  br i1 %cmp, label %for.cond.preheader, label %while.end

while.body.lr.ph.i:                               ; preds = %for.end15
  %sext = shl i64 %idx.1.lcssa, 32
  %9 = ashr exact i64 %sext, 32
  %sext32 = shl i64 %sub, 32
  %10 = ashr exact i64 %sext32, 32
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %indvars.iv25.i = phi i64 [ %10, %while.body.lr.ph.i ], [ %indvars.iv.next26.i, %while.body.i ]
  %indvars.iv.i = phi i64 [ %9, %while.body.lr.ph.i ], [ %indvars.iv.next.i, %while.body.i ]
  %11 = load i8*, i8** %.pre42, align 8, !tbaa !9
  %arrayidx.i.i = getelementptr inbounds i8, i8* %11, i64 %indvars.iv.i
  %12 = load i8, i8* %arrayidx.i.i, align 1, !tbaa !11
  %arrayidx.i21.i = getelementptr inbounds i8, i8* %11, i64 %indvars.iv25.i
  %13 = load i8, i8* %arrayidx.i21.i, align 1, !tbaa !11
  store i8 %13, i8* %arrayidx.i.i, align 1, !tbaa !11
  %14 = load i8*, i8** %.pre42, align 8, !tbaa !9
  %arrayidx.i17.i = getelementptr inbounds i8, i8* %14, i64 %indvars.iv25.i
  store i8 %12, i8* %arrayidx.i17.i, align 1, !tbaa !11
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %indvars.iv.next26.i = add i64 %indvars.iv25.i, -1
  %cmp.i = icmp slt i64 %indvars.iv.next.i, %indvars.iv.next26.i
  br i1 %cmp.i, label %while.body.i, label %while.cond.backedge.loopexit

while.end:                                        ; preds = %while.cond.backedge
  %.pre = load i64, i64* %_M_string_length.i, align 8, !tbaa !1
  %15 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %16 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %15, %union.anon** %16, align 8, !tbaa !8
  %17 = load i8*, i8** %.pre42, align 8, !tbaa !9
  %call.not.i.i.i.i = icmp ne i8* %17, null
  %cmp.i.i.i.i = icmp eq i64 %.pre, 0
  %or.cond.i.i.i.i = or i1 %call.not.i.i.i.i, %cmp.i.i.i.i
  br i1 %or.cond.i.i.i.i, label %if.end.i.i.i.i, label %if.then.i.i.i.i

if.then.i.i.i.i:                                  ; preds = %while.end
  tail call void @_ZSt19__throw_logic_errorPKc(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i64 0, i64 0)) #6
  unreachable

if.end.i.i.i.i:                                   ; preds = %while.end
  %18 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %18) #5
  store i64 %.pre, i64* %__dnew.i.i.i.i, align 8, !tbaa !10
  %cmp3.i.i.i.i = icmp ugt i64 %.pre, 15
  br i1 %cmp3.i.i.i.i, label %if.then4.i.i.i.i, label %if.end.if.end6_crit_edge.i.i.i.i

if.end.if.end6_crit_edge.i.i.i.i:                 ; preds = %if.end.i.i.i.i.thread, %if.end.i.i.i.i
  %19 = phi i8* [ %4, %if.end.i.i.i.i.thread ], [ %18, %if.end.i.i.i.i ]
  %20 = phi i64 [ 0, %if.end.i.i.i.i.thread ], [ %.pre, %if.end.i.i.i.i ]
  %21 = phi i8* [ %3, %if.end.i.i.i.i.thread ], [ %17, %if.end.i.i.i.i ]
  %.in = phi %union.anon* [ %1, %if.end.i.i.i.i.thread ], [ %15, %if.end.i.i.i.i ]
  %22 = bitcast %union.anon* %.in to i8*
  %_M_p.i19.phi.trans.insert.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 0, i32 0
  br label %if.end6.i.i.i.i

if.then4.i.i.i.i:                                 ; preds = %if.end.i.i.i.i
  %call5.i.i.i14.i = call i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %agg.result, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i, i64 0)
  %_M_p.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 0, i32 0
  store i8* %call5.i.i.i14.i, i8** %_M_p.i.i.i.i.i, align 8, !tbaa !9
  %23 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !10
  %_M_allocated_capacity.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 0
  store i64 %23, i64* %_M_allocated_capacity.i.i.i.i.i, align 8, !tbaa !10
  br label %if.end6.i.i.i.i

if.end6.i.i.i.i:                                  ; preds = %if.then4.i.i.i.i, %if.end.if.end6_crit_edge.i.i.i.i
  %24 = phi i8* [ %19, %if.end.if.end6_crit_edge.i.i.i.i ], [ %18, %if.then4.i.i.i.i ]
  %25 = phi i64 [ %20, %if.end.if.end6_crit_edge.i.i.i.i ], [ %.pre, %if.then4.i.i.i.i ]
  %26 = phi i8* [ %21, %if.end.if.end6_crit_edge.i.i.i.i ], [ %17, %if.then4.i.i.i.i ]
  %_M_p.i19.pre-phi.i.i.i.i = phi i8** [ %_M_p.i19.phi.trans.insert.i.i.i.i, %if.end.if.end6_crit_edge.i.i.i.i ], [ %_M_p.i.i.i.i.i, %if.then4.i.i.i.i ]
  %27 = phi i8* [ %22, %if.end.if.end6_crit_edge.i.i.i.i ], [ %call5.i.i.i14.i, %if.then4.i.i.i.i ]
  switch i64 %25, label %if.end.i.i.i.i.i.i.i [
    i64 1, label %if.then.i.i.i.i.i.i
    i64 0, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit
  ]

if.then.i.i.i.i.i.i:                              ; preds = %if.end6.i.i.i.i
  %28 = load i8, i8* %26, align 1, !tbaa !11
  store i8 %28, i8* %27, align 1, !tbaa !11
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit

if.end.i.i.i.i.i.i.i:                             ; preds = %if.end6.i.i.i.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %26, i64 %25, i32 1, i1 false) #5
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit: ; preds = %if.end6.i.i.i.i, %if.then.i.i.i.i.i.i, %if.end.i.i.i.i.i.i.i
  %29 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !10
  %_M_string_length.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 %29, i64* %_M_string_length.i.i.i.i.i.i, align 8, !tbaa !1
  %30 = load i8*, i8** %_M_p.i19.pre-phi.i.i.i.i, align 8, !tbaa !9
  %arrayidx.i.i.i.i.i = getelementptr inbounds i8, i8* %30, i64 %29
  store i8 0, i8* %arrayidx.i.i.i.i.i, align 1, !tbaa !11
  call void @llvm.lifetime.end(i64 8, i8* nonnull %24) #5
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: norecurse uwtable
define void @_Z11reverseWordRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEii(%"class.std::__cxx11::basic_string"* nocapture readonly dereferenceable(32) %s, i32 %begin, i32 %end) local_unnamed_addr #2 {
entry:
  %cmp22 = icmp slt i32 %begin, %end
  br i1 %cmp22, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %_M_p.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %s, i64 0, i32 0, i32 0
  %0 = sext i32 %begin to i64
  %1 = sext i32 %end to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvars.iv25 = phi i64 [ %1, %while.body.lr.ph ], [ %indvars.iv.next26, %while.body ]
  %indvars.iv = phi i64 [ %0, %while.body.lr.ph ], [ %indvars.iv.next, %while.body ]
  %2 = load i8*, i8** %_M_p.i.i, align 8, !tbaa !9
  %arrayidx.i = getelementptr inbounds i8, i8* %2, i64 %indvars.iv
  %3 = load i8, i8* %arrayidx.i, align 1, !tbaa !11
  %arrayidx.i21 = getelementptr inbounds i8, i8* %2, i64 %indvars.iv25
  %4 = load i8, i8* %arrayidx.i21, align 1, !tbaa !11
  store i8 %4, i8* %arrayidx.i, align 1, !tbaa !11
  %5 = load i8*, i8** %_M_p.i.i, align 8, !tbaa !9
  %arrayidx.i17 = getelementptr inbounds i8, i8* %5, i64 %indvars.iv25
  store i8 %3, i8* %arrayidx.i17, align 1, !tbaa !11
  %indvars.iv.next = add i64 %indvars.iv, 1
  %indvars.iv.next26 = add i64 %indvars.iv25, -1
  %cmp = icmp slt i64 %indvars.iv.next, %indvars.iv.next26
  br i1 %cmp, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noreturn
declare void @_ZSt19__throw_logic_errorPKc(i8*) local_unnamed_addr #3

declare i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"*, i64* dereferenceable(8), i64) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (git@github.com:Parallel-IR/clang-pir.git d2e749e4297552f06eb611b478e6469b4ef482e5) (git@github.com:Parallel-IR/llvm-pir.git 9f49b844b0dccbcacb8aa455da9a7f07e74fb057)"}
!1 = !{!2, !7, i64 8}
!2 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !3, i64 0, !7, i64 8, !5, i64 16}
!3 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!"long", !5, i64 0}
!8 = !{!3, !4, i64 0}
!9 = !{!2, !4, i64 0}
!10 = !{!7, !7, i64 0}
!11 = !{!5, !5, i64 0}
