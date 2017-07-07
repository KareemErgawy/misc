; ModuleID = 'pass.cpp'
source_filename = "pass.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind uwtable
define void @_Z4takeRiPi(i32* nocapture dereferenceable(4) %byRef, i32* nocapture readnone %byPtr) local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* %byRef, align 4, !tbaa !1
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %byRef, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @_Z4givev() local_unnamed_addr #1 {
entry:
  %x = alloca i32, align 4
  %0 = bitcast i32* %x to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %0) #3
  call void @_Z4takeRiPi(i32* nonnull dereferenceable(4) %x, i32* undef)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %0) #3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (git@github.com:Parallel-IR/clang-pir.git d2e749e4297552f06eb611b478e6469b4ef482e5) (git@github.com:Parallel-IR/llvm-pir.git 9f49b844b0dccbcacb8aa455da9a7f07e74fb057)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C++ TBAA"}
