import 'package:amrtmm_project/app/all_tasks/data/remote_src/tasks_remote_src.dart';
import 'package:amrtmm_project/app/all_tasks/data/repo_impl/tasks_repo_impl.dart';
import 'package:amrtmm_project/app/all_tasks/domain/repos/tasks_repo.dart';
import 'package:amrtmm_project/app/auth/data/data_sources/remote_datasource.dart';
import 'package:amrtmm_project/app/auth/data/repositories/auth_repository_impl.dart';
import 'package:amrtmm_project/app/auth/domain/usecases/auth_usecases.dart';
import 'package:amrtmm_project/app/auth/presentation/blocs/auth_bloc.dart';
import 'package:amrtmm_project/app/common/data/datasources/remote_datasource.dart';
import 'package:amrtmm_project/app/common/data/repositories/common_repo_impl.dart';
import 'package:amrtmm_project/app/common/domain/repositories/common_repo.dart';
import 'package:amrtmm_project/app/common/domain/usecases/common_usecase.dart';
import 'package:amrtmm_project/app/common/presentation/blocs/bloc/common_screen_bloc.dart';
import 'package:amrtmm_project/app/dashboard/data/datasources/dashboard_remote_src.dart';
import 'package:amrtmm_project/app/dashboard/data/repos_impl/dashboard_repo_impl.dart';
import 'package:amrtmm_project/app/dashboard/domain/repos/dashboard_repo.dart';
import 'package:amrtmm_project/app/dashboard/domain/usecases/dashboard_usecases.dart';
import 'package:amrtmm_project/app/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:amrtmm_project/app/main/presentation/bloc/main_bloc.dart';
import 'package:amrtmm_project/app/other/data/datasources/contact_us_remote_db.dart';
import 'package:amrtmm_project/app/other/data/repos_impl/contact_us_repo_impl.dart';
import 'package:amrtmm_project/app/other/domain/repos/contact_us_repo.dart';
import 'package:amrtmm_project/app/other/domain/usecases/contact_us_usecase.dart';
import 'package:amrtmm_project/app/other/presentation/blocs/contact_us_bloc.dart';
import 'package:amrtmm_project/app/profile/data/remote_db/profile_remote_db.dart';
import 'package:amrtmm_project/app/profile/data/repos/profile_repo_impl.dart';
import 'package:amrtmm_project/app/profile/domain/repos/profile_repo.dart';
import 'package:amrtmm_project/app/profile/domain/usecases/profile_usecases.dart';
import 'package:amrtmm_project/app/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:amrtmm_project/app/service/data/datasources/remote_datasource.dart';
import 'package:amrtmm_project/app/service/data/repositories/service_repo_impl.dart';
import 'package:amrtmm_project/app/service/domain/repositories/service_repository.dart';
import 'package:amrtmm_project/app/service/domain/usecases/service_usecases.dart';
import 'package:amrtmm_project/app/service/presentation/blocs/my_services_bloc/my_service_bloc.dart';
import 'package:amrtmm_project/app/service/presentation/blocs/service_bloc/service_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/all_tasks/domain/usecases/all_tasks_usecases.dart';
import 'app/all_tasks/presentation/blocs/all_tasks/all_tasks_bloc.dart';
import 'app/auth/domain/repositories/auth_repository.dart';
import 'core/constants/api_constants.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features

  sl.registerFactory(() => NetworkInfoImpl(dio: sl(), connectivity: sl()));

  //* Blocs
  sl.registerFactory(() => MainBloc());
  sl.registerFactory(
    () => AuthBloc(
      registerUserUC: sl(),
      skillsUC: sl(),
      otpUC: sl(),
      loginUC: sl(),
    ),
  );
  sl.registerFactory(
    () => ServiceBloc(
      skillsUC: sl(),
      subcriptionUsecase: sl(),
      createTaskUsecase: sl(),
    ),
  );
  sl.registerFactory(
    () => CommonScreenBloc(
      usecase: sl(),
    ),
  );
  sl.registerFactory(
    () => ContactUsBloc(
      contactUsUsecase: sl(),
      submitQueryUsecase: sl(),
    ),
  );
  sl.registerFactory(() => ProfileBloc(
      languageUsecase: sl(),
      countryUsecase: sl(),
      fetchUserProfileUsecase: sl(),
      updatePasswordUC: sl(),
      skillsUC: sl(),
      updateSkillsUC: sl(),
      updateProfileUC: sl(),
      nationalityUsecase: sl())
    ..add(FetchCountriesEvent())
    ..add(FetchLanguagesEvent())
    ..add(FetchNationalitiesEvent())
    ..add(FetchUserProfileEvent()));
  sl.registerFactory(
    () => DashboardBloc(dashboardSummaryUseCase: sl()),
  );
  sl.registerFactory(
    () => AllTasksBloc(
        usecase: sl(),
        suggestionsUsecase: sl(),
        filteredTasksUsecase: sl(),
        taskDetailsUsecase: sl(),
        sendQuotationUsecase: sl()),
  );
  sl.registerFactory(
    () => MyServiceBloc(),
  );

  //* Repos
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: sl(),
      auth: sl(),
    ),
  );
  sl.registerLazySingleton<ServiceRepository>(
    () => ServiceRepoImpl(
      networkInfo: sl(),
      service: sl(),
    ),
  );
  sl.registerLazySingleton<CommonRepo>(
    () => CommonRepoImpl(
      networkInfo: sl(),
      datasource: sl(),
    ),
  );
  sl.registerLazySingleton<ContactUsRepo>(
    () => ContactUsRepoImpl(
      networkInfo: sl(),
      datasource: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      networkInfo: sl(),
      db: sl(),
    ),
  );
  sl.registerLazySingleton<DashboardRepo>(
    () => DashboardRepoImpl(
      networkInfo: sl(),
      db: sl(),
    ),
  );
  sl.registerLazySingleton<TasksRepo>(
    () => TasksRepoImpl(
      networkInfo: sl(),
      db: sl(),
    ),
  );

  //* Use Cases
  sl.registerLazySingleton(
    () => RegisterUserUC(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => FetchSkillsUC(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => VerifyOTPUC(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CommonUsecase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ContactUsUsecase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SubmitQueryUsecase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoginUseCase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LanguageUsecase(
      profileRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CountryUsecase(
      profileRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => FetchUserProfileUsecase(
      profileRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateUserProfileUserCase(
      profileRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateUserPasswordUserCase(
      profileRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateUserSkillsUserCase(
      profileRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => NationalityUsecase(
      profileRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => DashboardSummaryUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CheckSubcriptionUsecase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CreateTaskUsecase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => FetchTasksUsecase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => FetchTasksSuggestionsUsecase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => FetchFilteredTasksUsecase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => FetchTaskDetailsUsecase(
      repo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SendQuotationUsecase(
      repo: sl(),
    ),
  );

  //* Data sources
  sl.registerFactory(() => AuthRemoteDatasourceImpl(dio: sl()));
  sl.registerFactory(() => ServiceRemoteDatasourceImpl(dio: sl()));
  sl.registerFactory(() => CommonRemoteDatasourceImpl(dio: sl()));
  sl.registerFactory(() => ContactUsRemoteDbImpl(dio: sl()));
  sl.registerFactory(() => ProfileRemoteDBImpl(dio: sl()));
  sl.registerFactory(() => DashboardRemoteSrcImpl(dio: sl()));
  sl.registerFactory(() => TasksRemoteSrcImpl(dio: sl()));

  //! External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPref);
  sl.registerFactory(() => Connectivity());
  sl.registerFactory(() => Dio(BaseOptions(
        headers: {
          'Content-Type': 'application/json', // Replace with your token
        },
        baseUrl: APIConst.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      )));
}
