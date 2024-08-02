import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QRCodeWidget extends StatelessWidget {
  const QRCodeWidget({
    super.key,
    required this.taskId,
  });

  final String  taskId;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: SizedBox(
          height: 300.h,
          width: 300.w,
          child: PrettyQrView.data(
            data: taskId,
          ),
        ),
      ),
    );
  }
}