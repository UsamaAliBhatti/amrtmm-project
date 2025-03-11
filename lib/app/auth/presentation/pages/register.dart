import 'dart:developer';

import 'package:amrtmm_project/app/auth/presentation/blocs/auth_bloc.dart';
import 'package:amrtmm_project/app/auth/presentation/pages/login_screen.dart';
import 'package:amrtmm_project/core/config/routes/routes_constants.dart';
import 'package:amrtmm_project/core/enums/status.dart';
import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/components/custom_button.dart';
import 'package:amrtmm_project/core/utils/res/components/custom_outline_text_box.dart';
import 'package:amrtmm_project/core/utils/res/logo.dart';
import 'package:amrtmm_project/core/utils/validators/validators.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/functions/app_functions.dart';
import '../../../../core/utils/res/components/TextField.dart';
import '../../../../core/utils/res/components/country_code_text_box.dart';
import '../../../service/domain/entities/skill_entity.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final namecontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  final phnocontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final confirmPasscontroller = TextEditingController();

  final descrpController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            showToast(msg: "Registered Successfully");
            log(state.otp.toString(), name: "OTP IN REGISTER");
            context.pushNamed(RoutesNameConstants.otpScreen,
                extra: {"otp": state.otp});
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                children: [
                  logo(context),
                  ElevatedButton(
                    onPressed: () {},
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
                          style:
                              TextStyle(color: AppColors.button, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: const Divider(
                            color: AppColors.border,
                            height: 36,
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
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: const Divider(
                            color: AppColors.border,
                            height: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          CustomOutlinedTextBox(
                            hintText: 'Full Name',
                            inputType: TextInputType.text,
                            isPassword: false,
                            width: width * 0.9,
                            controller: namecontroller,
                            validator: (value) {
                              return nameValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomOutlinedTextBox(
                            hintText: 'Email address',
                            inputType: TextInputType.emailAddress,
                            isPassword: false,
                            width: width * 0.9,
                            controller: emailcontroller,
                            validator: (value) {
                              return emailValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CountryCodeTextBox(
                            hintText: 'Mobile number',
                            inputType: TextInputType.phone,
                            isPassword: false,
                            width: width * 0.9,
                            controller: phnocontroller,
                            selectCountryCode: (value) {
                              log("COUNTRY CODE: $value");
                              context.read<AuthBloc>().add(
                                  SelectCountryCodeEvent(
                                      countryCode: value ?? "+92"));
                            },
                            validator: (value) {
                              return phoneValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomOutlinedTextBox(
                            hintText: 'Password',
                            inputType: TextInputType.text,
                            isPassword: true,
                            width: width * 0.9,
                            controller: passwordcontroller,
                            validator: (value) {
                              return passwordValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomOutlinedTextBox(
                            hintText: 'Confirm Password',
                            inputType: TextInputType.text,
                            isPassword: true,
                            width: width * 0.9,
                            controller: confirmPasscontroller,
                            validator: (value) {
                              return conformPasswordValidator(
                                  passwordcontroller.text, value);
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return SizedBox(
                                width: width,
                                height: 50,
                                child: state.isSkillsLoaded == Status.loading
                                    ? const Center(
                                        child:
                                            CircularProgressIndicator.adaptive(
                                          valueColor: AlwaysStoppedAnimation(
                                              AppColors.button),
                                        ),
                                      )
                                    : CustomDropdown<SkillEntity>.multiSelect(
                                        initialItems: const [],
                                        // hintBuilder: (context, hint, enabled) {
                                        //   // Display names of selected items in the header
                                        //   return Text(
                                        //     hint,
                                        //     style: const TextStyle(
                                        //         color: AppColors.fontColor,
                                        //         fontSize: 15,
                                        //         fontWeight: FontWeight.w500),
                                        //   );
                                        // },
                                        headerListBuilder:
                                            (context, selectedList, selected) {
                                          return SizedBox(
                                            width: width,
                                            height: 50,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Text(
                                                      "${selectedList[index].skillEn} ",
                                                      style: const TextStyle(
                                                        color:
                                                            AppColors.fontColor,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                itemCount: selectedList.length),
                                          );
                                        },
                                        closedHeaderPadding:
                                            const EdgeInsets.all(15.0),
                                        listItemBuilder: (context, value,
                                            isSelected, onTap) {
                                          return ListTile(
                                            title: Text(value.skillEn),
                                            onTap: onTap,
                                            selected: isSelected,
                                          );
                                        },
                                        decoration:
                                            const CustomDropdownDecoration(
                                          closedBorderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          closedFillColor: AppColors.textbox,
                                          expandedFillColor: AppColors.textbox,
                                          hintStyle: TextStyle(
                                              color: AppColors.fontColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        hintText: "Select Skills",
                                        items: state.skillsList,
                                        onListChanged: (itemList) {
                                          context.read<AuthBloc>().add(
                                              UpdateSelectedSkillsEvent(
                                                  selectedSkills: itemList));
                                        }),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 130,
                            child: // Set background color
                                CustomTextField(
                              maxLine: 6,
                              hintText: 'Write Something about yourself',
                              inputType: TextInputType.multiline,
                              width: width * 0.9,
                              controller: descrpController,
                              borderRadius: 20,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return Checkbox(
                                    value: state.isPrivacyPoilcyCheck,
                                    activeColor: state.isPrivacyPoilcyCheck
                                        ? AppColors.button
                                        : null,
                                    onChanged: (value) {
                                      context
                                          .read<AuthBloc>()
                                          .add(CheckPrivacyPolicyEvent());
                                    },
                                  );
                                },
                              ),
                              Expanded(
                                child: RichText(
                                  text: const TextSpan(
                                    text:
                                        'By checking this box, you confirm that you have read, and agree to our ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Terms and Conditions',
                                        style: TextStyle(
                                          color: Colors
                                              .black, // Change color to your desired color
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                          color: Colors
                                              .black, // Change color to your desired color
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state.isSignedUp == Status.loading,
                        width: width,
                        color: AppColors.button,
                        onPressed: () async {
                          if (state.selectedSkills.isEmpty) {
                            showToast(
                              msg: 'Please select at least one skill',
                            );
                            return;
                          }
                          // log(state.dialCode);
                          if (state.dialCode.isEmpty) {
                            showToast(
                              msg: 'Select dial code',
                            );
                            return;
                          }
                          if (!state.isPrivacyPoilcyCheck) {
                            showToast(
                              msg:
                                  'Please read and check Privacy Policy and Terms & Conditions first',
                            );
                            return;
                          }
                          final isValid = _formkey.currentState!.validate();
                          if (!isValid) return;
                          final name = namecontroller.text;
                          final email = emailcontroller.text;
                          final phone = phnocontroller.text;
                          final password = passwordcontroller.text;
                          final aboutMe = descrpController.text;
                          context.read<AuthBloc>().add(RegisterUserEvent(
                              name: name,
                              email: email,
                              dialCode: state.dialCode,
                              phone: phone,
                              password: password,
                              skills: "skills",
                              aboutMe: aboutMe));
                          /*   Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const NavBar()),
                                      ); */
                          // context.pushNamed(RoutesNameConstants.homeScreen);
                        },
                        buttonText: 'Register',
                      );
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Already have account?',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: AppColors.fontColor)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    color: Colors.black,
                    width: width,
                    onPressed: () {},
                    buttonText: 'Sign In with UAE pass',
                    buttonIcon: const Icon(
                      Icons.fingerprint,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
