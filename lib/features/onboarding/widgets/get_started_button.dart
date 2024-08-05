import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/Core/assets_manager.dart';
import 'package:tasky/Core/constatnts.dart';
import 'package:tasky/Core/helpers/extensions.dart';
import 'package:tasky/Core/helpers/spacing.dart';
import 'package:tasky/Core/theming/colors.dart';
import 'package:tasky/Core/theming/styles.dart';

import 'package:tasky/core/routing/routes.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331.w,
      child: TextButton(
        onPressed: () {
          context.pushReplacementNamed(Routes.signUpScreen);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorsManager.mainColor),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(
            Size(double.infinity, 49.h),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppConstants.letsStart,
              style: TextStyles.font19WhiteBold,
            ),
            horizontalSpace(8),
            SvgPicture.asset(
              IconsManager.arrowLeftLight,
              width: 14.w,
              height: 14.h,
            )
          ],
        ),
      ),
    );
  }
}
