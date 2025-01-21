import 'package:flutter/material.dart';
import 'package:news/utils/sized.dart';

extension Gap on num {
  SizedBox get hGap => SizedBox(
        height: SizeUtil.mediaQuery.size.height *
            (toDouble() / SizeUtil.baseHeight),
      );

  SizedBox get wGap => SizedBox(
        width:
            SizeUtil.mediaQuery.size.width * (toDouble() / SizeUtil.baseWidth),
      );

  double get h =>
      SizeUtil.mediaQuery.size.height * (toDouble() / SizeUtil.baseHeight);

  double get w =>
      SizeUtil.mediaQuery.size.width * (toDouble() / SizeUtil.baseWidth);
}
