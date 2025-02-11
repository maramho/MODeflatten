; ModuleID = 'cfg.O0.ll'
source_filename = "cfg.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [19 x i8] c"Enter an integer: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"Result: %d\0A\00", align 1

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local i32 @main() local_unnamed_addr #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !19
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #4, !dbg !19
  %3 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0)), !dbg !20
  call void @llvm.dbg.value(metadata i32* %1, metadata !12, metadata !DIExpression(DW_OP_deref)), !dbg !21
  %4 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* nonnull %1), !dbg !22
  call void @llvm.dbg.value(metadata i32 0, metadata !13, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 0, metadata !14, metadata !DIExpression()), !dbg !21
  br label %.loopexit.outer, !dbg !23

.loopexit.outer:                                  ; preds = %.loopexit.outer.backedge, %0
  %.015.ph = phi i32 [ 0, %0 ], [ -1, %.loopexit.outer.backedge ]
  %.014.ph = phi i32 [ 0, %0 ], [ %.014.ph.be, %.loopexit.outer.backedge ]
  %.pr = load i32, i32* %1, align 4
  %5 = icmp sgt i32 %.pr, 10
  %6 = load i32, i32* %1, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = load i32, i32* %1, align 4
  %.off = add i32 %8, -1
  %9 = icmp ult i32 %.off, 10
  %10 = icmp sgt i32 %8, 10
  %spec.select = select i1 %10, i32 2, i32 -1
  br label %.loopexit, !dbg !23

.loopexit:                                        ; preds = %.loopexit.backedge, %.loopexit.outer
  %.015 = phi i32 [ %.015.ph, %.loopexit.outer ], [ %.015.be, %.loopexit.backedge ], !dbg !21
  call void @llvm.dbg.value(metadata i32 %.014.ph, metadata !14, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 %.015, metadata !13, metadata !DIExpression()), !dbg !21
  switch i32 %.015, label %.loopexit.backedge [
    i32 -1, label %34
    i32 0, label %21
    i32 1, label %.preheader
    i32 2, label %thread-pre-split
  ], !dbg !23

.preheader:                                       ; preds = %.loopexit
  call void @llvm.dbg.value(metadata i32 0, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata i32 %.014.ph, metadata !14, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 %6, metadata !12, metadata !DIExpression()), !dbg !21
  br i1 %7, label %.lr.ph22, label %.loopexit.backedge, !dbg !25

.lr.ph22:                                         ; preds = %.preheader
  %11 = add nsw i32 %6, -1, !dbg !25
  %12 = zext i32 %11 to i33, !dbg !25
  %13 = add nsw i32 %6, -2, !dbg !25
  %14 = zext i32 %13 to i33, !dbg !25
  %15 = mul i33 %12, %14, !dbg !25
  %16 = lshr i33 %15, 1, !dbg !25
  %17 = trunc i33 %16 to i32, !dbg !25
  call void @llvm.dbg.value(metadata i32 undef, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata i32 undef, metadata !14, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 undef, metadata !12, metadata !DIExpression()), !dbg !21
  %18 = add i32 %.014.ph, -1, !dbg !25
  %19 = add i32 %18, %6, !dbg !25
  %20 = add i32 %19, %17, !dbg !25
  br label %.loopexit.outer.backedge, !dbg !23

21:                                               ; preds = %.loopexit
  call void @llvm.dbg.value(metadata i32 %8, metadata !12, metadata !DIExpression()), !dbg !21
  %spec.select26 = select i1 %9, i32 1, i32 %spec.select, !dbg !26
  br label %.loopexit.backedge, !dbg !26

thread-pre-split:                                 ; preds = %.loopexit
  call void @llvm.dbg.value(metadata i32 %.014.ph, metadata !14, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 %.pr, metadata !12, metadata !DIExpression()), !dbg !21
  br i1 %5, label %.lr.ph.preheader, label %.loopexit.backedge, !dbg !28

.loopexit.backedge:                               ; preds = %21, %thread-pre-split, %.preheader, %.loopexit
  %.015.be = phi i32 [ -1, %.loopexit ], [ -1, %.preheader ], [ -1, %thread-pre-split ], [ %spec.select26, %21 ]
  br label %.loopexit, !dbg !21, !llvm.loop !29

.lr.ph.preheader:                                 ; preds = %thread-pre-split
  %22 = add nsw i32 %.pr, -1, !dbg !28
  %23 = add nsw i32 %.pr, -11, !dbg !28
  %24 = mul i32 %22, %23, !dbg !28
  %25 = zext i32 %23 to i33, !dbg !28
  %26 = add nsw i32 %.pr, -12, !dbg !28
  %27 = zext i32 %26 to i33, !dbg !28
  %28 = mul i33 %25, %27, !dbg !28
  %29 = lshr i33 %28, 1, !dbg !28
  %30 = trunc i33 %29 to i32, !dbg !28
  call void @llvm.dbg.value(metadata i32 undef, metadata !14, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 undef, metadata !12, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 undef, metadata !12, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !21
  %31 = add i32 %.014.ph, %.pr, !dbg !28
  %32 = add i32 %31, %24, !dbg !28
  %33 = sub i32 %32, %30, !dbg !28
  store i32 10, i32* %1, align 4, !dbg !33, !tbaa !35
  br label %.loopexit.outer.backedge, !dbg !28

.loopexit.outer.backedge:                         ; preds = %.lr.ph.preheader, %.lr.ph22
  %.014.ph.be = phi i32 [ %20, %.lr.ph22 ], [ %33, %.lr.ph.preheader ]
  br label %.loopexit.outer, !dbg !23, !llvm.loop !29

34:                                               ; preds = %.loopexit
  %35 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i32 %.014.ph), !dbg !39
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #4, !dbg !40
  ret i32 0, !dbg !41
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @__isoc99_scanf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nofree norecurse nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "cfg.cpp", directory: "/home/dongho.lee/LLVM/llvm-obfuscator/scripts/llvm_pass/src")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !11)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{!12, !13, !14, !15}
!12 = !DILocalVariable(name: "input", scope: !7, file: !1, line: 4, type: !10)
!13 = !DILocalVariable(name: "state", scope: !7, file: !1, line: 8, type: !10)
!14 = !DILocalVariable(name: "result", scope: !7, file: !1, line: 9, type: !10)
!15 = !DILocalVariable(name: "i", scope: !16, file: !1, line: 24, type: !10)
!16 = distinct !DILexicalBlock(scope: !17, file: !1, line: 24, column: 17)
!17 = distinct !DILexicalBlock(scope: !18, file: !1, line: 12, column: 24)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 25)
!19 = !DILocation(line: 4, column: 5, scope: !7)
!20 = !DILocation(line: 5, column: 5, scope: !7)
!21 = !DILocation(line: 0, scope: !7)
!22 = !DILocation(line: 6, column: 5, scope: !7)
!23 = !DILocation(line: 11, column: 5, scope: !7)
!24 = !DILocation(line: 0, scope: !16)
!25 = !DILocation(line: 24, column: 17, scope: !16)
!26 = !DILocation(line: 14, column: 31, scope: !27)
!27 = distinct !DILexicalBlock(scope: !17, file: !1, line: 14, column: 21)
!28 = !DILocation(line: 31, column: 17, scope: !17)
!29 = distinct !{!29, !23, !30, !31, !32}
!30 = !DILocation(line: 42, column: 5, scope: !7)
!31 = !{!"llvm.loop.mustprogress"}
!32 = !{!"llvm.loop.unroll.disable"}
!33 = !DILocation(line: 33, column: 26, scope: !34)
!34 = distinct !DILexicalBlock(scope: !17, file: !1, line: 31, column: 36)
!35 = !{!36, !36, i64 0}
!36 = !{!"int", !37, i64 0}
!37 = !{!"omnipotent char", !38, i64 0}
!38 = !{!"Simple C++ TBAA"}
!39 = !DILocation(line: 44, column: 5, scope: !7)
!40 = !DILocation(line: 46, column: 1, scope: !7)
!41 = !DILocation(line: 45, column: 5, scope: !7)
