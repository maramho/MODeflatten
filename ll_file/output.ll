; ModuleID = 'output.bc'
source_filename = "cfg.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [19 x i8] c"Enter an integer: \00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !8
@.str.2 = private unnamed_addr constant [12 x i8] c"Result: %d\0A\00", align 1, !dbg !13

; Function Attrs: mustprogress nofree norecurse nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 !dbg !27 {
  %switchVar182 = alloca i32, align 4
  %switchVar = alloca i32, align 4
  %1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %.reg2mem8 = alloca i32, align 4
  %.reg2mem10 = alloca i32, align 4
  %.reg2mem12 = alloca i32, align 4
  %.reg2mem14 = alloca i32, align 4
  %.reg2mem20 = alloca i32, align 4
  %.reg2mem24 = alloca i32, align 4
  %.reg2mem26 = alloca i32, align 4
  %.reg2mem28 = alloca i32, align 4
  %.reg2mem31 = alloca i32, align 4
  %.reg2mem33 = alloca i1, align 1
  %.reg2mem35 = alloca i1, align 1
  %.reg2mem37 = alloca i1, align 1
  %.reg2mem39 = alloca i32, align 4
  %.reg2mem41 = alloca i32, align 4
  %.reg2mem43 = alloca i32, align 4
  %.reg2mem54 = alloca i32, align 4
  %.reg2mem56 = alloca i32, align 4
  %.reg2mem58 = alloca i32, align 4
  %.reg2mem60 = alloca i32, align 4
  %.reg2mem62 = alloca i32, align 4
  %.reg2mem64 = alloca i32, align 4
  %.reg2mem66 = alloca i32, align 4
  %.reg2mem68 = alloca i32, align 4
  %switchVar70.reg2mem = alloca i32, align 4
  %"reg2mem alloca point145" = bitcast i32 0 to i32
  %"reg2mem alloca point" = bitcast i32 0 to i32
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #4, !dbg !39
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str), !dbg !40
  call void @llvm.dbg.value(metadata ptr %1, metadata !32, metadata !DIExpression(DW_OP_deref)), !dbg !41
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef nonnull @.str.1, ptr noundef nonnull %1), !dbg !42
  call void @llvm.dbg.value(metadata i32 0, metadata !33, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 0, metadata !34, metadata !DIExpression()), !dbg !41
  %4 = load i32, ptr %1, align 4, !tbaa !43
  store i32 %4, ptr %.reg2mem54, align 4
  %.reload55 = load i32, ptr %.reg2mem54, align 4
  store i32 0, ptr %.reg2mem64, align 4
  store i32 0, ptr %.reg2mem66, align 4
  store i32 %.reload55, ptr %.reg2mem68, align 4
  store i32 30580, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

5:                                                ; preds = %dispatcher183
  %.reload69 = load i32, ptr %.reg2mem68, align 4
  %.reload67 = load i32, ptr %.reg2mem66, align 4
  %.reload65 = load i32, ptr %.reg2mem64, align 4
  store i32 %.reload69, ptr %.reg2mem43, align 4
  store i32 %.reload67, ptr %.reg2mem41, align 4
  store i32 %.reload65, ptr %.reg2mem39, align 4
  %.reload44 = load i32, ptr %.reg2mem43, align 4
  %6 = icmp sgt i32 %.reload44, 10
  store i1 %6, ptr %.reg2mem37, align 1
  %.reload45 = load i32, ptr %.reg2mem43, align 4
  %7 = icmp sgt i32 %.reload45, 0
  store i1 %7, ptr %.reg2mem35, align 1
  %.reload46 = load i32, ptr %.reg2mem43, align 4
  %8 = add i32 %.reload46, -1
  %9 = icmp ult i32 %8, 10
  store i1 %9, ptr %.reg2mem33, align 1
  %.reload47 = load i32, ptr %.reg2mem43, align 4
  %10 = icmp sgt i32 %.reload47, 10
  %11 = select i1 %10, i32 2, i32 -1
  store i32 %11, ptr %.reg2mem31, align 4
  %.reload52 = load i32, ptr %.reg2mem43, align 4
  %12 = add nsw i32 %.reload52, -1
  store i32 %12, ptr %.reg2mem28, align 4
  %.reload29 = load i32, ptr %.reg2mem28, align 4
  %13 = zext i32 %.reload29 to i33
  %.reload53 = load i32, ptr %.reg2mem43, align 4
  %14 = add nsw i32 %.reload53, -2
  %15 = zext i32 %14 to i33
  %16 = mul i33 %13, %15
  %17 = lshr i33 %16, 1
  %18 = trunc i33 %17 to i32
  store i32 %18, ptr %.reg2mem26, align 4
  %.reload40 = load i32, ptr %.reg2mem39, align 4
  %.reload42 = load i32, ptr %.reg2mem41, align 4
  store i32 %.reload40, ptr %.reg2mem60, align 4
  store i32 %.reload42, ptr %.reg2mem62, align 4
  store i32 54875, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

19:                                               ; preds = %dispatcher183
  %.reload63 = load i32, ptr %.reg2mem62, align 4
  %.reload61 = load i32, ptr %.reg2mem60, align 4
  store i32 %.reload63, ptr %.reg2mem24, align 4
  store i32 %.reload61, ptr %.reg2mem20, align 4
  %.reload25 = load i32, ptr %.reg2mem24, align 4
  store i32 %.reload25, ptr %.reg2mem58, align 4
  store i32 21110, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

20:                                               ; preds = %dispatcher183
  %.reload59 = load i32, ptr %.reg2mem58, align 4
  store i32 %.reload59, ptr %.reg2mem14, align 4
  call void @llvm.dbg.value(metadata i32 %.reload61, metadata !34, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 %.reload59, metadata !33, metadata !DIExpression()), !dbg !41
  store i32 86239, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock5:                                       ; preds = %dispatcher183
  %.reload19 = load i32, ptr %.reg2mem14, align 4
  %Pivot6 = icmp slt i32 %.reload19, 1
  %21 = select i1 %Pivot6, i32 11458, i32 54579
  store i32 %21, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock3:                                       ; preds = %dispatcher183
  %.reload16 = load i32, ptr %.reg2mem14, align 4
  %Pivot4 = icmp slt i32 %.reload16, 2
  %22 = select i1 %Pivot4, i32 28298, i32 36739
  store i32 %22, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock1:                                       ; preds = %dispatcher183
  %.reload15 = load i32, ptr %.reg2mem14, align 4
  %SwitchLeaf2 = icmp eq i32 %.reload15, 2
  %23 = select i1 %SwitchLeaf2, i32 83509, i32 27621
  store i32 %23, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock1._crit_edge:                            ; preds = %dispatcher183
  store i32 -1, ptr %.reg2mem56, align 4
  store i32 67510, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock:                                        ; preds = %dispatcher183
  %.reload18 = load i32, ptr %.reg2mem14, align 4
  %Pivot = icmp slt i32 %.reload18, 0
  %24 = select i1 %Pivot, i32 38391, i32 34588
  store i32 %24, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock:                                        ; preds = %dispatcher183
  %.reload17 = load i32, ptr %.reg2mem14, align 4
  %SwitchLeaf = icmp eq i32 %.reload17, -1
  %25 = select i1 %SwitchLeaf, i32 31374, i32 12544
  store i32 %25, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock._crit_edge:                             ; preds = %dispatcher183
  store i32 -1, ptr %.reg2mem56, align 4
  store i32 67510, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

26:                                               ; preds = %dispatcher183
  call void @llvm.dbg.value(metadata i32 0, metadata !35, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i32 %.reload61, metadata !34, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 %.reload69, metadata !32, metadata !DIExpression()), !dbg !41
  %.reload36 = load i1, ptr %.reg2mem35, align 1
  %27 = select i1 %.reload36, i32 69056, i32 95132
  store i32 %27, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

._crit_edge:                                      ; preds = %dispatcher183
  store i32 -1, ptr %.reg2mem56, align 4
  store i32 67510, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

28:                                               ; preds = %dispatcher183
  call void @llvm.dbg.value(metadata i32 undef, metadata !35, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.value(metadata i32 undef, metadata !34, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 undef, metadata !34, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !41
  call void @llvm.dbg.value(metadata i32 undef, metadata !32, metadata !DIExpression()), !dbg !41
  %.reload23 = load i32, ptr %.reg2mem20, align 4
  %.reload30 = load i32, ptr %.reg2mem28, align 4
  %29 = add i32 %.reload30, %.reload23, !dbg !48
  %.reload27 = load i32, ptr %.reg2mem26, align 4
  %30 = add i32 %29, %.reload27, !dbg !48
  store i32 %30, ptr %.reg2mem12, align 4
  %.reload13 = load i32, ptr %.reg2mem12, align 4
  store i32 %.reload13, ptr %.reg2mem60, align 4
  store i32 -1, ptr %.reg2mem62, align 4
  store i32 54875, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

31:                                               ; preds = %dispatcher183
  call void @llvm.dbg.value(metadata i32 %.reload69, metadata !32, metadata !DIExpression()), !dbg !41
  %.reload32 = load i32, ptr %.reg2mem31, align 4
  %.reload34 = load i1, ptr %.reg2mem33, align 1
  %32 = select i1 %.reload34, i32 1, i32 %.reload32, !dbg !49
  store i32 %32, ptr %.reg2mem10, align 4
  %.reload11 = load i32, ptr %.reg2mem10, align 4
  store i32 %.reload11, ptr %.reg2mem56, align 4
  store i32 67510, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

33:                                               ; preds = %dispatcher183
  call void @llvm.dbg.value(metadata i32 %.reload61, metadata !34, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 %.reload69, metadata !32, metadata !DIExpression()), !dbg !41
  %.reload38 = load i1, ptr %.reg2mem37, align 1
  %34 = select i1 %.reload38, i32 13778, i32 29178
  store i32 %34, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

._crit_edge7:                                     ; preds = %dispatcher183
  store i32 -1, ptr %.reg2mem56, align 4
  store i32 67510, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

35:                                               ; preds = %dispatcher183
  %.reload57 = load i32, ptr %.reg2mem56, align 4
  store i32 %.reload57, ptr %.reg2mem8, align 4
  %.reload9 = load i32, ptr %.reg2mem8, align 4
  store i32 %.reload9, ptr %.reg2mem58, align 4
  store i32 21110, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

36:                                               ; preds = %dispatcher183
  %.reload49 = load i32, ptr %.reg2mem43, align 4
  %37 = add nsw i32 %.reload49, -1, !dbg !51
  %.reload50 = load i32, ptr %.reg2mem43, align 4
  %38 = add nsw i32 %.reload50, -11, !dbg !51
  %39 = mul i32 %37, %38, !dbg !51
  %40 = zext i32 %38 to i33, !dbg !51
  %.reload51 = load i32, ptr %.reg2mem43, align 4
  %41 = add nsw i32 %.reload51, -12, !dbg !51
  %42 = zext i32 %41 to i33, !dbg !51
  %43 = mul i33 %40, %42, !dbg !51
  %44 = lshr i33 %43, 1, !dbg !51
  %45 = trunc i33 %44 to i32, !dbg !51
  call void @llvm.dbg.value(metadata i32 undef, metadata !34, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 undef, metadata !32, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.value(metadata i32 undef, metadata !34, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !41
  call void @llvm.dbg.value(metadata i32 undef, metadata !32, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !41
  %.reload22 = load i32, ptr %.reg2mem20, align 4
  %.reload48 = load i32, ptr %.reg2mem43, align 4
  %46 = add i32 %.reload48, %.reload22, !dbg !51
  %47 = add i32 %46, %39, !dbg !51
  %48 = sub i32 %47, %45, !dbg !51
  store i32 %48, ptr %.reg2mem, align 4
  store i32 10, ptr %1, align 4, !dbg !52, !tbaa !43
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem64, align 4
  store i32 -1, ptr %.reg2mem66, align 4
  store i32 10, ptr %.reg2mem68, align 4
  store i32 30580, ptr %switchVar, align 4
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

49:                                               ; preds = %dispatcher183
  %.reload21 = load i32, ptr %.reg2mem20, align 4
  %50 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2, i32 noundef %.reload21), !dbg !54
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #4, !dbg !55
  ret i32 0, !dbg !56

dispatcher:                                       ; preds = %dispatcher183
  store i32 %switchVar70, ptr %switchVar70.reg2mem, align 4
  store i32 79912, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock143:                                     ; preds = %dispatcher183
  %switchVar70.reload181 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot144 = icmp slt i32 %switchVar70.reload181, 34588
  %51 = select i1 %Pivot144, i32 30240, i32 85254
  store i32 %51, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock141:                                     ; preds = %dispatcher183
  %switchVar70.reload163 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot142 = icmp slt i32 %switchVar70.reload163, 67510
  %52 = select i1 %Pivot142, i32 57880, i32 96808
  store i32 %52, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock139:                                     ; preds = %dispatcher183
  %switchVar70.reload153 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot140 = icmp slt i32 %switchVar70.reload153, 83509
  %53 = select i1 %Pivot140, i32 18795, i32 20243
  store i32 %53, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock137:                                     ; preds = %dispatcher183
  %switchVar70.reload149 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot138 = icmp slt i32 %switchVar70.reload149, 86239
  %54 = select i1 %Pivot138, i32 256, i32 87946
  store i32 %54, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock135:                                     ; preds = %dispatcher183
  %switchVar70.reload147 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot136 = icmp slt i32 %switchVar70.reload147, 95132
  %55 = select i1 %Pivot136, i32 83331, i32 47419
  store i32 %55, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock133:                                     ; preds = %dispatcher183
  %switchVar70.reload = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf134 = icmp eq i32 %switchVar70.reload, 95132
  %56 = select i1 %SwitchLeaf134, i32 46978, i32 25403
  store i32 %56, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock133.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock131:                                     ; preds = %dispatcher183
  %switchVar70.reload146 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf132 = icmp eq i32 %switchVar70.reload146, 86239
  %57 = select i1 %SwitchLeaf132, i32 19037, i32 95180
  store i32 %57, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock131.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock129:                                     ; preds = %dispatcher183
  %switchVar70.reload148 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf130 = icmp eq i32 %switchVar70.reload148, 83509
  %58 = select i1 %SwitchLeaf130, i32 89975, i32 5699
  store i32 %58, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock129.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock127:                                     ; preds = %dispatcher183
  %switchVar70.reload152 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot128 = icmp slt i32 %switchVar70.reload152, 69056
  %59 = select i1 %Pivot128, i32 64486, i32 41354
  store i32 %59, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock125:                                     ; preds = %dispatcher183
  %switchVar70.reload150 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf126 = icmp eq i32 %switchVar70.reload150, 69056
  %60 = select i1 %SwitchLeaf126, i32 78457, i32 25049
  store i32 %60, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock125.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock123:                                     ; preds = %dispatcher183
  %switchVar70.reload151 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf124 = icmp eq i32 %switchVar70.reload151, 67510
  %61 = select i1 %SwitchLeaf124, i32 57724, i32 39554
  store i32 %61, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock123.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock121:                                     ; preds = %dispatcher183
  %switchVar70.reload162 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot122 = icmp slt i32 %switchVar70.reload162, 38391
  %62 = select i1 %Pivot122, i32 64458, i32 39493
  store i32 %62, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock119:                                     ; preds = %dispatcher183
  %switchVar70.reload158 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot120 = icmp slt i32 %switchVar70.reload158, 54579
  %63 = select i1 %Pivot120, i32 43750, i32 74921
  store i32 %63, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock117:                                     ; preds = %dispatcher183
  %switchVar70.reload156 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot118 = icmp slt i32 %switchVar70.reload156, 54875
  %64 = select i1 %Pivot118, i32 16360, i32 77458
  store i32 %64, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock115:                                     ; preds = %dispatcher183
  %switchVar70.reload154 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf116 = icmp eq i32 %switchVar70.reload154, 54875
  %65 = select i1 %SwitchLeaf116, i32 28243, i32 59978
  store i32 %65, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock115.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock113:                                     ; preds = %dispatcher183
  %switchVar70.reload155 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf114 = icmp eq i32 %switchVar70.reload155, 54579
  %66 = select i1 %SwitchLeaf114, i32 56089, i32 37871
  store i32 %66, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock113.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock111:                                     ; preds = %dispatcher183
  %switchVar70.reload157 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf112 = icmp eq i32 %switchVar70.reload157, 38391
  %67 = select i1 %SwitchLeaf112, i32 76239, i32 43344
  store i32 %67, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock111.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock109:                                     ; preds = %dispatcher183
  %switchVar70.reload161 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot110 = icmp slt i32 %switchVar70.reload161, 36739
  %68 = select i1 %Pivot110, i32 89073, i32 34504
  store i32 %68, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock107:                                     ; preds = %dispatcher183
  %switchVar70.reload159 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf108 = icmp eq i32 %switchVar70.reload159, 36739
  %69 = select i1 %SwitchLeaf108, i32 27385, i32 63982
  store i32 %69, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock107.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock105:                                     ; preds = %dispatcher183
  %switchVar70.reload160 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf106 = icmp eq i32 %switchVar70.reload160, 34588
  %70 = select i1 %SwitchLeaf106, i32 5113, i32 81681
  store i32 %70, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock105.dispatcher_crit_edge:                ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock103:                                     ; preds = %dispatcher183
  %switchVar70.reload180 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot104 = icmp slt i32 %switchVar70.reload180, 27621
  %71 = select i1 %Pivot104, i32 11594, i32 56123
  store i32 %71, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock101:                                     ; preds = %dispatcher183
  %switchVar70.reload172 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot102 = icmp slt i32 %switchVar70.reload172, 29178
  %72 = select i1 %Pivot102, i32 88285, i32 26030
  store i32 %72, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock99:                                      ; preds = %dispatcher183
  %switchVar70.reload168 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot100 = icmp slt i32 %switchVar70.reload168, 30580
  %73 = select i1 %Pivot100, i32 84442, i32 23857
  store i32 %73, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock97:                                      ; preds = %dispatcher183
  %switchVar70.reload166 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot98 = icmp slt i32 %switchVar70.reload166, 31374
  %74 = select i1 %Pivot98, i32 85188, i32 47479
  store i32 %74, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock95:                                      ; preds = %dispatcher183
  %switchVar70.reload164 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf96 = icmp eq i32 %switchVar70.reload164, 31374
  %75 = select i1 %SwitchLeaf96, i32 20919, i32 62390
  store i32 %75, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock95.dispatcher_crit_edge:                 ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock93:                                      ; preds = %dispatcher183
  %switchVar70.reload165 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf94 = icmp eq i32 %switchVar70.reload165, 30580
  %76 = select i1 %SwitchLeaf94, i32 66945, i32 29030
  store i32 %76, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock93.dispatcher_crit_edge:                 ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock91:                                      ; preds = %dispatcher183
  %switchVar70.reload167 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf92 = icmp eq i32 %switchVar70.reload167, 29178
  %77 = select i1 %SwitchLeaf92, i32 87897, i32 75026
  store i32 %77, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock91.dispatcher_crit_edge:                 ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock89:                                      ; preds = %dispatcher183
  %switchVar70.reload171 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot90 = icmp slt i32 %switchVar70.reload171, 28298
  %78 = select i1 %Pivot90, i32 8337, i32 39601
  store i32 %78, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock87:                                      ; preds = %dispatcher183
  %switchVar70.reload169 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf88 = icmp eq i32 %switchVar70.reload169, 28298
  %79 = select i1 %SwitchLeaf88, i32 55944, i32 73397
  store i32 %79, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock87.dispatcher_crit_edge:                 ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock85:                                      ; preds = %dispatcher183
  %switchVar70.reload170 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf86 = icmp eq i32 %switchVar70.reload170, 27621
  %80 = select i1 %SwitchLeaf86, i32 58934, i32 79478
  store i32 %80, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock85.dispatcher_crit_edge:                 ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock83:                                      ; preds = %dispatcher183
  %switchVar70.reload179 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot84 = icmp slt i32 %switchVar70.reload179, 13778
  %81 = select i1 %Pivot84, i32 80905, i32 54547
  store i32 %81, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock81:                                      ; preds = %dispatcher183
  %switchVar70.reload175 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot82 = icmp slt i32 %switchVar70.reload175, 21110
  %82 = select i1 %Pivot82, i32 65599, i32 18317
  store i32 %82, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock79:                                      ; preds = %dispatcher183
  %switchVar70.reload173 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf80 = icmp eq i32 %switchVar70.reload173, 21110
  %83 = select i1 %SwitchLeaf80, i32 43469, i32 79157
  store i32 %83, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock79.dispatcher_crit_edge:                 ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock77:                                      ; preds = %dispatcher183
  %switchVar70.reload174 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf78 = icmp eq i32 %switchVar70.reload174, 13778
  %84 = select i1 %SwitchLeaf78, i32 29692, i32 33434
  store i32 %84, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock77.dispatcher_crit_edge:                 ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

NodeBlock75:                                      ; preds = %dispatcher183
  %switchVar70.reload178 = load i32, ptr %switchVar70.reg2mem, align 4
  %Pivot76 = icmp slt i32 %switchVar70.reload178, 12544
  %85 = select i1 %Pivot76, i32 76915, i32 52518
  store i32 %85, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock73:                                      ; preds = %dispatcher183
  %switchVar70.reload176 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf74 = icmp eq i32 %switchVar70.reload176, 12544
  %86 = select i1 %SwitchLeaf74, i32 85282, i32 16274
  store i32 %86, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock73.dispatcher_crit_edge:                 ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock71:                                      ; preds = %dispatcher183
  %switchVar70.reload177 = load i32, ptr %switchVar70.reg2mem, align 4
  %SwitchLeaf72 = icmp eq i32 %switchVar70.reload177, 11458
  %87 = select i1 %SwitchLeaf72, i32 81095, i32 88539
  store i32 %87, ptr %switchVar182, align 4
  br label %dispatcher183

LeafBlock71.dispatcher_crit_edge:                 ; preds = %dispatcher183
  store i32 85870, ptr %switchVar182, align 4
  br label %dispatcher183

dispatcher183:                                    ; preds = %LeafBlock71.dispatcher_crit_edge, %LeafBlock71, %LeafBlock73.dispatcher_crit_edge, %LeafBlock73, %NodeBlock75, %LeafBlock77.dispatcher_crit_edge, %LeafBlock77, %LeafBlock79.dispatcher_crit_edge, %LeafBlock79, %NodeBlock81, %NodeBlock83, %LeafBlock85.dispatcher_crit_edge, %LeafBlock85, %LeafBlock87.dispatcher_crit_edge, %LeafBlock87, %NodeBlock89, %LeafBlock91.dispatcher_crit_edge, %LeafBlock91, %LeafBlock93.dispatcher_crit_edge, %LeafBlock93, %LeafBlock95.dispatcher_crit_edge, %LeafBlock95, %NodeBlock97, %NodeBlock99, %NodeBlock101, %NodeBlock103, %LeafBlock105.dispatcher_crit_edge, %LeafBlock105, %LeafBlock107.dispatcher_crit_edge, %LeafBlock107, %NodeBlock109, %LeafBlock111.dispatcher_crit_edge, %LeafBlock111, %LeafBlock113.dispatcher_crit_edge, %LeafBlock113, %LeafBlock115.dispatcher_crit_edge, %LeafBlock115, %NodeBlock117, %NodeBlock119, %NodeBlock121, %LeafBlock123.dispatcher_crit_edge, %LeafBlock123, %LeafBlock125.dispatcher_crit_edge, %LeafBlock125, %NodeBlock127, %LeafBlock129.dispatcher_crit_edge, %LeafBlock129, %LeafBlock131.dispatcher_crit_edge, %LeafBlock131, %LeafBlock133.dispatcher_crit_edge, %LeafBlock133, %NodeBlock135, %NodeBlock137, %NodeBlock139, %NodeBlock141, %NodeBlock143, %dispatcher, %36, %35, %._crit_edge7, %33, %31, %28, %._crit_edge, %26, %LeafBlock._crit_edge, %LeafBlock, %NodeBlock, %LeafBlock1._crit_edge, %LeafBlock1, %NodeBlock3, %NodeBlock5, %20, %19, %5, %0, %dispatcher183
  %switchVar70 = load i32, ptr %switchVar, align 4
  %switchVar184 = load i32, ptr %switchVar182, align 4
  switch i32 %switchVar184, label %dispatcher183 [
    i32 66945, label %5
    i32 28243, label %19
    i32 43469, label %20
    i32 19037, label %NodeBlock5
    i32 56089, label %NodeBlock3
    i32 27385, label %LeafBlock1
    i32 58934, label %LeafBlock1._crit_edge
    i32 81095, label %NodeBlock
    i32 76239, label %LeafBlock
    i32 85282, label %LeafBlock._crit_edge
    i32 55944, label %26
    i32 46978, label %._crit_edge
    i32 78457, label %28
    i32 5113, label %31
    i32 89975, label %33
    i32 87897, label %._crit_edge7
    i32 57724, label %35
    i32 29692, label %36
    i32 20919, label %49
    i32 85870, label %dispatcher
    i32 79912, label %NodeBlock143
    i32 85254, label %NodeBlock141
    i32 96808, label %NodeBlock139
    i32 20243, label %NodeBlock137
    i32 87946, label %NodeBlock135
    i32 47419, label %LeafBlock133
    i32 25403, label %LeafBlock133.dispatcher_crit_edge
    i32 83331, label %LeafBlock131
    i32 95180, label %LeafBlock131.dispatcher_crit_edge
    i32 256, label %LeafBlock129
    i32 5699, label %LeafBlock129.dispatcher_crit_edge
    i32 18795, label %NodeBlock127
    i32 41354, label %LeafBlock125
    i32 25049, label %LeafBlock125.dispatcher_crit_edge
    i32 64486, label %LeafBlock123
    i32 39554, label %LeafBlock123.dispatcher_crit_edge
    i32 57880, label %NodeBlock121
    i32 39493, label %NodeBlock119
    i32 74921, label %NodeBlock117
    i32 77458, label %LeafBlock115
    i32 59978, label %LeafBlock115.dispatcher_crit_edge
    i32 16360, label %LeafBlock113
    i32 37871, label %LeafBlock113.dispatcher_crit_edge
    i32 43750, label %LeafBlock111
    i32 43344, label %LeafBlock111.dispatcher_crit_edge
    i32 64458, label %NodeBlock109
    i32 34504, label %LeafBlock107
    i32 63982, label %LeafBlock107.dispatcher_crit_edge
    i32 89073, label %LeafBlock105
    i32 81681, label %LeafBlock105.dispatcher_crit_edge
    i32 30240, label %NodeBlock103
    i32 56123, label %NodeBlock101
    i32 26030, label %NodeBlock99
    i32 23857, label %NodeBlock97
    i32 47479, label %LeafBlock95
    i32 62390, label %LeafBlock95.dispatcher_crit_edge
    i32 85188, label %LeafBlock93
    i32 29030, label %LeafBlock93.dispatcher_crit_edge
    i32 84442, label %LeafBlock91
    i32 75026, label %LeafBlock91.dispatcher_crit_edge
    i32 88285, label %NodeBlock89
    i32 39601, label %LeafBlock87
    i32 73397, label %LeafBlock87.dispatcher_crit_edge
    i32 8337, label %LeafBlock85
    i32 79478, label %LeafBlock85.dispatcher_crit_edge
    i32 11594, label %NodeBlock83
    i32 54547, label %NodeBlock81
    i32 18317, label %LeafBlock79
    i32 79157, label %LeafBlock79.dispatcher_crit_edge
    i32 65599, label %LeafBlock77
    i32 33434, label %LeafBlock77.dispatcher_crit_edge
    i32 80905, label %NodeBlock75
    i32 52518, label %LeafBlock73
    i32 16274, label %LeafBlock73.dispatcher_crit_edge
    i32 76915, label %LeafBlock71
    i32 88539, label %LeafBlock71.dispatcher_crit_edge
  ]
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @__isoc99_scanf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { mustprogress nofree norecurse nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!18}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 5, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cfg.cpp", directory: "/home/dongho.lee/LLVM/llvm-obfuscator/scripts/llvm_pass/src", checksumkind: CSK_MD5, checksum: "9d821bbe23efcb89a86cce9a937ba13d")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 19)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 3)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 44, type: !15, isLocal: true, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 12)
!18 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !2, producer: "clang version 15.0.0 (https://github.com/llvm/llvm-project.git 4ba6a9c9f65bbc8bd06e3652cb20fd4dfc846137)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !19, splitDebugInlining: false, nameTableKind: None)
!19 = !{!0, !8, !13}
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 2}
!26 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 4ba6a9c9f65bbc8bd06e3652cb20fd4dfc846137)"}
!27 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 3, type: !28, scopeLine: 3, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, retainedNodes: !31)
!28 = !DISubroutineType(types: !29)
!29 = !{!30}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !{!32, !33, !34, !35}
!32 = !DILocalVariable(name: "input", scope: !27, file: !2, line: 4, type: !30)
!33 = !DILocalVariable(name: "state", scope: !27, file: !2, line: 8, type: !30)
!34 = !DILocalVariable(name: "result", scope: !27, file: !2, line: 9, type: !30)
!35 = !DILocalVariable(name: "i", scope: !36, file: !2, line: 24, type: !30)
!36 = distinct !DILexicalBlock(scope: !37, file: !2, line: 24, column: 17)
!37 = distinct !DILexicalBlock(scope: !38, file: !2, line: 12, column: 24)
!38 = distinct !DILexicalBlock(scope: !27, file: !2, line: 11, column: 25)
!39 = !DILocation(line: 4, column: 5, scope: !27)
!40 = !DILocation(line: 5, column: 5, scope: !27)
!41 = !DILocation(line: 0, scope: !27)
!42 = !DILocation(line: 6, column: 5, scope: !27)
!43 = !{!44, !44, i64 0}
!44 = !{!"int", !45, i64 0}
!45 = !{!"omnipotent char", !46, i64 0}
!46 = !{!"Simple C++ TBAA"}
!47 = !DILocation(line: 0, scope: !36)
!48 = !DILocation(line: 24, column: 17, scope: !36)
!49 = !DILocation(line: 14, column: 31, scope: !50)
!50 = distinct !DILexicalBlock(scope: !37, file: !2, line: 14, column: 21)
!51 = !DILocation(line: 31, column: 17, scope: !37)
!52 = !DILocation(line: 33, column: 26, scope: !53)
!53 = distinct !DILexicalBlock(scope: !37, file: !2, line: 31, column: 36)
!54 = !DILocation(line: 44, column: 5, scope: !27)
!55 = !DILocation(line: 46, column: 1, scope: !27)
!56 = !DILocation(line: 45, column: 5, scope: !27)
