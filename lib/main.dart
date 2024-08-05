import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/Core/di/dependency_injection.dart';
import 'package:tasky/Core/helpers/bloc_observer.dart';
import 'package:tasky/Core/helpers/constants.dart';
import 'package:tasky/Core/helpers/shared_pref_helper.dart';
import 'package:tasky/Core/routing/app_router.dart';
import 'package:tasky/tasky_app.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await getUserAuthStatus();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => TaskyApp(
      appRouter: AppRouter(),
    ),
  ));
}

getUserAuthStatus() async {
  var accesstoken;
  accesstoken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);
  accesstoken.toString().isEmpty
      ? isloggedInUser = false
      : isloggedInUser = true;
}
