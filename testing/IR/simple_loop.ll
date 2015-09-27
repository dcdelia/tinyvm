define i32 @simple_loop(i32 %arg1, i32 %arg2) #0 {
entry:
  %arg1.addr = alloca i32, align 4
  %arg2.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  store i32 %arg2, i32* %arg2.addr, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ret, align 4
  br label %H

H:                                                ; preds = %B, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %arg2.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %B, label %T

B:                                                ; preds = %H
  %2 = load i32* %arg1.addr, align 4
  %3 = load i32* %ret, align 4
  %add = add nsw i32 %3, %2
  store i32 %add, i32* %ret, align 4
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %H

T:                                                ; preds = %H
  %5 = load i32* %ret, align 4
  ret i32 %5
}
