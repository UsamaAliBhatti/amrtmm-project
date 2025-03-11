import 'package:amrtmm_project/app/all_tasks/presentation/widgets/task_item_widget.dart';
import 'package:amrtmm_project/core/enums/status.dart';
import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/res/components/custom_button.dart';
import '../blocs/all_tasks/all_tasks_bloc.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    context.read<AllTasksBloc>().add(const FetchTasksEvent(choice: "jobs"));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Browse Temployments',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<AllTasksBloc, AllTasksState>(
        listener: (context, state) {
          if (state is FilterDialogState) {
            showDialog(
              context: context,
              builder: (context) {
                final searchController = TextEditingController();
                final dateConroller = TextEditingController();
                final sortingChoices = [
                  "Ascending",
                  "Descending",
                ];
                return AlertDialog(
                  insetPadding: const EdgeInsets.all(20),
                  title: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Filters',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<AllTasksBloc>().add(ResetFiltersEvent());
                          dateConroller.clear();
                          searchController.clear();
                          context.pop(context);
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            color: AppColors.button,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  content: BlocBuilder<AllTasksBloc, AllTasksState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Gap(10),
                            Divider(
                              height: 1,
                              color: AppColors.border.withValues(alpha: 0.3),
                            ),
                            const Gap(15),
                            TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Search by keyword...",
                                contentPadding: const EdgeInsets.only(
                                  left: 10,
                                  right: 150,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    padding: EdgeInsets.zero,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.button,
                                    ),
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth:
                                      60, // Minimum width of the prefix icon
                                  minHeight:
                                      50, // Minimum height of the prefix icon
                                ),
                                hintStyle: AppTextStyles.dropDownHintStyle,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: AppColors.black, width: 0.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const Gap(15),
                            Divider(
                              height: 1,
                              color: AppColors.border.withValues(alpha: 0.3),
                            ),
                            const Gap(15),
                            const Text(
                              "Date",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.button,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(10),
                            InkWell(
                              onTap: () async {
                                final date = await showDatePicker(
                                    context: context,
                                    firstDate:
                                        DateTime.now().copyWith(year: 2016),
                                    lastDate:
                                        DateTime.now().copyWith(year: 2050));
                                if (date != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd').format(date);
                                  dateConroller.text = formattedDate;
                                }
                              },
                              child: TextField(
                                controller: dateConroller,
                                style: const TextStyle(color: AppColors.black),
                                decoration: InputDecoration(
                                  enabled: false,
                                  hintText: "2023-02-19",
                                  hintStyle: AppTextStyles.dropDownHintStyle,
                                  isDense: true,
                                  suffixIcon:
                                      const Icon(Icons.calendar_month_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: AppColors.black, width: 0.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.black, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.black, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.black, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(15),
                            Divider(
                              height: 1,
                              color: AppColors.border.withValues(alpha: 0.3),
                            ),
                            const Gap(15),
                            const Text(
                              "Sort",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.button,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(10),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.black, // Border color
                                  width: 0.5, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Rounded corners
                              ),
                              child: DropdownButton(
                                padding: const EdgeInsets.only(top: 3),
                                isDense: true,
                                underline: const SizedBox(),
                                isExpanded: true,
                                hint: const Text("Select Sorting Type"),
                                value: state.selectedSorting.isEmpty
                                    ? null
                                    : state.selectedSorting,
                                style: const TextStyle(color: AppColors.black),
                                items: sortingChoices
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                              color: AppColors.black),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    context.read<AllTasksBloc>().add(
                                        SelectSortingTypeEvent(
                                            sortingType: value));
                                  }
                                },
                              ),
                            ),
                            const Gap(15),
                            Divider(
                              height: 1,
                              color: AppColors.border.withValues(alpha: 0.3),
                            ),
                            const Gap(15),
                            const Text(
                              "Price Range",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.button,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Text(
                                  state.minBudget.toString(),
                                  style: const TextStyle(
                                    color: AppColors.button,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: RangeSlider(
                                    values: RangeValues(
                                      state.selectedMinBudget
                                          .toDouble(), // Use selected min value
                                      state.selectedMaxBudget
                                          .toDouble(), // Use selected max value
                                    ),
                                    min: state.minBudget
                                        .toDouble(), // Correct min value
                                    max: state.maxBudget
                                        .toDouble(), // Correct max value
                                    divisions: 10, // Optional: adds steps
                                    labels: RangeLabels(
                                      state.selectedMinBudget.toString(),
                                      state.selectedMaxBudget.toString(),
                                    ),
                                    onChanged: (RangeValues newValues) {
                                      context.read<AllTasksBloc>().add(
                                            SelectRangeEvent(
                                              maxBudget: newValues.end.toInt(),
                                              minBudget:
                                                  newValues.start.toInt(),
                                            ),
                                          );
                                    },
                                    activeColor: AppColors.button,
                                    inactiveColor: Colors.grey,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  state.maxBudget.toString(),
                                  style: const TextStyle(
                                    color: AppColors.button,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),
                            CustomButton(
                                width: MediaQuery.sizeOf(context).width,
                                onPressed: () {
                                  context.read<AllTasksBloc>().add(
                                      FetchFilterTasksEvent(
                                          query: searchController.text,
                                          date: dateConroller.text));
                                  context.pop(context);
                                },
                                color: AppColors.button,
                                buttonText: "Apply Filters"),
                            const Gap(10),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.textbox,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          controller: searchController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          onChanged: (value) {
                            if (value.isEmpty) {
                              context.read<AllTasksBloc>().add(FetchTasksEvent(
                                  choice: state.selectedChoice));
                              return;
                            }
                            context
                                .read<AllTasksBloc>()
                                .add(FetchTasksSuggestionsEvent(query: value));
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14.0), // Adjust text alignment
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              // Adjust spacing
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: state.selectedChoice,
                                  items: state.choices
                                      .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      context
                                          .read<AllTasksBloc>()
                                          .add(SelectChoiceEvent(value: value));
                                    }
                                  },
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                  isDense: true, // Keeps dropdown compact
                                ),
                              ),
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search...',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          context
                              .read<AllTasksBloc>()
                              .add(ShowFilterDialogEvent());
                        },
                        icon: Image.asset("assets/images/filter.png"))
                  ],
                ),
                const Gap(20.0),
                Expanded(
                  child: state.status == Status.loading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : state.allTasks.isEmpty
                          ? const Center(
                              child: Text(
                                "No Record Found",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.allTasks.length,
                              itemBuilder: (context, index) => TaskItemWidget(
                                task: state.allTasks[index],
                              ),
                              // children: const [
                              //   TaskItemWidget(),
                              //   Gap(10),
                              //   TaskItemWidget(),
                              //   Gap(10),
                              //   TaskItemWidget(),
                              // ],
                            ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
