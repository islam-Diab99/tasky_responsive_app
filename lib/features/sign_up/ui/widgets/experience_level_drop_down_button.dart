import 'package:flutter/material.dart';
import 'package:tasky/Core/constatnts.dart';
import 'package:tasky/Core/helpers/enums.dart';
import 'package:tasky/Core/helpers/extensions.dart';
import 'package:tasky/Core/widgets/custom_input_decoration.dart';

class ExperienceLevelDropButton extends StatelessWidget {
  const ExperienceLevelDropButton(
      {super.key, required this.experiencelevelController});
  final TextEditingController experiencelevelController;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) {
        if (value.isNullOrEmpty()) {
          return 'Please choose experience Level';
        }
      },
      elevation: 0,

      decoration: customInputDecoration(AppConstants.chooseExperienceLevel),
      items: getDropdownItems(),
      onChanged: (value) {
        experiencelevelController.text = experienceLevelMapping[value]!;
      },
    );
  }
  List<DropdownMenuItem<String>> getDropdownItems() {
    return experienceLevelsDisplay.map((String level) {
      return DropdownMenuItem<String>(
        value: level,
        child: Text(level),
      );
    }).toList();
  }
}
