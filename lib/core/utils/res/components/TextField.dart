import 'package:flutter/material.dart';

import '../appColors.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType inputType;
  final double width;
  final TextEditingController controller;
  final String? hintText;
  final String? keyboardType;
  final double borderRadius;
  final int maxLine;
  final double height;
  final Color fillColor;
  final bool isEnable;
  final bool isReadOnly;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      this.keyboardType,
      this.hintText,
      required this.inputType,
      required this.width,
      required this.controller,
      this.borderRadius = 0.0,
      this.maxLine = 1,
      this.fillColor = AppColors.textbox,
      this.height = 40,
      this.isEnable = true,
      this.isReadOnly = false,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        style: const TextStyle(color: AppColors.black),
        // enabled: widget.isEnable,
        validator: widget.validator,
        maxLines: widget.maxLine,
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.next,
        keyboardType: widget.inputType,
        obscuringCharacter: '*',
        readOnly: widget.isReadOnly,
        decoration: InputDecoration(
          enabled: widget.isEnable,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(
              color: AppColors.textbox,
              width: 0.5,
            ),
          ),
          filled: true,
          fillColor: widget.fillColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(
              color: AppColors.textbox,
              width: 0.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(
              color: AppColors.textbox,
              width: 0.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(
              color: AppColors.textbox,
              width: 0.5,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: AppColors.fontColor,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
        ),
      ),
    );
  }
}
