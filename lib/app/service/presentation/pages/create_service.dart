import 'dart:developer';

import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';
import 'package:amrtmm_project/app/service/presentation/blocs/service_bloc/service_bloc.dart';
import 'package:amrtmm_project/core/enums/status.dart';
import 'package:amrtmm_project/core/utils/functions/app_functions.dart';
import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/components/TextField.dart';
import 'package:amrtmm_project/core/utils/res/components/custom_button.dart';
import 'package:amrtmm_project/core/utils/res/styles.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/gen/assets.gen.dart';

class CreateService extends StatefulWidget {
  const CreateService({
    super.key,
  });

  @override
  State<CreateService> createState() => _CreateServiceState();
}

class _CreateServiceState extends State<CreateService> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();

  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final descrpController = TextEditingController();
  final resultController = TextEditingController();
  final budgetController = TextEditingController();

  @override
  void initState() {
    context.read<ServiceBloc>().add(FetchSkillsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        // endDrawer: const MainDrawer(),
        body: BlocConsumer<ServiceBloc, ServiceState>(
      listener: (context, state) async {
        if (state is CreateTaskSuccessState) {
          showToast(msg: "Service Created Successfully");
          titleController.clear();
          descrpController.clear();
          resultController.clear();
          locationController.clear();
          budgetController.clear();
          dateController.clear();
        }
        if (state is OpenDateAndTimeDialogState) {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );

          if (pickedDate != null) {
            TimeOfDay? pickedTime = await showTimePicker(
                // ignore: use_build_context_synchronously
                context: context,
                initialTime: TimeOfDay.fromDateTime(pickedDate));

            if (pickedTime != null) {
              final selectedDateTime = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
                pickedTime.hour,
                pickedTime.minute,
              );

              dateController.text = selectedDateTime.toString();
            }
          }
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Card(
              elevation: 5,
              shadowColor: const Color(0xffABB0B8),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffFFFFFF)),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: width * 0.94,
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  spacing: 5,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      'Create a Temployment',
                      style: TextStyle(
                          color: AppColors.button,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Please Enter Require Details Below',
                      style: TextStyle(
                          color: AppColors.button,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    const Gap(5.0),
                    Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: width * 0.3,
                                height: height * 0.14,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(height * 0.1)),
                                    image: state.file != null
                                        ? DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(state.file!))
                                        : DecorationImage(
                                            scale: 10,
                                            image: AssetImage(
                                              Assets.images.profile.path,
                                            ))),
                              ),
                              Positioned(
                                bottom: -10,
                                right: -3,
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ServiceBloc>()
                                          .add(SelectUserImageEvent());
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.red,
                                    )),
                              )
                            ],
                          ),
                          const Gap(20),
                          CustomTextField(
                              hintText: 'Title',
                              inputType: TextInputType.text,
                              width: width * 0.9,
                              controller: titleController),
                          const SizedBox(
                            height: 5,
                          ),
                          BlocBuilder<ServiceBloc, ServiceState>(
                            builder: (context, state) {
                              return SizedBox(
                                height: 40,
                                child: state.status == Status.loading
                                    ? const Center(
                                        child:
                                            CircularProgressIndicator.adaptive(
                                          valueColor: AlwaysStoppedAnimation(
                                              AppColors.button),
                                        ),
                                      )
                                    : CustomDropdown<SkillEntity>.multiSelect(
                                        initialItems: state.selectedSkills,
                                        hintBuilder: (context, hint, enabled) {
                                          // Display names of selected items in the header
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                              hint,
                                              style: AppTextStyles
                                                  .dropDownHintStyle,
                                            ),
                                          );
                                        },
                                        closedHeaderPadding: const EdgeInsets
                                            .all(10.0),
                                        listItemBuilder: (context, value,
                                            isSelected, onTap) {
                                          return ListTile(
                                            title: Text(
                                              value.skillEn,
                                              style: AppTextStyles
                                                  .dropDownTextStyle,
                                            ),
                                            onTap: onTap,
                                            selected: isSelected,
                                          );
                                        },
                                        headerListBuilder: (context,
                                            selectedItems, enabled) {
                                          String selectedSkills = selectedItems
                                              .map((item) => item.skillEn)
                                              .join(', ');
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                                selectedSkills.isNotEmpty
                                                    ? selectedSkills
                                                    : "Select Skills",
                                                style: AppTextStyles
                                                    .dropDownTextStyle),
                                          );
                                        },
                                        decoration:
                                            const CustomDropdownDecoration(
                                                closedBorderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(0)),
                                                closedFillColor:
                                                    AppColors.textbox,
                                                expandedFillColor:
                                                    AppColors.textbox,
                                                hintStyle: AppTextStyles
                                                    .dropDownHintStyle),
                                        hintText: "Skills required",
                                        items: state.skills,
                                        onListChanged: (itemList) {
                                          if (itemList.isNotEmpty) {
                                            context.read<ServiceBloc>().add(
                                                SelectSkillsEvent(
                                                    skills: itemList));
                                          }
                                        }),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              log("Clicked");
                              context
                                  .read<ServiceBloc>()
                                  .add(OpenDateAndTimeDialogEvent());
                            },
                            child: CustomTextField(
                                isEnable: false,
                                isReadOnly: true,
                                hintText: 'Date & Time',
                                inputType: TextInputType.text,
                                width: width * 0.9,
                                controller: dateController),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              hintText: 'Location',
                              inputType: TextInputType.text,
                              width: width * 0.9,
                              controller: locationController),
                          const Gap(10),
                          CustomDropdown(
                            initialItem: state.serviceTypes
                                    .contains(state.selectedServiceType)
                                ? state.selectedServiceType
                                : null,
                            hintText: "Select Service Type",
                            items: state.serviceTypes
                                .map((entry) => entry)
                                .toList(),
                            closedHeaderPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            onChanged: (value) {
                              if (value != null) {
                                context.read<ServiceBloc>().add(
                                    SelectServiceTypeEvent(serviceType: value));
                              }
                            },
                            decoration: CustomDropdownDecoration(
                                headerStyle: AppTextStyles.dropDownTextStyle,
                                closedBorderRadius: BorderRadius.circular(0),
                                expandedFillColor: AppColors.textbox,
                                hintStyle: AppTextStyles.dropDownHintStyle,
                                closedFillColor: AppColors.textbox),
                          ),
                          const Gap(10),
                          CustomTextField(
                              hintText: 'My Budget (AED)',
                              inputType: TextInputType.number,
                              width: width * 0.9,
                              controller: budgetController),
                          const Gap(10),
                          SizedBox(
                            height: 130,
                            child: Container(
                              color: AppColors.textbox, // Set background color
                              child: CustomTextField(
                                hintText: 'Description',
                                inputType: TextInputType.multiline,
                                width: width * 0.9,
                                controller: descrpController,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 90,
                            child: Container(
                                color:
                                    AppColors.textbox, // Set background color
                                child: CustomTextField(
                                    hintText:
                                        'Describe your result expectations here...',
                                    inputType: TextInputType.multiline,
                                    width: width * 0.9,
                                    controller: resultController)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            isLoading: state.serviceStatus == Status.loading,
                            onPressed: () async {
                              final title = titleController.text;
                              final budget = budgetController.text;
                              final descrp = descrpController.text;
                              final result = resultController.text;
                              final location = locationController.text;
                              final date = dateController.text;
                              final value =
                                  _formkey.currentState?.validate() ?? false;
                              if (!value) {
                                return;
                              }
                              if (state.selectedServiceType.isEmpty) {
                                showToast(msg: "Service type is required.");
                                return;
                              }
                              if (state.selectedSkills.isEmpty) {
                                showToast(msg: "Select ateast one skill.");
                                return;
                              }

                              context.read<ServiceBloc>().add(
                                  CheckSubscriptionEvent(
                                      title: title,
                                      description: descrp,
                                      dateTime: date,
                                      location: location,
                                      budget: budget,
                                      result: result));
                            },
                            width: width,
                            buttonText: 'SUBMIT',
                            color: AppColors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
