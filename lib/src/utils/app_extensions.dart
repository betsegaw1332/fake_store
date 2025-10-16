import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension DoubleExt on double {
  SizedBox get heightSpace => SizedBox(height: h);

  SizedBox get widthSpace => SizedBox(width: w);
}


extension StringNullExt on String? {
  String get toNonNull => this ?? '';

  bool get isEmptyFromNull => toNonNull.isEmpty;

  bool get isNotEmptyFromNull => toNonNull.isNotEmpty;
}