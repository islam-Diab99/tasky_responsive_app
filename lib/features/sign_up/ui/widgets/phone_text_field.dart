import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasky/Core/theming/font_weight_helper.dart';
import 'package:tasky/Core/theming/styles.dart';
import 'package:tasky/Core/widgets/custom_input_decoration.dart';
import 'package:tasky/core/theming/colors.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    required this.phoneController,
    this.validator,
    this.onChanged,
  });

  final TextEditingController phoneController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  String _selectedCountryCode = '20';

  String _selectedCountryFlag = 'eg'; 

  void _updatePhoneNumber(String phoneNumber) {
    final fullPhoneNumber = '+$_selectedCountryCode$phoneNumber';
    widget.onChanged?.call(fullPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: TextFormField(
        controller: widget.phoneController,
        decoration: customInputDecoration('123 456-7890').copyWith(
          prefixIcon: GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: (country) {
                  setState(() {
                    _selectedCountryCode = country.phoneCode;
                    _selectedCountryFlag = country.countryCode;

                    _updatePhoneNumber(widget.phoneController.text);
                  });
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CountryFlag.fromCountryCode(
                      shape:  RoundedRectangle(7.r),
                      height: 24,
                      width: 24,
                      _selectedCountryFlag.toLowerCase()),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '+$_selectedCountryCode',
                    style: TextStyles.font14GrayRegular
                        .copyWith(fontWeight: FontWeightHelper.bold),
                  ),
                  Icon(
                    MdiIcons.chevronDown,
                    size: 25,
                    color: ColorsManager.textDarkGrey,
                  ),
                ],
              ),
            ),
          ),
        ),
        keyboardType: TextInputType.phone,
         validator: (phone) {
                  if (phone == null || phone.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  else if(phone.length<5)
                  {
                     return 'phone number should be more than 5 numbers';
                  }
                  return null;
                },
        onChanged: (value) {
          _updatePhoneNumber(value);
        },
      ),
    );
  }
}
