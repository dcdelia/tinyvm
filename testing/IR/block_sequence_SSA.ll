define i32 @block_sequence(i32 %arg1, i32 %arg2) #0 {
entry:
  %add = add nsw i32 %arg1, 1
  %sub = sub nsw i32 %arg2, 1
  br label %B1

B1:                                               ; preds = %entry
  %add1 = add nsw i32 %add, %sub
  %sub2 = sub nsw i32 %add, %sub
  br label %B2

B2:                                               ; preds = %B1
  %add3 = add nsw i32 %add1, %sub2
  %div = sdiv i32 %add3, 2
  %sub4 = sub nsw i32 %add1, %sub2
  %div5 = sdiv i32 %sub4, 2
  %add6 = add nsw i32 %div, %div5
  ret i32 %add6
}
