import 'dart:io';

import 'package:amrtmm_project/app/other/presentation/blocs/contact_us_bloc.dart';
import 'package:amrtmm_project/core/utils/extensions/utils.dart';
import 'package:amrtmm_project/core/utils/functions/app_functions.dart';
import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/components/TextField.dart';
import 'package:amrtmm_project/core/utils/res/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/enums/status.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final subjectController = TextEditingController();
    final detailsController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            context.pop(context);
          },
        ),
        title: Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: height * 0.024,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.button,
      ),
      body: BlocConsumer<ContactUsBloc, ContactUsState>(
        listener: (context, state) {
          if (state is SuccessSubmissionState) {
            showToast(msg: "Your query submitted successfully");
            nameController.clear();
            emailController.clear();
            phoneController.clear();
            subjectController.clear();
            detailsController.clear();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(height * 0.01),
                state.status == Status.error
                    ? Text(
                        state.contactUs?.data?.message ?? "Error Here",
                        style: const TextStyle(color: Colors.black),
                      )
                    : state.status == Status.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child: HtmlWidget(
                              state.contactUs?.data?.data.descEn ?? "",
                              textStyle: TextStyle(fontSize: height * 0.016),
                            ),
                          ),
                Gap(height * 0.02),
                const Text(
                  "Get in touch with us",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.button,
                  ),
                ),
                Gap(height * 0.02),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.border,
                        width: 1,
                      )),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty) return "Field is required";

                              return null;
                            },
                            height: height * 0.06,
                            hintText: 'Name',
                            borderRadius: 10,
                            fillColor: Colors.white,
                            inputType: TextInputType.name,
                            width: width,
                            controller: nameController),
                        Gap(height * 0.01),
                        CustomTextField(
                          height: height * 0.06,
                          hintText: 'Email',
                          borderRadius: 10,
                          fillColor: Colors.white,
                          inputType: TextInputType.emailAddress,
                          width: width,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) return "Field is required";
                            if (!value.isEmail) return "Enter valid emial";
                            return null;
                          },
                        ),
                        Gap(height * 0.01),
                        CustomTextField(
                          height: height * 0.06,
                          hintText: 'Phone',
                          borderRadius: 10,
                          fillColor: Colors.white,
                          inputType: TextInputType.phone,
                          width: width,
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) return "Field is required";
                            if (!value.isPhoneNumber) {
                              return "Enter valid phone number";
                            }

                            return null;
                          },
                        ),
                        Gap(height * 0.01),
                        CustomTextField(
                          height: height * 0.06,
                          hintText: 'Subject',
                          borderRadius: 10,
                          fillColor: Colors.white,
                          inputType: TextInputType.text,
                          width: width,
                          controller: subjectController,
                          validator: (value) {
                            if (value!.isEmpty) return "Field is required";

                            return null;
                          },
                        ),
                        Gap(height * 0.01),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Please enter your work details below',
                            style: TextStyle(fontSize: height * 0.016),
                          ),
                        ),
                        Gap(height * 0.015),
                        CustomTextField(
                          maxLine: 5,
                          height: height * 0.15,
                          hintText: 'Details',
                          borderRadius: 20,
                          fillColor: Colors.white,
                          inputType: TextInputType.name,
                          width: width,
                          controller: detailsController,
                          validator: (value) {
                            if (value!.isEmpty) return "Field is required";

                            return null;
                          },
                        ),
                        Gap(height * 0.015),
                        CustomButton(
                          isLoading:
                              state.querySubmissionState == Status.loading,
                          onPressed: () async {
                            final isValid = formKey.currentState!.validate();

                            if (isValid) {
                              final queryData = {
                                "full_name": nameController.text,
                                "email": emailController.text,
                                "number": phoneController.text,
                                "subject": subjectController.text,
                                "message": detailsController.text,
                              };

                              context.read<ContactUsBloc>().add(
                                    SubmitUserQueryEvent(
                                      queryData: queryData,
                                    ),
                                  );
                            }
                          },
                          buttonText: "Submit",
                          color: AppColors.button,
                          width: width,
                        )
                      ],
                    ),
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
