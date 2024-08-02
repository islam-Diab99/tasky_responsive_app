import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/Core/assets_manager.dart';
import 'package:tasky/Core/constatnts.dart';
import 'package:tasky/Core/helpers/extensions.dart';
import 'package:tasky/Core/helpers/shared_pref_helper.dart';
import 'package:tasky/Core/helpers/spacing.dart';
import 'package:tasky/Core/routing/routes.dart';
import 'package:tasky/Core/theming/styles.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
    required this.mounted,
  });

  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(20),
        Text(
          AppConstants.logo,
          style: TextStyles.font24BlackBold,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.profile);
          },
          child: SvgPicture.asset(IconsManager.profileIcon),
        ),
        horizontalSpace(10),
        GestureDetector(
            onTap: () async {
              await SharedPrefHelper.clearAllSecuredData();
              

              if (mounted) {
                context.pushNamedAndRemoveUntil(
                  Routes.loginScreen,
                  predicate: (Route<dynamic> route) {
                    return false;
                  },
                );
              }
            },
            child: SvgPicture.asset(IconsManager.exitIcon)),
        horizontalSpace(20),
      ],
    );
  }
}