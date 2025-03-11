import 'package:amrtmm_project/core/config/routes/routes_constants.dart';
import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/components/buildCard.dart';
import 'package:amrtmm_project/core/utils/res/components/customSearchField.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/gen/assets.gen.dart';
import '../../core/utils/res/components/customCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            InkWell(
                onTap: () {
                  context.pushNamed(RoutesNameConstants.allTasksScreen);
                },
                child: const CustomSearchField()),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'RECENT LISTING',
                  style: TextStyle(
                    color: AppColors.button,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.red),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    elevation: WidgetStateProperty.all(5.0),
                    shadowColor: WidgetStateProperty.all(Colors.black),
                  ),
                  child: const Text('View All',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            BuildCard(imagePath: Assets.images.img1.path),
            const SizedBox(height: 10),
            BuildCard(imagePath: Assets.images.img2.path),
            const SizedBox(
              height: 10,
            ),
            CustomCard(
              imagePath: Assets.images.img3.path,
              firstText: 'Hire Freelancers',
              secondText: 'Book a specific Artisan',
              iconPath: Assets.images.icon1.path,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomCard(
              imagePath: Assets.images.img4.path,
              firstText: 'About us',
              secondText: 'Know more about Amrtmm',
              iconPath: Assets.images.icon2.path,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomCard(
              imagePath: Assets.images.img5.path,
              firstText: "FAQs",
              secondText: 'Frequently asked questions about Amrtmm',
              iconPath: Assets.images.icon3.path,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
