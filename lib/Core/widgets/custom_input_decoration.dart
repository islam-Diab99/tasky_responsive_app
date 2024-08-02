import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/Core/theming/colors.dart';
import 'package:tasky/Core/theming/styles.dart';

InputDecoration customInputDecoration(hintText) {
  return InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorsManager.mainColor,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(16.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorsManager.textgrey,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(16.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(16.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(16.0),
    ),
    hintStyle: TextStyles.font14LightGrayRegular,
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
  );
}