import 'package:amrtmm_project/app/all_tasks/presentation/views/all_tasks_list.dart';
import 'package:amrtmm_project/app/all_tasks/presentation/views/task_details.dart';
import 'package:amrtmm_project/app/auth/presentation/pages/login_screen.dart';
import 'package:amrtmm_project/app/auth/presentation/pages/otp_screen.dart';
import 'package:amrtmm_project/app/auth/presentation/pages/register.dart';
import 'package:amrtmm_project/app/bank%20detail/bank_detail.dart';
import 'package:amrtmm_project/app/common/presentation/pages/common_screen.dart';
import 'package:amrtmm_project/app/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:amrtmm_project/app/home%20view/home_screen.dart';
import 'package:amrtmm_project/app/manage_tasks/manage_tasks.dart';
import 'package:amrtmm_project/app/notification/notification_screen.dart';
import 'package:amrtmm_project/app/other/presentation/pages/contact_us_screen.dart';
import 'package:amrtmm_project/app/package/package_screen.dart';
import 'package:amrtmm_project/app/profile/presentation/pages/edit_profile.dart';
import 'package:amrtmm_project/app/review/review_screen.dart';
import 'package:amrtmm_project/app/service/presentation/pages/create_service.dart';
import 'package:amrtmm_project/app/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/main/presentation/pages/main_screen.dart';
import '../../../app/onBoarding screens/boarding_screen.dart';
import '../../../app/service/service_screen.dart';
import '../../../app/splash/splash.dart';
import '../../utils/res/components/profile_drawer.dart';
import 'routes_constants.dart';

class AppRoutes {
  AppRoutes._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final _mainNavigatorKey = GlobalKey<NavigatorState>();

  static final _navigatorKeys = {
    RoutesNameConstants.homeScreen: GlobalKey<NavigatorState>(),
    RoutesNameConstants.serviceScreen: GlobalKey<NavigatorState>(),
    RoutesNameConstants.createServiceScreen: GlobalKey<NavigatorState>(),
    RoutesNameConstants.profile: GlobalKey<NavigatorState>(),
    RoutesNameConstants.noitificationScreen: GlobalKey<NavigatorState>(),
    // Add more keys as needed
  };

// GoRouter configuration
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesPathConstants.splashScreen,
    routes: [
      GoRoute(
        name: RoutesNameConstants.splashScreen,
        path: RoutesPathConstants.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: RoutesNameConstants.onboardingScreen,
        path: RoutesPathConstants.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: RoutesNameConstants.registerScreen,
        path: RoutesPathConstants.registerScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        name: RoutesNameConstants.loginScreen,
        path: RoutesPathConstants.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: RoutesNameConstants.otpScreen,
        path: RoutesPathConstants.otpScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return OtpScreen(
            otp: data['otp'] ?? "123456",
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey:
            _rootNavigatorKey, // Ensure this matches the global key
        builder: (context, state, navigationShell) =>
            MainScreen(navigationShell: navigationShell),
        branches: [
          // Branch 1: Home Tab
          StatefulShellBranch(
            navigatorKey: _navigatorKeys[
                RoutesNameConstants.homeScreen], // Key for this branch
            routes: [
              GoRoute(
                name: RoutesNameConstants.homeScreen,
                path: RoutesPathConstants.homeScreen,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // Branch 2: Service Tab
          StatefulShellBranch(
            navigatorKey: _navigatorKeys[
                RoutesNameConstants.serviceScreen], // Key for this branch
            routes: [
              GoRoute(
                name: RoutesNameConstants.serviceScreen,
                path: RoutesPathConstants.serviceScreen,
                builder: (context, state) => const ServiceScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _navigatorKeys[
                RoutesNameConstants.createServiceScreen], // Key for this branch
            routes: [
              GoRoute(
                name: RoutesNameConstants.createServiceScreen,
                path: RoutesPathConstants.createServiceScreen,
                builder: (context, state) => const CreateService(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _navigatorKeys[
                RoutesNameConstants.noitificationScreen], // Key for this branch
            routes: [
              GoRoute(
                name: RoutesNameConstants.noitificationScreen,
                path: RoutesPathConstants.noitificationScreen,
                builder: (context, state) => const NotificationScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _navigatorKeys[
                RoutesNameConstants.profile], // Key for this branch
            routes: [
              GoRoute(
                  name: RoutesNameConstants.profile,
                  path: RoutesPathConstants.profile,
                  builder: (context, state) => const ProfileDrawer(),
                  routes: [
                    GoRoute(
                      path: RoutesPathConstants.editProifleScreen,
                      name: RoutesNameConstants.editProifleScreen,
                      builder: (context, state) => const EditProfile(),
                    ),
                    GoRoute(
                      path: RoutesPathConstants.manageTasks,
                      name: RoutesNameConstants.manageTasks,
                      builder: (context, state) => const ManageTasks(),
                    ),
                    GoRoute(
                      path: RoutesPathConstants.dashboardScreen,
                      name: RoutesNameConstants.dashboardScreen,
                      builder: (context, state) => const DashboardScreen(),
                    ),
                    GoRoute(
                      path: RoutesPathConstants.packageScreen,
                      name: RoutesNameConstants.packageScreen,
                      builder: (context, state) => const PackageScreen(),
                    ),
                    GoRoute(
                      path: RoutesPathConstants.reviewScreen,
                      name: RoutesNameConstants.reviewScreen,
                      builder: (context, state) => const ReviewScreen(),
                    ),
                    GoRoute(
                      path: RoutesPathConstants.bankDetailScreen,
                      name: RoutesNameConstants.bankDetailScreen,
                      builder: (context, state) => const BankDetailScreen(),
                    ),
                    GoRoute(
                      path: RoutesPathConstants.walletScreen,
                      name: RoutesNameConstants.walletScreen,
                      builder: (context, state) => const WalletScreen(),
                    ),
                  ]),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutesPathConstants.commonScreen,
        name: RoutesNameConstants.commonScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;

          return CommonScreen(
            screenNum: data['screenNum'],
            title: data['title'],
          );
        },
      ),
      GoRoute(
        path: RoutesPathConstants.contactUsScreen,
        name: RoutesNameConstants.contactUsScreen,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: RoutesPathConstants.allTasksScreen,
        name: RoutesNameConstants.allTasksScreen,
        builder: (context, state) => const AllTasksScreen(),
      ),
      GoRoute(
        path: RoutesPathConstants.taskDetailsScreen,
        name: RoutesNameConstants.taskDetailsScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return TaskDetailsScreen(
            id: data["id"],
            title: data["title"],
          );
        },
      ),
    ],
  );
}
