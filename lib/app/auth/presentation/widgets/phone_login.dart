import 'dart:developer';

import 'package:amrtmm_project/core/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/routes/routes_constants.dart';
import '../../../../core/utils/res/appColors.dart';
import '../../../../core/utils/res/components/country_code_text_box.dart';
import '../../../../core/utils/res/components/custom_button.dart';
import '../../../../core/utils/res/components/custom_outline_text_box.dart';

class PhoneLogin extends StatelessWidget {
  const PhoneLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.022,
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 2),
              spreadRadius: 1,
              blurRadius: 5,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        CountryCodeTextBox(
          prefix: const Icon(Icons.phone_android),
          hintText: 'Mobile Number',
          inputType: TextInputType.phone,
          isPassword: false,
          width: width * 0.9,
          controller: TextEditingController(),
          selectCountryCode: (value) {
            log(value!);
          },
          validator: (value) {
            return phoneValidator(value);
          },
        ),
        Gap(
          height * 0.015,
        ),
        CustomOutlinedTextBox(
          prefix: const Icon(Icons.lock_outline),
          hintText: '  Password',
          inputType: TextInputType.text,
          isPassword: false,
          width: width * 0.9,
          controller: TextEditingController(),
          validator: (value) {
            return passwordValidator(value);
          },
        ),
        Gap(
          height * 0.01,
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.fontColor),
          ),
        ),
        Gap(
          height * 0.01,
        ),
        CustomButton(
            width: width,
            color: AppColors.button,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const NavBar()),
              // );
              context.pushNamed(RoutesNameConstants.homeScreen);
            },
            buttonText: 'Login'),
        Gap(
          height * 0.015,
        ),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(RoutesNameConstants.otpScreen);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(width, 50),
            backgroundColor: AppColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: const BorderSide(color: AppColors.border),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/google_logo.png',
                width: 35,
                height: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Continue With Google',
                style: TextStyle(color: AppColors.button, fontSize: 16),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Divider(
                  color: AppColors.border,
                  height: height * 0.036,
                ),
              ),
            ),
            const Text(
              'or ',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.border),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: AppColors.border,
                  height: height * 0.036,
                ),
              ),
            ),
          ],
        ),
        CustomButton(
          width: width,
          color: Colors.black,
          onPressed: () {},
          buttonText: 'Sign In with UAE pass',
          buttonIcon: const Icon(Icons.fingerprint, color: Colors.white),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Don't have an account?",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: AppColors.fontColor)),
            TextButton(
              onPressed: () {
                context.pushNamed(RoutesNameConstants.otpScreen);
              },
              child: const Text(
                'Signup',
                style: TextStyle(
                  color: AppColors.fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
