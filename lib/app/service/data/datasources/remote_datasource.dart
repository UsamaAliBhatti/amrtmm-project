// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:amrtmm_project/app/service/data/models/skill_model.dart';
import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/services/databases/local_db.dart';
import '../../../../core/services/keys/db_keys.dart';

abstract class ServiceRemoteDatasource {
  Future<ApiResponse<List<SkillEntity>>> fetchSkills();
  Future<ApiResponse<bool>> checkSubscription();
  Future<ApiResponse<bool>> createTask(
      {required Map<String, dynamic> taskData});
}

class ServiceRemoteDatasourceImpl extends ServiceRemoteDatasource {
  final Dio dio;
  ServiceRemoteDatasourceImpl({
    required this.dio,
  });
  @override
  Future<ApiResponse<List<SkillEntity>>> fetchSkills() async {
    try {
      final response = await dio.get(
        APIConst.skillsList,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: SkillsResponse.fromJson(response.data).data,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("ENTERING HERE");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<bool>> checkSubscription() async {
    try {
      final accessToken = LocalDB.getString(DBKeys.accessToken);
      final response = await dio.post(
        APIConst.checkSubscription,
        options: Options(
          headers: {'authorization': "Bearer $accessToken"},
        ),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: response.data["message"],
            data: true,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
          status: false,
          message:
              response.data["message"] ?? "Error Occurred! Try again later.",
          statusCode: response.statusCode ?? 300,
          data: false);
    } on DioException catch (e) {
      log(e.response!.data.toString());
      log("ENTERING HERE IN CHECK SUBSCRIPTION");
      return ApiResponse(
        status: false,
        message:
            e.response?.data["message"] ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
        data: false,
      );
    }
  }

  @override
  Future<ApiResponse<bool>> createTask(
      {required Map<String, dynamic> taskData}) async {
    try {
      final accessToken = LocalDB.getString(DBKeys.accessToken);

      final File? file =
          taskData['file'] != null ? taskData['file'] as File : null;

      final data = {
        'title': taskData['title'],
        'date_time': taskData["date"],
        'description': taskData['description'],
        'location': taskData['location'],
        'end_result_description': taskData['result'],
        'my_budget': taskData['budget'],
        'service_type': taskData['serviceType'],
        'skills': taskData['skills'],
        'latitude': "",
        'longitude': "",
        if (file != null) // Only add file if it exists
          "photo_video": await MultipartFile.fromFile(
            file.path,
            filename: "uploaded_file.jpg",
          ),
      };

      final response = await dio.post(
        APIConst.createTask,
        data: data,
        options: Options(
          headers: {'authorization': "Bearer $accessToken"},
        ),
      );
      log(response.statusCode.toString(), name: "CREATE TASK API");
      if (response.statusCode == 201) {
        return ApiResponse(
            status: true,
            message: response.data["message"],
            data: true,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
          status: false,
          message:
              response.data["message"] ?? "Error Occurred! Try again later.",
          statusCode: response.statusCode ?? 300,
          data: false);
    } on DioException catch (e) {
      log(e.response!.data.toString());
      log("ENTERING HERE IN CHECK SUBSCRIPTION");
      return ApiResponse(
        status: false,
        message:
            e.response?.data["message"] ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
        data: false,
      );
    }
  }
}
