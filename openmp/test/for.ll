; ModuleID = 'for.cpp'
source_filename = "for.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_for.cpp, i8* null }]

; Function Attrs: noinline norecurse uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %a = alloca float*, align 8
  %b = alloca float*, align 8
  store i32 0, i32* %retval, align 4
  %call = call i32 @_Z9init_sizev()
  store i32 %call, i32* %n, align 4
  %call1 = call float* @_Z8init_arrv()
  store float* %call1, float** %a, align 8
  %call2 = call float* @_Z8init_arrv()
  store float* %call2, float** %b, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.fork, label %for.end

for.fork:                                         ; preds = %for.inc, %for.cond
  fork label %for.body, %for.inc

for.body:                                         ; preds = %for.fork
  %2 = load float*, float** %a, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom
  %4 = load float, float* %arrayidx, align 4
  %5 = load float*, float** %a, align 8
  %6 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %6, 1
  %idxprom3 = sext i32 %sub to i64
  %arrayidx4 = getelementptr inbounds float, float* %5, i64 %idxprom3
  %7 = load float, float* %arrayidx4, align 4
  %add = fadd float %4, %7
  %conv = fpext float %add to double
  %div = fdiv double %conv, 2.000000e+00
  %conv5 = fptrunc double %div to float
  %8 = load float*, float** %b, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds float, float* %8, i64 %idxprom6
  store float %conv5, float* %arrayidx7, align 4
  halt label %for.inc

for.inc:                                          ; preds = %for.body, %for.fork
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* %n, align 4
  %cmp8 = icmp slt i32 %11, %12
  br i1 %cmp8, label %for.fork, label %for.join

for.join:                                         ; preds = %for.inc
  join label %for.end

for.end:                                          ; preds = %for.join, %for.cond
  ret i32 0
}

declare i32 @_Z9init_sizev() #1

declare float* @_Z8init_arrv() #1

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #2 section ".text.startup" {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_for.cpp() #2 section ".text.startup" {
entry:
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (git@github.com:Parallel-IR/clang-pir.git 791a6034126b1605e724e7ecc9946589037a0074) (git@github.com:Parallel-IR/llvm-pir.git 00753fd0d0276c0602d12690b9532fa5ddbdcd1a)"}
