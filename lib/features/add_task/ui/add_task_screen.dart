import 'package:flutter/material.dart';
import 'package:tasky/Core/routing/app_router.dart';
import 'package:tasky/Core/widgets/custom_app_bar.dart';
import 'package:tasky/features/add_task/ui/widgets/add_img_button.dart';
import 'package:tasky/features/add_task/ui/widgets/add_task_bloc_listener.dart';
import 'package:tasky/features/add_task/ui/widgets/add_task_form.dart';

class AddEditTaskScrreen extends StatelessWidget {
  const AddEditTaskScrreen(
    this.addEditTaskScreenArgs, {
    super.key,
  });
  final AddEditTaskScreenArgs? addEditTaskScreenArgs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                    screenTitle: addEditTaskScreenArgs!.isEdit
                        ? 'Update task'
                        : 'Add New Task'),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth >= 1000 ? 300 : 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AddImgButton(),
                          AddTaskForm(addEditTaskScreenArgs: addEditTaskScreenArgs,),
                        ],
                      ),
                    );
                  },
                ),
                AddEditTaskBlocListener(
                  taskId: addEditTaskScreenArgs?.id??''
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
