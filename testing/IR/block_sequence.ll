define i32 @block_sequence(i32 %arg1, i32 %arg2) #0 {
entry:
  %arg1.addr = alloca i32, align 4
  %arg2.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %h = alloca i32, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  store i32 %arg2, i32* %arg2.addr, align 4
  %0 = load i32* %arg1.addr, align 4
  %add = add nsw i32 %0, 1
  store i32 %add, i32* %c, align 4
  %1 = load i32* %arg2.addr, align 4
  %sub = sub nsw i32 %1, 1
  store i32 %sub, i32* %d, align 4
  br label %B1

B1:                                               ; preds = %entry
  %2 = load i32* %c, align 4
  %3 = load i32* %d, align 4
  %add1 = add nsw i32 %2, %3
  store i32 %add1, i32* %e, align 4
  %4 = load i32* %c, align 4
  %5 = load i32* %d, align 4
  %sub2 = sub nsw i32 %4, %5
  store i32 %sub2, i32* %f, align 4
  br label %B2

B2:                                               ; preds = %B1
  %6 = load i32* %e, align 4
  %7 = load i32* %f, align 4
  %add3 = add nsw i32 %6, %7
  %div = sdiv i32 %add3, 2
  store i32 %div, i32* %g, align 4
  %8 = load i32* %e, align 4
  %9 = load i32* %f, align 4
  %sub4 = sub nsw i32 %8, %9
  %div5 = sdiv i32 %sub4, 2
  store i32 %div5, i32* %h, align 4
  %10 = load i32* %g, align 4
  %11 = load i32* %h, align 4
  %add6 = add nsw i32 %10, %11
  ret i32 %add6
}
