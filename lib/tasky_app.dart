import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/Core/di/dependency_injection.dart';
import 'package:tasky/Core/helpers/constants.dart';
import 'package:tasky/Core/routing/app_router.dart';
import 'package:tasky/Core/theming/colors.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/features/add_task/logic/add_edit_task_cubit.dart';
import 'package:tasky/features/home/logic/home_cubit.dart';
import 'package:tasky/features/login/logic/cubit/login_cubit.dart';
import 'package:tasky/features/profile/logic/profile_cubit.dart';
import 'package:tasky/features/sign_up/logic/sign_up_cubit.dart';

class TaskyApp extends StatelessWidget {
  final AppRouter appRouter;
  TaskyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    double designWidth =
        Platform.isWindows ? MediaQuery.of(context).size.width : 375;
    double designHeight =
        Platform.isWindows ? MediaQuery.of(context).size.height : 768;
    return ScreenUtilInit(
        designSize: Size(designWidth, designHeight),
        minTextAdapt: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>(
              create: (context) => getIt<LoginCubit>(),
            ),
            BlocProvider<SignupCubit>(
              create: (context) => getIt<SignupCubit>(),
            ),
            BlocProvider<HomeCubit>(
              create: (context) => getIt<HomeCubit>(),
            ),
            BlocProvider<AddEditTaskCubit>(
              create: (context) => getIt<AddEditTaskCubit>(),
            ),
            BlocProvider<ProfileCubit>(
              create: (context) => getIt<ProfileCubit>()
            ),
            // Add more providers if needed
          ],
          child: MaterialApp(
            title: 'Tasky',
            theme: ThemeData(
              fontFamily: 'DMSans',
              primaryColor: ColorsManager.mainColor,
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute:
                isloggedInUser ? Routes.homeScreen : Routes.onBoardingScreen,
            onGenerateRoute: appRouter.generateRoute,
          ),
        ));
  }
}
