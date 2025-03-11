// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:amrtmm_project/app/profile/data/models/country_model.dart';
import 'package:amrtmm_project/app/profile/data/models/language_model.dart';
import 'package:amrtmm_project/app/profile/data/models/nationality_model.dart';
import 'package:amrtmm_project/app/profile/domain/entities/country_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/language_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/nationality_entity.dart';
import 'package:amrtmm_project/app/profile/domain/entities/user_profile_entity.dart';
import 'package:amrtmm_project/core/services/databases/local_db.dart';
import 'package:amrtmm_project/core/services/keys/db_keys.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/utils/res/api_response.dart';
import '../models/user_profile_model.dart';

abstract class ProfileRemoteDB {
  Future<ApiResponse<List<CountryEntity>>> fetchCountries();
  Future<ApiResponse<List<LanguageEntity>>> fetchLanguages();
  Future<ApiResponse<List<NationalityEntity>>> fetchNationalities();
  Future<ApiResponse<UserProfileEntity>> fetchUserProfile(
      {required String accessToken});

  Future<ApiResponse<bool>> updateUserProfile(
      {required Map<String, dynamic> userData});
  Future<ApiResponse<bool>> updateUserPassword({required String password});
  Future<ApiResponse<bool>> updateUserSkills(
      {required Map<String, dynamic> skillsData});
}

class ProfileRemoteDBImpl extends ProfileRemoteDB {
  final Dio dio;
  ProfileRemoteDBImpl({
    required this.dio,
  });
  @override
  Future<ApiResponse<List<CountryEntity>>> fetchCountries() async {
    try {
      final response = await dio.get(
        APIConst.countries,
      );
      log(response.statusCode.toString(), name: "COUNTRIES API DATA");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: CountryResponseModel.fromJson(response.data).countries,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("FETCH COUNTRIES API CATCH");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<List<LanguageEntity>>> fetchLanguages() async {
    try {
      final response = await dio.get(
        APIConst.languages,
      );
      log(response.statusCode.toString(), name: "LANGUAGES API DATA");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: LanguageResponseModel.fromJson(response.data).languages,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("FETCH LANGUAGES API CATCH");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<UserProfileEntity>> fetchUserProfile(
      {required String accessToken}) async {
    try {
      final response = await dio.get(APIConst.userProfile,
          options: Options(headers: {'authorization': "Bearer $accessToken"}));
      log(response.data.toString(), name: "FETCH USER PROFILE API METHOD");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: UserProfileResponse.fromMap(response.data).oData,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("FETCH USER PROFILE API METHOD");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<bool>> updateUserProfile(
      {required Map<String, dynamic> userData}) async {
    try {
      final accessToken = LocalDB.getString(DBKeys.accessToken);

      final File? file =
          userData['file'] != null ? userData['file'] as File : null;

      final formData = FormData.fromMap({
        "username": userData["name"],
        "gender": userData["gender"],
        "bank_name": userData["bank_name"],
        "account_number": userData["account_number"],
        "account_title": userData["account_title"],
        "swift_number": userData["swift_number"],
        "iban_number": userData["iban_number"],
        "languages": userData["languages"],
        "user_nationality": userData["user_nationality"],
        if (file != null) // Only add file if it exists
          "profile_pic": await MultipartFile.fromFile(
            file.path,
            filename: "uploaded_file.jpg",
          ),
      });

      log(accessToken.toString(), name: "UPDATE USER PROFILE API METHOD");
      final response = await dio.post(APIConst.updateProfile,
          data: formData,
          options: Options(
            headers: {'authorization': "Bearer $accessToken"},
          ));
      log(response.statusCode.toString(),
          name: "UPDATE USER PROFILE API METHOD");

      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: true,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("UPDATE USER PROFILE API METHOD");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<bool>> updateUserPassword(
      {required String password}) async {
    try {
      final accessToken = LocalDB.getString(DBKeys.accessToken);
      log(accessToken ?? "jfdkavcmaviv");

      final response = await dio.post(APIConst.updatePassword,
          data: {"password": password, "password_confirmation": password},
          options: Options(
            headers: {'authorization': "Bearer $accessToken"},
          ));
      log(response.toString(), name: "UPDATE USER PASSWORD API METHOD");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: true,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("UPDATE USER PROFILE API METHOD");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<bool>> updateUserSkills(
      {required Map<String, dynamic> skillsData}) async {
    try {
      final accessToken = LocalDB.getString(DBKeys.accessToken);
      log(accessToken ?? "jfdkavcmaviv");

      final response = await dio.post(APIConst.updateSkills,
          data: skillsData,
          options: Options(
            headers: {'authorization': "Bearer $accessToken"},
          ));
      log(response.toString(), name: "UPDATE USER SKILLS API METHOD");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: true,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("UPDATE USER SKILLS API METHOD");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<List<NationalityEntity>>> fetchNationalities() async {
    try {
      final response = await dio.get(
        APIConst.nationalities,
      );
      log(response.statusCode.toString(), name: "NATIONALITIES API DATA");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data:
                NationlaityResponseModel.fromJson(response.data).nationalities,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("FETCH NATIONALITIES API CATCH");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }
}
