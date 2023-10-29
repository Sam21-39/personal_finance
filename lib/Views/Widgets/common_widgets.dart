import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonWidgets {
  static customTextField(
    TextEditingController controller,
    String hint, {
    Widget? icon,
    bool? readOnly,
    bool? passWord,
    onTap,
  }) {
    return TextField(
      onTap: onTap,
      readOnly: readOnly ?? false,
      obscureText: passWord ?? false,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 8.sp),
        prefixIcon: icon,
      ),
    );
  }
}
