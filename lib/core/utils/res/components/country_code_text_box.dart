import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:flutter/material.dart';

class CountryCodeTextBox extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final bool isPassword;
  final Widget? prefix;
  final double width;
  final TextEditingController controller;
  final Function(String? value) selectCountryCode;
  final String? Function(String? value) validator;

  CountryCodeTextBox({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.isPassword,
    this.prefix,
    required this.width,
    required this.controller,
    required this.selectCountryCode,
    required this.validator,
  });

  final String selectedCode = 'CODE';

  final List<String> countryCodes = ['CODE', '+1', '+44', '+91', '+81', "+92"];
  // Add your country codes
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.textbox,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (prefix != null)
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xffD8D8D8),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: prefix is Icon
                  ? Icon(
                      (prefix as Icon).icon,
                      color: Colors.black87,
                    )
                  : prefix,
            ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: width * 0.17,
            child: DropdownButtonFormField<String>(
              value: selectedCode,
              onChanged: selectCountryCode,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              items: countryCodes.map((String code) {
                return DropdownMenuItem<String>(
                  value: code,
                  child: Text(code,
                      style: const TextStyle(
                          fontSize: 13, color: AppColors.fontColor)),
                );
              }).toList(),
            ),
          ),
          const Text('|',
              style: TextStyle(fontSize: 26, color: AppColors.fontColor)),
          Expanded(
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
                    width: 0.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: const BorderSide(
                    color: AppColors.textbox,
                    width: 0.6,
                  ),
                ),
                contentPadding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: AppColors.fontColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
