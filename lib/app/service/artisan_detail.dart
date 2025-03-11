import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ArtisanDetailScreen extends StatefulWidget {
  final String imagePath;

  const ArtisanDetailScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  State<ArtisanDetailScreen> createState() => _ArtisanDetailScreenState();
}

class _ArtisanDetailScreenState extends State<ArtisanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                        size: 17,
                      )),
                  const Text(
                    'Artisan Details',
                    style: TextStyle(
                        fontSize: 17,
                        color: AppColors.button,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: width * 0.3,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: AppColors.button,
                        size: 17,
                      )),
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
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          widget.imagePath,
                          width: double.infinity,
                          height: 114,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: width * 0.35,
                                ),
                                const Text(
                                  'My Budget: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.button,
                                      fontSize: 16),
                                ),
                                const Text(
                                  'AED',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.button,
                                      fontSize: 10),
                                ),
                                const Text(
                                  '100',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.button,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            const Text(
                              'Task Details',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Dubai Mall-Dubai-United Arab Emirates',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff686868),
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              'Sunday 15 Jan 2023',
                              style: TextStyle(
                                  color: Color(0xff686868),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        AppColors.button),
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'ACCEPTED',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildContainer('Tags', onPressed: () {}),
              const SizedBox(height: 20),
              _buildContainer('Description', content: 'Test'),
              const SizedBox(height: 20),
              _buildContainer('End Result Description',
                  content: 'Need Mobile Tester'),
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: AppColors.button,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(
                              'assets/images/image11.png',
                            ),
                            height: 70,
                            width: 70,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              RatingBar.builder(
                                unratedColor: Colors.white,
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 14,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Color(0xffFAFF00),
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Task Status',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                width: width * 0.2,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(AppColors.red),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                child: const Text('Make Payment',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                'ACCEPTED',
                                style: TextStyle(
                                    color: AppColors.button,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          _buildDeliveryTimelineRow(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {},
                buttonText: 'View Offers',
                color: AppColors.red,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryTimelineRow() {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineTileWithTitleAndSubtitle('PENDING'),
          _buildTimelineTileWithTitleAndSubtitle('ACCEPTED'),
          _buildTimelineTileWithTitleAndSubtitle('IN PROGRESS'),
          _buildTimelineTileWithTitleAndSubtitle('COMPLETED'),
        ],
      ),
    );
  }

  Widget _buildTimelineTileWithTitleAndSubtitle(String title) {
    return Expanded(
      child: TimelineTile(
        alignment: TimelineAlign.center,
        axis: TimelineAxis.horizontal,
        lineXY: 0.1,
        isFirst: title == 'PENDING',
        isLast: title == 'COMPLETED',
        indicatorStyle: IndicatorStyle(
          width: 15,
          color: title == 'PENDING' || title == 'ACCEPTED'
              ? AppColors.button
              : const Color(0xffEAEDF3),
          padding: const EdgeInsets.all(0),
        ),
        beforeLineStyle: LineStyle(
          color: title == 'PENDING' || title == 'ACCEPTED'
              ? AppColors.button
              : const Color(0xffEAEDF3),
          thickness: 2,
        ),
        endChild: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(String title,
      {String? content, VoidCallback? onPressed}) {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                if (content != null)
                  Text(
                    content,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
              ],
            ),
            if (onPressed != null)
              ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.button),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text('ACCEPTED',
                    style: TextStyle(color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}
