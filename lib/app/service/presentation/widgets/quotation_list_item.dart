import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/res/appColors.dart';
import '../../../../core/utils/res/components/custom_button.dart';
import '../../../all_tasks/presentation/widgets/container_desc_item.dart';
import '../../../all_tasks/presentation/widgets/tag_button.dart';

class QuotationListItem extends StatelessWidget {
  const QuotationListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: AppColors.containerBG,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(10),
                    Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Gap(10),
                    ContainerDescItem(
                      icon: Icons.location_on_outlined,
                      title: "location",
                    ),
                    Gap(10),
                    ContainerDescItem(
                      icon: Icons.access_time,
                      title: "DateTime",
                    ),
                    Gap(10),
                    ContainerDescItem(
                      icon: Icons.money_rounded,
                      title: "AED 10",
                    ),
                  ],
                ),
                const Gap(
                  10,
                ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(10),
                    TagButton(text: "Open"),
                    Gap(10),
                    TagButton(text: "Offers"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            width: width,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  onPressed: () {},
                  height: 40,
                  width: width * 0.35,
                  buttonText: "View Quotation",
                  color: const Color(0xFF22AAE9),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
