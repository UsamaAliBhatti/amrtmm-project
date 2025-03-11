import 'dart:io';

import 'package:amrtmm_project/app/profile/domain/entities/language_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/nationality_entity.dart';
import 'package:amrtmm_project/app/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';
import 'package:amrtmm_project/core/enums/status.dart';
import 'package:amrtmm_project/core/utils/extensions/utils.dart';
import 'package:amrtmm_project/core/utils/functions/app_functions.dart';
import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/components/TextField.dart';
import 'package:amrtmm_project/core/utils/res/components/custom_button.dart';
import 'package:amrtmm_project/core/utils/res/styles.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/res/components/main_drawer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phnoController = TextEditingController();
  final emiratesIDController = TextEditingController();
  final bankNameController = TextEditingController();
  final accountTitleController = TextEditingController();
  final accountNumberController = TextEditingController();
  final swiftNumberController = TextEditingController();
  final ibanNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        endDrawer: const MainDrawer(),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is UpdateSkillsSuccessState) {
              showToast(msg: "Skills updated successfully");
              context.pop();
              return;
            }
          },
          builder: (context, state) {
            if (state.profileLoading == Status.loading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state.profileLoading == Status.error) {
              return const Center(
                child: Text(
                  "Error while loading profile,",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              );
            }
            emailController.text = state.userProfile?.email ?? '';
            nameController.text = state.userProfile?.displayName ?? '';
            phnoController.text =
                "${state.userProfile?.dialCode}${state.userProfile?.mobile}";

            emiratesIDController.text = state.userProfile?.emiratesId ?? "";
            bankNameController.text = state.userProfile?.bankName ?? "";
            accountNumberController.text =
                state.userProfile?.accountNumber ?? "";
            accountTitleController.text = state.userProfile?.accountTitle ?? "";
            ibanNumberController.text = state.userProfile?.ibanNumber ?? "";
            swiftNumberController.text = state.userProfile?.swiftNumber ?? "";
            final Map<int, String> genderMap = {
              1: 'Male',
              2: 'Female',
              3: 'Other',
            };

            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(width * 0.03),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.button,
                                  size: 16,
                                )),
                            const Text(
                              'Edit Profile',
                              style: TextStyle(
                                  color: AppColors.button,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                            )
                          ],
                        ),
                        Card(
                          elevation: 3,
                          shadowColor: const Color(0xffABB0B8),
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            width: 300,
                            child: Column(
                              children: [
                                Form(
                                  key: _formkey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            context
                                                .read<ProfileBloc>()
                                                .add(SelectProfileImageEvent());
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              image: state.userImage == null
                                                  ? DecorationImage(
                                                      image: NetworkImage(state
                                                              .userProfile
                                                              ?.userImage ??
                                                          ""),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : DecorationImage(
                                                      image: FileImage(File(
                                                          state.userImage!
                                                              .path)),
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: 2,
                                                  right: 5,
                                                  child: Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        color: Colors.black,
                                                      ),
                                                      child: const Icon(
                                                        Icons.edit_outlined,
                                                        color: Colors.white,
                                                        size: 16,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Full Name',
                                        style: AppTextStyles.fieldLabelStyle,
                                      ),
                                      CustomTextField(
                                          hintText: "Name",
                                          inputType: TextInputType.text,
                                          width: width * 0.9,
                                          controller: nameController),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('Email Address',
                                          style: AppTextStyles.fieldLabelStyle),
                                      CustomTextField(
                                          isEnable: false,
                                          hintText: 'Email Address',
                                          inputType: TextInputType.text,
                                          width: width * 0.9,
                                          controller: emailController),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('Phone Number',
                                          style: AppTextStyles.fieldLabelStyle),
                                      CustomTextField(
                                          isEnable: false,
                                          hintText: 'Phone Number',
                                          inputType: TextInputType.phone,
                                          width: width * 0.9,
                                          controller: phnoController),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('Emirates ID',
                                          style: AppTextStyles.fieldLabelStyle),
                                      CustomTextField(
                                          isEnable: false,
                                          hintText: 'Emirates ID',
                                          inputType: TextInputType.phone,
                                          width: width * 0.9,
                                          controller: emiratesIDController),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('Gender',
                                          style: AppTextStyles.fieldLabelStyle),
                                      CustomDropdown(
                                        initialItem:
                                            genderMap[state.userGender],
                                        hintText: "Select Gender",
                                        items: genderMap.entries
                                            .map((entry) => entry.value)
                                            .toList(),
                                        closedHeaderPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                        onChanged: (value) {
                                          context
                                              .read<ProfileBloc>()
                                              .add(SelectUserGenderEvent(
                                                userGender: genderMap.entries
                                                    .firstWhere((entry) =>
                                                        entry.value == value)
                                                    .key,
                                              ));
                                        },
                                        decoration: CustomDropdownDecoration(
                                            headerStyle:
                                                AppTextStyles.dropDownTextStyle,
                                            closedBorderRadius:
                                                BorderRadius.circular(0),
                                            expandedFillColor:
                                                AppColors.textbox,
                                            hintStyle:
                                                AppTextStyles.dropDownHintStyle,
                                            closedFillColor: AppColors.textbox),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('Nationality',
                                          style: AppTextStyles.fieldLabelStyle),
                                      CustomDropdown<NationalityEntity>.search(
                                        initialItem: state
                                                        .selectedNationality !=
                                                    null &&
                                                state.nationalities.any((e) =>
                                                    e.id ==
                                                    state.selectedNationality!
                                                        .id)
                                            ? state.selectedNationality
                                            : null,
                                        excludeSelected: false,
                                        hintText: "Select Nationality",
                                        items: state.nationalities,
                                        closedHeaderPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                        onChanged: (value) {
                                          if (value != null) {
                                            context.read<ProfileBloc>().add(
                                                SelectUserNationalityEvent(
                                                    userNationality: value));
                                          }
                                        },
                                        headerBuilder:
                                            (context, selectedItem, enabled) {
                                          return Text(
                                            selectedItem.countryName
                                                .capitalizeAllWordsFirstLetter,
                                            style:
                                                AppTextStyles.dropDownTextStyle,
                                          );
                                        },
                                        listItemBuilder: (context, item,
                                            isSelected, onItemSelect) {
                                          return Text(item.countryName
                                              .capitalizeAllWordsFirstLetter);
                                        },
                                        decoration: CustomDropdownDecoration(
                                            headerStyle:
                                                AppTextStyles.dropDownTextStyle,
                                            closedBorderRadius:
                                                BorderRadius.circular(0),
                                            expandedFillColor:
                                                AppColors.textbox,
                                            hintStyle:
                                                AppTextStyles.dropDownHintStyle,
                                            closedFillColor: AppColors.textbox),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('Languages',
                                          style: AppTextStyles.fieldLabelStyle),
                                      CustomDropdown<
                                          LanguageEntity>.multiSelect(
                                        initialItems: state.selectedLanguages,
                                        listItemBuilder: (context, item,
                                            isSelected, onItemSelect) {
                                          return Text(item.nameEn);
                                        },
                                        headerListBuilder:
                                            (context, selectedItems, enabled) {
                                          String selectedLanguages =
                                              selectedItems
                                                  .map((item) => item.nameEn)
                                                  .join(' | ');
                                          return Text(
                                              selectedLanguages.isNotEmpty
                                                  ? selectedLanguages
                                                  : "Select Languages",
                                              style: AppTextStyles
                                                  .dropDownTextStyle);
                                        },
                                        hintText: "Select Languages",
                                        items: state.languages,
                                        closedHeaderPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                        decoration: CustomDropdownDecoration(
                                            closedBorderRadius:
                                                BorderRadius.circular(0),
                                            expandedFillColor:
                                                AppColors.textbox,
                                            hintStyle:
                                                AppTextStyles.dropDownHintStyle,
                                            closedFillColor: AppColors.textbox),
                                        onListChanged:
                                            (List<LanguageEntity> languages) {
                                          context.read<ProfileBloc>().add(
                                              SelectUserLanguageEvent(
                                                  userLanguages: languages));
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Bank Details",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.fontColor),
                        ),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 3,
                          shadowColor: const Color(0xffABB0B8),
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(10),
                                const Text(
                                  "Bank Name",
                                  style: AppTextStyles.fieldLabelStyle,
                                ),
                                const Gap(5),
                                CustomTextField(
                                    hintText: "Bank Name",
                                    inputType: TextInputType.text,
                                    width: width * 0.9,
                                    controller: bankNameController),
                                const Gap(5),
                                const Text(
                                  "Account Number",
                                  style: AppTextStyles.fieldLabelStyle,
                                ),
                                const Gap(5),
                                CustomTextField(
                                    hintText: "Account Number",
                                    inputType: TextInputType.number,
                                    width: width * 0.9,
                                    controller: accountNumberController),
                                const Gap(5),
                                const Text(
                                  "Account Title",
                                  style: AppTextStyles.fieldLabelStyle,
                                ),
                                const Gap(5),
                                CustomTextField(
                                    hintText: "Account Title",
                                    inputType: TextInputType.text,
                                    width: width * 0.9,
                                    controller: accountTitleController),
                                const Gap(5),
                                const Text(
                                  "Swift Code",
                                  style: AppTextStyles.fieldLabelStyle,
                                ),
                                const Gap(5),
                                CustomTextField(
                                    hintText: "Swift Code",
                                    inputType: TextInputType.number,
                                    width: width * 0.9,
                                    controller: swiftNumberController),
                                const Gap(5),
                                const Text(
                                  "IBAN Number",
                                  style: AppTextStyles.fieldLabelStyle,
                                ),
                                const Gap(5),
                                CustomTextField(
                                    hintText: "IBAN Number",
                                    inputType: TextInputType.text,
                                    width: width * 0.9,
                                    controller: ibanNumberController),
                                const Gap(
                                  10,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        SizedBox(
                          width: width,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              final fullName = nameController.text;
                              // final email = emailController.text;
                              // final phone = phnoController.text;
                              // final emiratesId = emiratesIDController.text;
                              final bankName = bankNameController.text;
                              final accountNumber =
                                  accountNumberController.text;
                              final accountTitle = accountTitleController.text;
                              final swiftNumber = swiftNumberController.text;
                              final ibanNumber = ibanNumberController.text;
                              if (fullName.isEmpty) {
                                showToast(msg: "Please enter your full name");
                                return;
                              }
                              if (state.selectedNationality == null) {
                                showToast(msg: "Please select nationality");
                                return;
                              }
                              if (state.selectedLanguages.isEmpty) {
                                showToast(msg: "Please select languages");
                                return;
                              }
                              if (state.userGender.isNull) {
                                showToast(msg: "Please select gender");
                                return;
                              }

                              if (bankName.isEmpty) {
                                showToast(msg: "Please enter bank name");
                                return;
                              }
                              if (accountNumber.isEmpty) {
                                showToast(msg: "Please enter account number");
                                return;
                              }
                              if (accountTitle.isEmpty) {
                                showToast(msg: "Please enter account title");
                                return;
                              }
                              if (swiftNumber.isEmpty) {
                                showToast(msg: "Please enter swift number");
                                return;
                              }
                              if (ibanNumber.isEmpty) {
                                showToast(msg: "Please enter iban number");
                                return;
                              }
                              context.read<ProfileBloc>().add(
                                  UpdateUserProfileEvent(
                                      fullName: fullName,
                                      bankName: bankName,
                                      accountNumber: accountNumber,
                                      iban: ibanNumber,
                                      swiftCode: swiftNumber,
                                      accountTitle: accountTitle));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(AppColors.red),
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                            child: const Text('Update Profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            final preselectedSkills = state.skillsList
                                .where((skill) => state.selectedSkills
                                    .any((selected) => selected.id == skill.id))
                                .toList();

                            final controller = TextEditingController();
                            return skillCard(
                              selectedSkills: state.selectedSkills,
                              title: 'Chosen Skills',
                              onPressed1: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          insetPadding:
                                              const EdgeInsets.all(14.0),
                                          title: const Text(
                                            textAlign: TextAlign.center,
                                            'Edit Your Skills',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: Material(
                                            color: Colors.transparent,
                                            child: Form(
                                              key: GlobalKey(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Gap(20),
                                                  const Text(
                                                    "Select Skills",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .fontColor),
                                                  ),
                                                  const Gap(5),
                                                  CustomDropdown<
                                                          SkillEntity>.multiSelect(
                                                      initialItems:
                                                          preselectedSkills,
                                                      headerListBuilder:
                                                          (context,
                                                              selectedList,
                                                              selected) {
                                                        return SizedBox(
                                                          width: width,
                                                          child: Text(
                                                            selectedList
                                                                .map((skill) =>
                                                                    skill
                                                                        .skillEn)
                                                                .join(' | '),
                                                            style:
                                                                const TextStyle(
                                                              color: AppColors
                                                                  .fontColor,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      closedHeaderPadding:
                                                          const EdgeInsets
                                                              .all(15.0),
                                                      listItemBuilder: (context,
                                                          value,
                                                          isSelected,
                                                          onTap) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          child: ListTile(
                                                            dense: true,
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            title: Text(
                                                                value.skillEn),
                                                            onTap: onTap,
                                                            selected:
                                                                isSelected,
                                                          ),
                                                        );
                                                      },
                                                      decoration:
                                                          const CustomDropdownDecoration(
                                                        closedFillColor:
                                                            AppColors.textbox,
                                                        expandedFillColor:
                                                            AppColors.textbox,
                                                        hintStyle: TextStyle(
                                                            color: AppColors
                                                                .fontColor,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      hintText: "Select Skills",
                                                      items: state.skillsList,
                                                      onListChanged:
                                                          (itemList) {
                                                        context
                                                            .read<ProfileBloc>()
                                                            .add(ChangeUserSkillsEvent(
                                                                selectedSkills:
                                                                    itemList));
                                                      }),
                                                  const Gap(20),
                                                  const Text(
                                                    "Description",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .fontColor),
                                                  ),
                                                  const Gap(5),
                                                  CustomTextField(
                                                      borderRadius: 12,
                                                      height: 150,
                                                      maxLine: 5,
                                                      hintText:
                                                          "Write description here..",
                                                      inputType: TextInputType
                                                          .visiblePassword,
                                                      width: width,
                                                      controller: controller),
                                                  const Gap(20),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              style: const ButtonStyle(
                                                  side: WidgetStatePropertyAll(
                                                      BorderSide(
                                                          color: AppColors
                                                              .button))),
                                              child: const Text("CANCEL"),
                                            ),
                                            state.passUpdateStatus ==
                                                    Status.loading
                                                ? const CircularProgressIndicator
                                                    .adaptive()
                                                : TextButton(
                                                    onPressed: () async {
                                                      context
                                                          .read<ProfileBloc>()
                                                          .add(UpdateProfileSkillsEvent(
                                                              description:
                                                                  controller
                                                                      .text));
                                                    },
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                AppColors
                                                                    .button),
                                                        side: WidgetStatePropertyAll(
                                                            BorderSide(
                                                                color: AppColors
                                                                    .button))),
                                                    child: const Text(
                                                      "UPDATE",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .background,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                          ],
                                        ));
                              },
                              onPressed2: () {
                                // showDialog(
                                //     context: context,
                                //     builder: (context) => const AlertDialog(
                                //           title: Text('Edit Your Skills'),
                                //         ));
                              },
                              buttonText1: 'Edit Skills',
                              buttonText2: 'Testing Skills',
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocConsumer<ProfileBloc, ProfileState>(
                          listener: (context, state) {
                            if (state is UpdatePasswordSuccessState) {
                              context.pop();
                              showToast(msg: "Password Updated Successfully");
                              return;
                            }
                            if (state is UpdatePasswordDialogState) {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  final newPassController =
                                      TextEditingController();
                                  final confirmPassController =
                                      TextEditingController();
                                  final key = GlobalKey<FormState>();

                                  return AlertDialog(
                                    insetPadding: const EdgeInsets.all(14),
                                    title: const Text(
                                      textAlign: TextAlign.center,
                                      'Update Password',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Material(
                                      color: Colors.transparent,
                                      child: Form(
                                        key: key,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Gap(20),
                                            const Text(
                                              "New Password",
                                              style: TextStyle(
                                                  color: AppColors.fontColor),
                                            ),
                                            const Gap(5),
                                            CustomTextField(
                                                validator: (value) {
                                                  if (value?.isEmpty ?? false) {
                                                    return 'Please enter your password';
                                                  }
                                                  if (value!.length < 8) {
                                                    return 'Password must be at least 8 characters';
                                                  }
                                                  return null;
                                                },
                                                hintText: "New password",
                                                inputType: TextInputType
                                                    .visiblePassword,
                                                width: width,
                                                controller: newPassController),
                                            const Gap(20),
                                            const Text(
                                              "Confirm New Password",
                                              style: TextStyle(
                                                  color: AppColors.fontColor),
                                            ),
                                            const Gap(5),
                                            CustomTextField(
                                                validator: (value) {
                                                  if (value?.isEmpty ?? false) {
                                                    return 'Please enter your password';
                                                  }
                                                  if (value !=
                                                      newPassController.text) {
                                                    return 'Password did not match';
                                                  }
                                                  return null;
                                                },
                                                hintText:
                                                    "Confirm new password",
                                                inputType: TextInputType
                                                    .visiblePassword,
                                                width: width,
                                                controller:
                                                    confirmPassController),
                                            const Gap(20),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        style: const ButtonStyle(
                                            side: WidgetStatePropertyAll(
                                                BorderSide(
                                                    color: AppColors.button))),
                                        child: const Text("CANCEL"),
                                      ),
                                      state.passUpdateStatus == Status.loading
                                          ? const CircularProgressIndicator
                                              .adaptive()
                                          : TextButton(
                                              onPressed: () async {
                                                if (!key.currentState!
                                                    .validate()) {
                                                  return;
                                                }
                                                context.read<ProfileBloc>().add(
                                                    UpdatePasswordEvent(
                                                        newPassword:
                                                            newPassController
                                                                .text));
                                              },
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          AppColors.button),
                                                  side: WidgetStatePropertyAll(
                                                      BorderSide(
                                                          color: AppColors
                                                              .button))),
                                              child: const Text(
                                                "UPDATE",
                                                style: TextStyle(
                                                    color: AppColors.background,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          builder: (context, state) {
                            return customCard(
                                title: 'Change Password',
                                onPressed: () {
                                  context
                                      .read<ProfileBloc>()
                                      .add(UpdatePasswordDialogEvent());
                                });
                          },
                        ),
                        // const SizedBox(height: 10),
                        // customCard(title: 'Bank Details', onPressed: () {}),

                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: AppColors.button,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/verify.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'VERIFY MY PROFILE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        Container(
                          height: 130,
                          width: 70,
                          decoration: BoxDecoration(
                            color: AppColors.button,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Subscription Packages',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(width: width * 0.25),
                                    Image.asset(
                                      'assets/images/icon4.png',
                                      height: 35,
                                      width: 50,
                                    ),
                                  ],
                                ),
                                Text(
                                  state.currentPackageName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Amrtmm changes per task: AED 2.99+12.9%',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        /* skillCard(
                          title: 'Skills Verification',
                          onPressed1: () {},
                          onPressed2: () {},
                          buttonText1: 'Verify Skills',
                          buttonText2: 'Testing Skills',
                        ), */
                        const SizedBox(
                          height: 5,
                        ),

                        CustomButton(
                          onPressed: () {},
                          buttonText: 'LOGOUT',
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  Widget customCard({required String title, required VoidCallback onPressed}) {
    return Card(
      elevation: 3,
      shadowColor: const Color(0xffABB0B8),
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: SizedBox(
        height: 70,
        width: MediaQuery.sizeOf(context).width,
        child: TextButton(
          style: ButtonStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0)))),
          onPressed: onPressed,
          child: Text(title,
              style: const TextStyle(
                  color: AppColors.fontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget skillCard(
      {List<SkillEntity> selectedSkills = const [],
      required String title,
      required VoidCallback onPressed1,
      required String buttonText1,
      required String buttonText2,
      required VoidCallback onPressed2}) {
    return Card(
      elevation: 3,
      shadowColor: const Color(0xffABB0B8),
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.fontColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: onPressed1,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    buttonText1,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),

            selectedSkills.isEmpty
                ? const SizedBox()
                : Wrap(
                    children: selectedSkills
                        .map((skill) => Container(
                              margin: const EdgeInsets.all(5.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: AppColors.button,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                skill.skillEn,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ))
                        .toList()),
            // TextButton(
            //   onPressed: onPressed2,
            //   style: TextButton.styleFrom(
            //     backgroundColor: AppColors.button,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20.0),
            //     ),
            //   ),
            //   child: Text(
            //     buttonText2,
            //     style: const TextStyle(color: Colors.white),
            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
