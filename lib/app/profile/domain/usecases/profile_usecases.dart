// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/profile/domain/entities/country_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/language_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/nationality_entity.dart';
import 'package:amrtmm_project/app/profile/domain/repos/profile_repo.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:amrtmm_project/core/utils/res/usecase.dart';

import '../entities/user_profile_entity.dart';

class LanguageUsecase extends UseCase<ApiResponse<List<LanguageEntity>>, void> {
  ProfileRepo profileRepo;
  LanguageUsecase({
    required this.profileRepo,
  });
  @override
  Future<ApiResponse<List<LanguageEntity>>> call({void params}) {
    return profileRepo.fetchLanguages();
  }
}

class CountryUsecase extends UseCase<ApiResponse<List<CountryEntity>>, void> {
  ProfileRepo profileRepo;
  CountryUsecase({
    required this.profileRepo,
  });
  @override
  Future<ApiResponse<List<CountryEntity>>> call({void params}) {
    return profileRepo.fetchCountries();
  }
}

class NationalityUsecase
    extends UseCase<ApiResponse<List<NationalityEntity>>, void> {
  ProfileRepo profileRepo;
  NationalityUsecase({
    required this.profileRepo,
  });
  @override
  Future<ApiResponse<List<NationalityEntity>>> call({void params}) {
    return profileRepo.fetchNationalities();
  }
}

class FetchUserProfileUsecase
    extends UseCase<ApiResponse<UserProfileEntity>, String> {
  ProfileRepo profileRepo;
  FetchUserProfileUsecase({
    required this.profileRepo,
  });

  @override
  Future<ApiResponse<UserProfileEntity>> call({String? params}) {
    return profileRepo.fetchUserProfile(accessToken: params ?? '');
  }
}

class UpdateUserProfileUserCase
    extends UseCase<ApiResponse<bool>, Map<String, dynamic>> {
  ProfileRepo profileRepo;
  UpdateUserProfileUserCase({
    required this.profileRepo,
  });

  @override
  Future<ApiResponse<bool>> call({Map<String, dynamic>? params}) {
    return profileRepo.updateUserProfile(userData: params ?? {});
  }
}

class UpdateUserPasswordUserCase extends UseCase<ApiResponse<bool>, String> {
  ProfileRepo profileRepo;
  UpdateUserPasswordUserCase({
    required this.profileRepo,
  });

  @override
  Future<ApiResponse<bool>> call({String? params}) {
    return profileRepo.updateUserPassword(password: params ?? '');
  }
}

class UpdateUserSkillsUserCase
    extends UseCase<ApiResponse<bool>, Map<String, dynamic>> {
  ProfileRepo profileRepo;
  UpdateUserSkillsUserCase({
    required this.profileRepo,
  });

  @override
  Future<ApiResponse<bool>> call({Map<String, dynamic>? params}) {
    return profileRepo.updateUserSkills(skillData: params ?? {});
  }
}
