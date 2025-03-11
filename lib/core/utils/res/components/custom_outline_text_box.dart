import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedTextBox extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final bool isPassword;
  final Widget? prefix;
  final double width;
  final TextEditingController controller;
  final String? Function(String? value) validator;
  const CustomOutlinedTextBox({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.isPassword,
    this.prefix,
    required this.width,
    required this.controller,
    required this.validator,
  });

  final String selectedCode = 'CODE';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.next,
        keyboardType: inputType,
        obscuringCharacter: '*',
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textbox,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(
              color: AppColors.textbox,
              width: 0.6,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(
              color: AppColors.textbox,
              width: 0.5,
            ),
          ),
          contentPadding: const EdgeInsets.only(
            left: 18.0,
            right: 18.0,
          ),
          alignLabelWithHint: true, // Center align the hint text
          prefixIcon: prefix == null
              ? null
              : Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffD8D8D8),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: prefix,
                ),
          prefixStyle: const TextStyle(
            color: AppColors.fontColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.fontColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
