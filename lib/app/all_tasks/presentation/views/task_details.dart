import 'package:amrtmm_project/app/all_tasks/presentation/widgets/container_desc_item.dart';
import 'package:amrtmm_project/core/utils/extensions/utils.dart';
import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/components/TextField.dart';
import 'package:amrtmm_project/core/utils/res/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/enums/status.dart';
import '../blocs/all_tasks/all_tasks_bloc.dart';
import '../widgets/tag_button.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String title;
  final int id;

  const TaskDetailsScreen({
    super.key,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    final noOfhoursController = TextEditingController();
    final validityController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    context.read<AllTasksBloc>().add(FetchTaskDetailEvent(id: id));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title.capitalizeAllWordsFirstLetter,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<AllTasksBloc, AllTasksState>(
        listener: (context, state) {
          if (state is SendQuotationSuccessState) {
            descriptionController.clear();
            priceController.clear();
            noOfhoursController.clear();
            validityController.clear();
          }
        },
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(14.0),
            child: Column(children: [
              Container(
                width: width,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0)),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerDescItem(
                      icon: Icons.location_on_outlined,
                      title: state.taskDetail?.location ?? "N/A",
                      iconSize: 30,
                      fontSize: 16,
                      textColor: Colors.grey.shade800,
                      iconColor: Colors.grey.shade800,
                    ),
                    const Gap(10),
                    ContainerDescItem(
                      icon: Icons.access_time,
                      title: state.taskDetail?.dateTime.toString() ?? "N/A",
                      iconSize: 30,
                      fontSize: 16,
                      textColor: Colors.grey.shade800,
                      iconColor: Colors.grey.shade800,
                    ),
                    const Gap(10),
                    ContainerDescItem(
                      icon: Icons.money_rounded,
                      title: "AED ${state.taskDetail?.myBudget ?? 0}",
                      iconSize: 30,
                      fontSize: 16,
                      textColor: Colors.grey.shade800,
                      iconColor: Colors.grey.shade800,
                    ),
                    const Gap(20),
                    const Text(
                      "Description",
                      style: TextStyle(
                        color: AppColors.button,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const Gap(5),
                    Text(
                      state.taskDetail?.description ?? "N/A",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      "End Result & Description",
                      style: TextStyle(
                        color: AppColors.button,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const Gap(5),
                    Text(
                      state.taskDetail?.endResultDescription ?? "N/A",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Gap(20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        TagButton(
                            text: state.taskDetail?.requestProgressStatus ??
                                "N/A"),
                        const Gap(10),
                        TagButton(text: state.taskDetail?.serviceType ?? "N/A"),
                        const Gap(10),
                        TagButton(
                          text:
                              '${state.taskDetail?.requestStatus ?? 0} Offers',
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Form(
                key: formKey,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Send Quotation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                      ),
                      const Gap(5),
                      const Text(
                        "Please enter your quotation details below",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.button,
                        ),
                      ),
                      const Gap(10),
                      const Text.rich(
                        TextSpan(
                          text: "Description ", // Your label
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: "*",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16), // Style the asterisk
                            ),
                          ],
                        ),
                      ),
                      const Gap(5),
                      CustomTextField(
                        height: 80,
                        inputType: TextInputType.multiline,
                        width: width,
                        controller: descriptionController,
                        fillColor: Colors.white,
                        borderRadius: 5,
                        maxLine: 5,
                      ),
                      const Gap(15),
                      const Text.rich(
                        TextSpan(
                          text: "Price ", // Your label
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: "*",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16), // Style the asterisk
                            ),
                          ],
                        ),
                      ),
                      const Gap(5),
                      CustomTextField(
                        inputType: TextInputType.number,
                        width: width,
                        controller: priceController,
                        fillColor: Colors.white,
                        borderRadius: 5,
                        maxLine: 5,
                      ),
                      const Gap(15),
                      const Text.rich(
                        TextSpan(
                          text: "No of Hours ", // Your label
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: "*",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16), // Style the asterisk
                            ),
                          ],
                        ),
                      ),
                      const Gap(5),
                      CustomTextField(
                        inputType: TextInputType.number,
                        width: width,
                        controller: noOfhoursController,
                        fillColor: Colors.white,
                        borderRadius: 5,
                        maxLine: 5,
                      ),
                      const Gap(15),
                      const Text.rich(
                        TextSpan(
                          text: "Validity ", // Your label
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: "*",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16), // Style the asterisk
                            ),
                          ],
                        ),
                      ),
                      const Gap(5),
                      CustomTextField(
                        inputType: TextInputType.number,
                        width: width,
                        controller: validityController,
                        fillColor: Colors.white,
                        borderRadius: 5,
                        maxLine: 5,
                      ),
                      const Gap(30),
                      CustomButton(
                        isLoading: state.sendQuotation == Status.loading,
                        onPressed: () {
                          final isValid = formKey.currentState?.validate();
                          if (isValid ?? false) {
                            context.read<AllTasksBloc>().add(SendQuotationEvent(
                                taskId: id,
                                description: descriptionController.text,
                                price: priceController.text,
                                hours: noOfhoursController.text,
                                validity: validityController.text));
                          }
                        },
                        buttonText: "Submit",
                        color: AppColors.button,
                        width: width,
                      )
                    ],
                  ),
                ),
              ),
              const Gap(30),
            ]),
          );
        },
      ),
    );
  }
}
