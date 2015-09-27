define i32 @simple_loop(i32 %arg1, i32 %arg2) {
entry:
  br label %H

H:                                                ; preds = %B, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %B ]
  %ret.0 = phi i32 [ 0, %entry ], [ %add, %B ]
  %cmp = icmp slt i32 %i.0, %arg2
  br i1 %cmp, label %B, label %T

B:                                                ; preds = %H
  %add = add nsw i32 %ret.0, %arg1
  %inc = add nsw i32 %i.0, 1
  br label %H

T:                                                ; preds = %H
  ret i32 %ret.0
}
