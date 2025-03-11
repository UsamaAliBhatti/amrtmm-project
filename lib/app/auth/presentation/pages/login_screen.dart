import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/res/logo.dart';
import '../widgets/email_login.dart';
import '../widgets/phone_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              logo(context),
              const Text(
                'Log in to Amrtmm ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const Text(
                'Continue with',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff575757),
                    fontSize: 14),
              ),
              Gap(height * 0.02),
              TabBar(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                indicatorWeight: 0.5,
                labelPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.08,
                ),
                indicatorPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.08,
                ),
                indicatorColor: AppColors.button,
                labelColor: AppColors.button,
                unselectedLabelColor: Colors.grey.shade500,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                tabs: const [
                  Tab(
                    text: 'Email',
                  ),
                  Tab(
                    text: 'Phone',
                  )
                ],
              ),
              Gap(height * 0.02),
              SizedBox(
                height: height * 0.6, // Adjust the height as needed
                child: const TabBarView(
                  children: [
                    EmailLogin(),
                    PhoneLogin(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
