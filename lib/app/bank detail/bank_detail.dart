import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:amrtmm_project/core/utils/res/components/TextField.dart';
import 'package:amrtmm_project/core/utils/res/components/custom_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/res/components/main_drawer.dart';

class BankDetailScreen extends StatefulWidget {
  const BankDetailScreen({super.key});

  @override
  State<BankDetailScreen> createState() => _BankDetailScreenState();
}

class _BankDetailScreenState extends State<BankDetailScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accNoController = TextEditingController();
  TextEditingController accTitleController = TextEditingController();
  TextEditingController swiftNoController = TextEditingController();
  TextEditingController IbanNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.button,
                              size: 16,
                            )),
                        const Text(
                          'Bank Details',
                          style: TextStyle(
                              color: AppColors.button,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                          'Please Enter Require Details Below',
                          style: TextStyle(
                              color: AppColors.button,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        )
                      ],
                    ),
                    Card(
                      elevation: 3,
                      shadowColor: const Color(0xffABB0B8),
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xffFFFFFF)),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: SizedBox(
                        height: 440,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: Column(
                            children: [
                              Form(
                                key: _formkey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Bank Name',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 3),
                                    CustomTextField(
                                        hintText: 'Bank Name',
                                        inputType: TextInputType.text,
                                        width: width * 0.8,
                                        controller: bankNameController),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Account Number',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 3),
                                    CustomTextField(
                                        hintText: 'Account Number',
                                        inputType: TextInputType.text,
                                        width: width * 0.8,
                                        controller: accNoController),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Account Title',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 3),
                                    CustomTextField(
                                        hintText: 'Account Title',
                                        inputType: TextInputType.text,
                                        width: width * 0.8,
                                        controller: accTitleController),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Swift Account Code',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 3),
                                    CustomTextField(
                                        hintText: 'Swift Account Code',
                                        inputType: TextInputType.text,
                                        width: width * 0.8,
                                        controller: swiftNoController),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('IBAN Number',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 3),
                                    CustomTextField(
                                        hintText: 'IBAN Number',
                                        inputType: TextInputType.text,
                                        width: width * 0.8,
                                        controller: IbanNoController),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomButton(
                                      onPressed: () {},
                                      buttonText: 'Update Bank Details',
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
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
