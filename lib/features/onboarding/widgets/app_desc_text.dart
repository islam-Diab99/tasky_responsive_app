import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/Core/constatnts.dart';
import 'package:tasky/Core/helpers/spacing.dart';
import 'package:tasky/Core/theming/styles.dart';
import 'package:tasky/features/onboarding/widgets/get_started_button.dart';

class AppDescriptionTextAndStartButton extends StatelessWidget {
  const AppDescriptionTextAndStartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(
                width: screenWidth * .6,
                child: Text(
                  AppConstants.taskManagementTitle,
                  style: TextStyles.font24BlackBold,
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(16),
              SizedBox(
                width: screenWidth * .8,
                child: Text(
                  AppConstants.taskManagementDescription,
                  style: TextStyles.font14GreyRegular.copyWith(
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                  textHeightBehavior:
                      const TextHeightBehavior(applyHeightToLastDescent: true),
                ),
              ),
              verticalSpace(16),
              const GetStartedButton(),
            ],
          ),
        )
      ],
    );
  }
}
