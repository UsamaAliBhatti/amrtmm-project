import 'package:amrtmm_project/core/config/routes/routes_constants.dart';
import 'package:amrtmm_project/core/utils/res/logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/res/appColors.dart';
import '../../core/utils/res/components/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController pageController = PageController();
  List onBoardingData = [
    {
      "image": 'assets/images/boarding 2.png',
      "title": 'Never miss an opportunity.',
      "description": 'Easily find work, chat and collaborate on the go.'
    },
    {
      "image": 'assets/images/boarding1.png',
      "title": 'Find interesting projects and submit proposals.',
      "description":
          'Stand out by replying to clients quickly and getting to work.'
    },
    {
      "image": 'assets/images/boarding3.png',
      "title": 'Collaborate on the go.',
      "description": 'Chat, share files, and complete projects.'
    }
  ];
  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          logo(context),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              itemCount: onBoardingData.length,
              onPageChanged: onChanged,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      onBoardingData[index]['image'],
                      height: height * 0.4,
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        onBoardingData[index]['title'],
                        style: const TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        onBoardingData[index]['description'],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              (currentPage == (onBoardingData.length - 4))
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        onBoardingData.length,
                        (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 10,
                            width: (index == currentPage) ? 10 : 10,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == currentPage)
                                  ? AppColors.button
                                  : Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: CustomButton(
                  color: AppColors.button,
                  onPressed: () {
                    context.pushReplacementNamed(
                        RoutesNameConstants.loginScreen); // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const EmailLoginScreen()));
                  },
                  buttonText: 'Log in',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: Row(
                  children: [
                    const Text('New to Amrtmm?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300)),
                    TextButton(
                      onPressed: () {
                        context.pushReplacementNamed(
                            RoutesNameConstants.registerScreen);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const RegisterScreen()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.button,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
