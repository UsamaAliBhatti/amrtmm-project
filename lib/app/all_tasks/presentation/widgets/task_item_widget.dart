import 'package:amrtmm_project/core/config/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/res/appColors.dart';
import '../../domain/entities/task_entity.dart';
import 'container_desc_item.dart';
import 'tag_button.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskEntity task;
  const TaskItemWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> skillsList =
        task.tags?.split(",").map((e) => e.trim()).toList() ?? [];
    return InkWell(
      onTap: () {
        context.pushNamed(RoutesNameConstants.taskDetailsScreen, extra: {
          "id": task.id,
          "title": task.title,
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            color: AppColors.containerBG,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                      image: const DecorationImage(
                          scale: 20,
                          image: AssetImage(
                            "assets/images/profile.png",
                          ))),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(10),
                    Text(
                      task.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    ContainerDescItem(
                      icon: Icons.location_on_outlined,
                      title: task.location,
                    ),
                    const Gap(10),
                    ContainerDescItem(
                      icon: Icons.access_time,
                      title: task.dateTime.toString(),
                    ),
                    const Gap(10),
                    ContainerDescItem(
                      icon: Icons.money_rounded,
                      title: "AED ${task.myBudget}",
                    ),
                    const Gap(20),
                    const Wrap()
                  ],
                ),
                const Gap(
                  10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TagButton(text: task.requestProgressStatus),
                    const Gap(10),
                    TagButton(text: task.serviceType),
                    const Gap(10),
                    TagButton(
                      text: '${task.requestStatus} Offers',
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(10),
            skillsList.isEmpty
                ? const SizedBox()
                : Wrap(
                    spacing: 10,
                    children:
                        skillsList.map((e) => TagButton(text: e)).toList(),
                  )
          ],
        ),
      ),
    );
  }
}
