import 'package:amrtmm_project/app/auth/presentation/blocs/auth_bloc.dart';
import 'package:amrtmm_project/core/config/routes/routes_constants.dart';
import 'package:amrtmm_project/core/enums/status.dart';
import 'package:amrtmm_project/core/utils/functions/app_functions.dart';
import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/components/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/utils/res/logo.dart';

class OtpScreen extends StatefulWidget {
  final String otp;
  const OtpScreen({super.key, required this.otp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final controller = TextEditingController();

  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    // Add a listener to keep track of focus changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus(); // Set focus on widget initialization
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OTPSuccessState) {
            context.replaceNamed(RoutesNameConstants.homeScreen);
            showToast(msg: "Verification Successfull");
            return;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(
                  context,
                ),
                Gap(height * 0.02),
                Text(
                  'Enter the OTP sent to your email address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text("Your OTP is: ${widget.otp}"),
                Gap(height * 0.02),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Pinput(
                      focusNode: focusNode,
                      controller: controller,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9]')),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // validator: (value) {
                      //   return value == state.serverOTP ? null : "Pin is incorrect";
                      // },
                      onCompleted: (value) {
                        // if (value != state.signupModel?.otp.toString()) {
                        //   showToast(msg: "OTP is incorrect");
                        //   return;
                        // }

                        context.read<AuthBloc>().add(VerifyOTPEvent(
                            accessToken: state.signupModel?.accessToken ?? "",
                            otp: state.signupModel?.accessToken ?? ""));
                      },
                      // onSubmitted: (value) {
                      //   if (value != state.signupModel?.otp.toString()) {
                      //     showToast(msg: "OTP is incorrect");
                      //     return;
                      //   }

                      //   context.read<AuthBloc>().add(VerifyOTPEvent(
                      //       accessToken: state.signupModel?.accessToken ?? "",
                      //       otp: state.signupModel?.accessToken ?? ""));
                      // },
                      length: 5,
                      defaultPinTheme: PinTheme(
                        width: width * 0.13,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                          color: AppColors.button.withValues(alpha: 0.1),
                          shape: BoxShape.rectangle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    );
                  },
                ),
                Gap(height * 0.02),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isOTPVerified == Status.loading,
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          context.read<AuthBloc>().add(VerifyOTPEvent(
                              accessToken: state.signupModel?.accessToken ?? "",
                              otp: controller.text));
                        }
                      },
                      buttonText: "Submit",
                      color: AppColors.button,
                      width: width,
                    );
                  },
                ),
                Gap(height * 0.02),
                Text.rich(
                  TextSpan(
                      text: "Didn't receive the code? ",
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "Resend",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ]),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
