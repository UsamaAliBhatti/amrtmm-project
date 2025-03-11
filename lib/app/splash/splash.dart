import 'dart:async';

import 'package:amrtmm_project/core/config/routes/routes_constants.dart';
import 'package:amrtmm_project/core/gen/assets.gen.dart';
import 'package:amrtmm_project/core/services/databases/local_db.dart';
import 'package:amrtmm_project/core/services/keys/db_keys.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      final isLoggedIn = LocalDB.getBool(DBKeys.isLoggedIn);

      if (isLoggedIn ?? false) {
        context.pushReplacementNamed(RoutesNameConstants.homeScreen);
        return;
      }
      context.pushReplacementNamed(RoutesNameConstants.onboardingScreen);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.images.logo.path),
      ),
    );
  }
}
