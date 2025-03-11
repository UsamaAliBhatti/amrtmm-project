import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/res/components/main_drawer.dart';

class TaskPaymentScreen extends StatefulWidget {
  const TaskPaymentScreen({super.key});

  @override
  State<TaskPaymentScreen> createState() => _TaskPaymentScreenState();
}

class _TaskPaymentScreenState extends State<TaskPaymentScreen> {
  int selectedValue = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        icon: const Icon(Icons.arrow_back_ios,
                            color: AppColors.button, size: 16),
                      ),
                      const Text(
                        'Task Payments',
                        style: TextStyle(
                            color: AppColors.button,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      )
                    ],
                  ),
                  Container(
                    height: 180,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/dashboard1.png'),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Show ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      DropdownButton<int>(
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        items: List.generate(
                          100,
                          (index) => DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text('${index + 1}'),
                          ),
                        ),
                      ),
                      const Text('entries',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 30,
                      ),
                      const Text('Search ',
                          style: TextStyle(
                              color: AppColors.button,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: AppColors.fontColor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      color: AppColors.button,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Serial no',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                          Text(
                            'Service name',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                          Text(
                            'Price',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                          Text(
                            'Commission',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                          Text(
                            'Status',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedValue > 0
                                ? 'No Data available in table'
                                : '0 to 0 of 0 entries',
                            style: const TextStyle(
                                color: AppColors.fontColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Show 0 to 0 of 0 entries',
                        style: TextStyle(color: AppColors.fontColor),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                          height: 33,
                          width: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xffE3E8FD),
                            border: Border.all(
                                color: const Color(
                                    0xffE3E8FD)), // Add border color
                            borderRadius:
                                BorderRadius.circular(12), // Add border radius
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(' Previous ',
                                  style: TextStyle(
                                      color: AppColors.fontColor,
                                      fontSize: 11)),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.blue, // Background color blue
                                  borderRadius: BorderRadius.circular(
                                      8), // Rounded corners
                                ),
                                // child: DropdownButton<int>(
                                //   value: 1, // Initial value
                                //   onChanged: (value) {
                                //   },
                                //   items: List.generate(10, (index) => DropdownMenuItem<int>(
                                //     value: index + 1,
                                //     child: Text('${index + 1}'),
                                //   )),
                                //   underline:Container(),
                                //   icon: null,
                                // ),
                                child: const Text(
                                  '1',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Text(' Next ',
                                  style: TextStyle(
                                      color: AppColors.fontColor,
                                      fontSize: 11)),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
