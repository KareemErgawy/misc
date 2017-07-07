; This file describes how a parallel for loop should like to be properly
; handeled by PIR.

for.cond:
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* %n, align 4
  %cmp9 = icmp slt i32 %11, %12
  br i1 %cmp9, label %for.head, label %for.end

for.head:
  fork label %for.body, label %for.inc

for.body:                                       ; preds = %for.cond8
  %13 = load float*, float** %a, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %14 to i64
  %arrayidx12 = getelementptr inbounds float, float* %13, i64 %idxprom11
  %15 = load float, float* %arrayidx12, align 4
  %16 = load float*, float** %a, align 8
  %17 = load i32, i32* %i, align 4
  %sub13 = sub nsw i32 %17, 1
  %idxprom14 = sext i32 %sub13 to i64
  %arrayidx15 = getelementptr inbounds float, float* %16, i64 %idxprom14
  %18 = load float, float* %arrayidx15, align 4
  %add16 = fadd float %15, %18
  %conv17 = fpext float %add16 to double
  %div18 = fdiv double %conv17, 2.000000e+00
  %conv19 = fptrunc double %div18 to float
  %19 = load float*, float** %b, align 8
  %20 = load i32, i32* %i, align 4
  %idxprom20 = sext i32 %20 to i64
  %arrayidx21 = getelementptr inbounds float, float* %19, i64 %idxprom20
  store float %conv19, float* %arrayidx21, align 4
  halt label %for.inc

for.inc:
  %21 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %21, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond

for.end:                                        ; preds = %for.cond8
  ... ; The join doens't have to be in for.end BB
  join
