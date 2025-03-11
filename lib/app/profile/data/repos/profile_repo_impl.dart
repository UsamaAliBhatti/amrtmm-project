// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/profile/data/remote_db/profile_remote_db.dart';
import 'package:amrtmm_project/app/profile/domain/entities/country_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/language_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/nationality_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/user_profile_entity.dart';
import 'package:amrtmm_project/app/profile/domain/repos/profile_repo.dart';
import 'package:amrtmm_project/core/network/network_info.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDBImpl db;
  final NetworkInfoImpl networkInfo;
  ProfileRepoImpl({
    required this.networkInfo,
    required this.db,
  });
  @override
  Future<ApiResponse<List<CountryEntity>>> fetchCountries() async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return db.fetchCountries();
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<List<LanguageEntity>>> fetchLanguages() async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return db.fetchLanguages();
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<UserProfileEntity>> fetchUserProfile(
      {required String accessToken}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return db.fetchUserProfile(accessToken: accessToken);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<bool>> updateUserProfile(
      {required Map<String, dynamic> userData}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return db.updateUserProfile(userData: userData);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<bool>> updateUserPassword(
      {required String password}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return db.updateUserPassword(password: password);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<bool>> updateUserSkills(
      {required Map<String, dynamic> skillData}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return db.updateUserSkills(skillsData: skillData);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<List<NationalityEntity>>> fetchNationalities() async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return db.fetchNationalities();
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }
}
