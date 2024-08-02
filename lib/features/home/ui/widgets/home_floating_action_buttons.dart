import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/Core/assets_manager.dart';
import 'package:tasky/Core/helpers/extensions.dart';
import 'package:tasky/Core/routing/app_router.dart';
import 'package:tasky/Core/routing/routes.dart';
import 'package:tasky/Core/theming/colors.dart';

class AddTaskFloatingActionButton extends StatelessWidget {
  const AddTaskFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      width: 65.w,
      child: FloatingActionButton(
        heroTag: 'fab2',
        onPressed: () {
          context.pushNamed(Routes.addEditTodoScreen,
              arguments: AddEditTaskScreenArgs(isEdit: false));
        },
        backgroundColor: ColorsManager.mainColor,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: 30.h,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BarcodeFloatingActionButton extends StatelessWidget {
  const BarcodeFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'fab1',
      onPressed: () {
        Navigator.pushNamed(context, Routes.barcodeScanner);
      },
      backgroundColor: Colors.white,
      shape: const CircleBorder(),
      child: SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset(IconsManager.barCodeIcon)),
    );
  }
}
