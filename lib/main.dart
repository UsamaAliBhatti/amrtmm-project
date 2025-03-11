import 'package:amrtmm_project/app/all_tasks/presentation/blocs/all_tasks/all_tasks_bloc.dart';
import 'package:amrtmm_project/app/auth/presentation/blocs/auth_bloc.dart'
    as skill;
import 'package:amrtmm_project/app/auth/presentation/blocs/auth_bloc.dart';
import 'package:amrtmm_project/app/common/presentation/blocs/bloc/common_screen_bloc.dart';
import 'package:amrtmm_project/app/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:amrtmm_project/app/main/presentation/bloc/main_bloc.dart';
import 'package:amrtmm_project/app/other/presentation/blocs/contact_us_bloc.dart';
import 'package:amrtmm_project/app/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:amrtmm_project/app/service/presentation/blocs/my_services_bloc/my_service_bloc.dart';
import 'package:amrtmm_project/app/service/presentation/blocs/service_bloc/service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/routes/app_routes.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

extension StringToBoolExtension on String {
  bool toBool() {
    final value = toLowerCase();
    if (value == 'true' || value == '1') {
      return true;
    } else if (value == 'false' || value == '0') {
      return false;
    } else {
      throw ArgumentError('Invalid boolean string: $this');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MainBloc>()),
        BlocProvider(
            create: (_) => sl<AuthBloc>()..add(skill.FetchSkillsEvent())),
        BlocProvider(create: (_) => sl<ServiceBloc>()),
        BlocProvider(create: (_) => sl<CommonScreenBloc>()),
        BlocProvider(
            create: (_) => sl<ContactUsBloc>()..add(FetchContactUsEvent())),
        BlocProvider(
            create: (_) => sl<ProfileBloc>()..add(FetchProfileSkillsEvent())),
        BlocProvider(create: (_) => sl<DashboardBloc>()),
        BlocProvider(create: (_) => sl<AllTasksBloc>()),
        BlocProvider(create: (_) => sl<MyServiceBloc>()),
      ],
      child: MaterialApp.router(
        routerDelegate: AppRoutes.router.routerDelegate,
        routeInformationParser: AppRoutes.router.routeInformationParser,
        routeInformationProvider: AppRoutes.router.routeInformationProvider,
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const SplashScreen(),
        //   '/onBoarding': (context) => const OnboardingScreen(),
        //   '/edit_profile': (context) => const EditProfile(),
        //   '/create_service': (context) => const CreateService(),
        //   '/bank_detail': (context) => const BankDetailScreen(),
        //   '/review_screen': (context) => const ReviewScreen(),
        //   '/wallet_screen': (context) => const WalletScreen(),
        //   '/package_screen': (context) => const PackageScreen(),
        //   '/dashboard_screen': (context) => const DashboardScreen(),
        // },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        //home:NavBar(),
      ),
    );
  }
}
