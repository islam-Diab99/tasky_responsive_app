import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasky/Core/helpers/extensions.dart';
import 'package:tasky/Core/helpers/utils_functions.dart';

import 'package:tasky/Core/routing/app_router.dart';
import 'package:tasky/Core/theming/styles.dart';
import 'package:tasky/Core/widgets/my_custom_chashed_networrk_image.dart';
import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/features/home/data/models/todo_response.dart';

class TaskListTile extends StatelessWidget {
  final TodoResponse task;

  const TaskListTile({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: GestureDetector(
        onTap: () => context.pushNamed(Routes.taskDetails,
            arguments: TaskDetailsScreenArgs(
                taskImage: task.image!,
                taskTitle: task.title!,
                id: task.id!,
                taskDesc: task.desc!,
                priority: task.priority!,
                status: task.status!)),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: MyCustomCahedNetworkImage(
                    fit: BoxFit.contain,
                    height: 64.h,
                    width: 64.w,
                    taskImage: task.image!,
                  )),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            task.title!,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: getRightStatusContainerColor(task.status!),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(task.status!,
                              style: TextStyles.font12RedMedium.copyWith(
                                  color:
                                      getRightStatusTextColor(task.status!))),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      task.desc!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          getRightFlagImage(task.priority!.toLowerCase()),
                          height: 16.h,
                          width: 16.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(task.priority!,
                            style: TextStyles.font12MainPurpleMedium.copyWith(
                                fontSize: 14.sp,
                                color:
                                    getRightPriorityTextColor(task.priority!))),
                        const Spacer(),
                        Text(convertTimestampToDate(task.createdAt!),
                            style: TextStyles.font12GrayRegular),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 25.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
