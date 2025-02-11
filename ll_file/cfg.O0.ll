; ModuleID = 'cfg.ll'
source_filename = "cfg.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [19 x i8] c"Enter an integer: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"Result: %d\0A\00", align 1

; Function Attrs: norecurse uwtable mustprogress
define dso_local i32 @main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %6 = bitcast i32* %2 to i8*, !dbg !19
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %2, metadata !12, metadata !DIExpression()), !dbg !20
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0)), !dbg !21
  %8 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* %2), !dbg !22
  %9 = bitcast i32* %3 to i8*, !dbg !23
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %3, metadata !13, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %3, align 4, !dbg !24, !tbaa !25
  %10 = bitcast i32* %4 to i8*, !dbg !29
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %4, metadata !14, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %4, align 4, !dbg !30, !tbaa !25
  br label %11, !dbg !31

11:                                               ; preds = %58, %0
  %12 = load i32, i32* %3, align 4, !dbg !32, !tbaa !25
  %13 = icmp ne i32 %12, -1, !dbg !33
  br i1 %13, label %14, label %59, !dbg !31

14:                                               ; preds = %11
  %15 = load i32, i32* %3, align 4, !dbg !34, !tbaa !25
  switch i32 %15, label %57 [
    i32 0, label %16
    i32 1, label %30
    i32 2, label %46
  ], !dbg !35

16:                                               ; preds = %14
  %17 = load i32, i32* %2, align 4, !dbg !36, !tbaa !25
  %18 = icmp sgt i32 %17, 0, !dbg !38
  br i1 %18, label %19, label %23, !dbg !39

19:                                               ; preds = %16
  %20 = load i32, i32* %2, align 4, !dbg !40, !tbaa !25
  %21 = icmp sle i32 %20, 10, !dbg !41
  br i1 %21, label %22, label %23, !dbg !42

22:                                               ; preds = %19
  store i32 1, i32* %3, align 4, !dbg !43, !tbaa !25
  br label %29, !dbg !45

23:                                               ; preds = %19, %16
  %24 = load i32, i32* %2, align 4, !dbg !46, !tbaa !25
  %25 = icmp sgt i32 %24, 10, !dbg !48
  br i1 %25, label %26, label %27, !dbg !49

26:                                               ; preds = %23
  store i32 2, i32* %3, align 4, !dbg !50, !tbaa !25
  br label %28, !dbg !52

27:                                               ; preds = %23
  store i32 -1, i32* %3, align 4, !dbg !53, !tbaa !25
  br label %28

28:                                               ; preds = %27, %26
  br label %29

29:                                               ; preds = %28, %22
  br label %58, !dbg !55

30:                                               ; preds = %14
  %31 = bitcast i32* %5 to i8*, !dbg !56
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %31) #4, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %5, metadata !15, metadata !DIExpression()), !dbg !57
  store i32 0, i32* %5, align 4, !dbg !57, !tbaa !25
  br label %32, !dbg !56

32:                                               ; preds = %42, %30
  %33 = load i32, i32* %5, align 4, !dbg !58, !tbaa !25
  %34 = load i32, i32* %2, align 4, !dbg !60, !tbaa !25
  %35 = icmp slt i32 %33, %34, !dbg !61
  br i1 %35, label %38, label %36, !dbg !62

36:                                               ; preds = %32
  %37 = bitcast i32* %5 to i8*, !dbg !63
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #4, !dbg !63
  br label %45

38:                                               ; preds = %32
  %39 = load i32, i32* %5, align 4, !dbg !64, !tbaa !25
  %40 = load i32, i32* %4, align 4, !dbg !66, !tbaa !25
  %41 = add nsw i32 %40, %39, !dbg !66
  store i32 %41, i32* %4, align 4, !dbg !66, !tbaa !25
  br label %42, !dbg !67

42:                                               ; preds = %38
  %43 = load i32, i32* %5, align 4, !dbg !68, !tbaa !25
  %44 = add nsw i32 %43, 1, !dbg !68
  store i32 %44, i32* %5, align 4, !dbg !68, !tbaa !25
  br label %32, !dbg !63, !llvm.loop !69

45:                                               ; preds = %36
  store i32 -1, i32* %3, align 4, !dbg !73, !tbaa !25
  br label %58, !dbg !74

46:                                               ; preds = %14
  br label %47, !dbg !75

47:                                               ; preds = %50, %46
  %48 = load i32, i32* %2, align 4, !dbg !76, !tbaa !25
  %49 = icmp sgt i32 %48, 10, !dbg !77
  br i1 %49, label %50, label %56, !dbg !75

50:                                               ; preds = %47
  %51 = load i32, i32* %2, align 4, !dbg !78, !tbaa !25
  %52 = load i32, i32* %4, align 4, !dbg !80, !tbaa !25
  %53 = add nsw i32 %52, %51, !dbg !80
  store i32 %53, i32* %4, align 4, !dbg !80, !tbaa !25
  %54 = load i32, i32* %2, align 4, !dbg !81, !tbaa !25
  %55 = add nsw i32 %54, -1, !dbg !81
  store i32 %55, i32* %2, align 4, !dbg !81, !tbaa !25
  br label %47, !dbg !75, !llvm.loop !82

56:                                               ; preds = %47
  store i32 -1, i32* %3, align 4, !dbg !84, !tbaa !25
  br label %58, !dbg !85

57:                                               ; preds = %14
  store i32 -1, i32* %3, align 4, !dbg !86, !tbaa !25
  br label %58, !dbg !87

58:                                               ; preds = %57, %56, %45, %29
  br label %11, !dbg !31, !llvm.loop !88

59:                                               ; preds = %11
  %60 = load i32, i32* %4, align 4, !dbg !90, !tbaa !25
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i32 %60), !dbg !91
  %62 = bitcast i32* %4 to i8*, !dbg !92
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %62) #4, !dbg !92
  %63 = bitcast i32* %3 to i8*, !dbg !92
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %63) #4, !dbg !92
  %64 = bitcast i32* %2 to i8*, !dbg !92
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %64) #4, !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @__isoc99_scanf(i8*, ...) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { norecurse uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!20 = !DILocation(line: 4, column: 9, scope: !7)
!21 = !DILocation(line: 5, column: 5, scope: !7)
!22 = !DILocation(line: 6, column: 5, scope: !7)
!23 = !DILocation(line: 8, column: 5, scope: !7)
!24 = !DILocation(line: 8, column: 9, scope: !7)
!25 = !{!26, !26, i64 0}
!26 = !{!"int", !27, i64 0}
!27 = !{!"omnipotent char", !28, i64 0}
!28 = !{!"Simple C++ TBAA"}
!29 = !DILocation(line: 9, column: 5, scope: !7)
!30 = !DILocation(line: 9, column: 9, scope: !7)
!31 = !DILocation(line: 11, column: 5, scope: !7)
!32 = !DILocation(line: 11, column: 12, scope: !7)
!33 = !DILocation(line: 11, column: 18, scope: !7)
!34 = !DILocation(line: 12, column: 17, scope: !18)
!35 = !DILocation(line: 12, column: 9, scope: !18)
!36 = !DILocation(line: 14, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !17, file: !1, line: 14, column: 21)
!38 = !DILocation(line: 14, column: 27, scope: !37)
!39 = !DILocation(line: 14, column: 31, scope: !37)
!40 = !DILocation(line: 14, column: 34, scope: !37)
!41 = !DILocation(line: 14, column: 40, scope: !37)
!42 = !DILocation(line: 14, column: 21, scope: !17)
!43 = !DILocation(line: 15, column: 27, scope: !44)
!44 = distinct !DILexicalBlock(scope: !37, file: !1, line: 14, column: 47)
!45 = !DILocation(line: 16, column: 17, scope: !44)
!46 = !DILocation(line: 16, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !37, file: !1, line: 16, column: 28)
!48 = !DILocation(line: 16, column: 34, scope: !47)
!49 = !DILocation(line: 16, column: 28, scope: !37)
!50 = !DILocation(line: 17, column: 27, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 16, column: 40)
!52 = !DILocation(line: 18, column: 17, scope: !51)
!53 = !DILocation(line: 19, column: 27, scope: !54)
!54 = distinct !DILexicalBlock(scope: !47, file: !1, line: 18, column: 24)
!55 = !DILocation(line: 21, column: 17, scope: !17)
!56 = !DILocation(line: 24, column: 22, scope: !16)
!57 = !DILocation(line: 24, column: 26, scope: !16)
!58 = !DILocation(line: 24, column: 33, scope: !59)
!59 = distinct !DILexicalBlock(scope: !16, file: !1, line: 24, column: 17)
!60 = !DILocation(line: 24, column: 37, scope: !59)
!61 = !DILocation(line: 24, column: 35, scope: !59)
!62 = !DILocation(line: 24, column: 17, scope: !16)
!63 = !DILocation(line: 24, column: 17, scope: !59)
!64 = !DILocation(line: 25, column: 31, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !1, line: 24, column: 49)
!66 = !DILocation(line: 25, column: 28, scope: !65)
!67 = !DILocation(line: 26, column: 17, scope: !65)
!68 = !DILocation(line: 24, column: 45, scope: !59)
!69 = distinct !{!69, !62, !70, !71, !72}
!70 = !DILocation(line: 26, column: 17, scope: !16)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !{!"llvm.loop.unroll.disable"}
!73 = !DILocation(line: 27, column: 23, scope: !17)
!74 = !DILocation(line: 28, column: 17, scope: !17)
!75 = !DILocation(line: 31, column: 17, scope: !17)
!76 = !DILocation(line: 31, column: 24, scope: !17)
!77 = !DILocation(line: 31, column: 30, scope: !17)
!78 = !DILocation(line: 32, column: 31, scope: !79)
!79 = distinct !DILexicalBlock(scope: !17, file: !1, line: 31, column: 36)
!80 = !DILocation(line: 32, column: 28, scope: !79)
!81 = !DILocation(line: 33, column: 26, scope: !79)
!82 = distinct !{!82, !75, !83, !71, !72}
!83 = !DILocation(line: 34, column: 17, scope: !17)
!84 = !DILocation(line: 35, column: 23, scope: !17)
!85 = !DILocation(line: 36, column: 17, scope: !17)
!86 = !DILocation(line: 39, column: 23, scope: !17)
!87 = !DILocation(line: 40, column: 17, scope: !17)
!88 = distinct !{!88, !31, !89, !71, !72}
!89 = !DILocation(line: 42, column: 5, scope: !7)
!90 = !DILocation(line: 44, column: 28, scope: !7)
!91 = !DILocation(line: 44, column: 5, scope: !7)
!92 = !DILocation(line: 46, column: 1, scope: !7)
!93 = !DILocation(line: 45, column: 5, scope: !7)
