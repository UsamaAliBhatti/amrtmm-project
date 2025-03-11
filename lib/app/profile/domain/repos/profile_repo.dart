import 'package:amrtmm_project/app/profile/domain/entities/language_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/nationality_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

import '../entities/country_entity.dart';
import '../entities/user_profile_entity.dart';

abstract class ProfileRepo {
  Future<ApiResponse<List<CountryEntity>>> fetchCountries();
  Future<ApiResponse<List<LanguageEntity>>> fetchLanguages();
  Future<ApiResponse<List<NationalityEntity>>> fetchNationalities();

  Future<ApiResponse<UserProfileEntity>> fetchUserProfile(
      {required String accessToken});
  Future<ApiResponse<bool>> updateUserProfile(
      {required Map<String, dynamic> userData});
  Future<ApiResponse<bool>> updateUserPassword({required String password});
  Future<ApiResponse<bool>> updateUserSkills(
      {required Map<String, dynamic> skillData});
}
