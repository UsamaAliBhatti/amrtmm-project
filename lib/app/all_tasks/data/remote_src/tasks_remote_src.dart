// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:amrtmm_project/app/all_tasks/data/models/task_resp_model.dart';
import 'package:amrtmm_project/app/all_tasks/domain/entities/task_entity.dart';
import 'package:amrtmm_project/app/all_tasks/domain/entities/task_resp_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/services/databases/local_db.dart';
import '../../../../core/services/keys/db_keys.dart';

abstract class TasksRemoteSrc {
  Future<ApiResponse<TaskRespEntity>> fetchTasks({required String choice});
  Future<ApiResponse<List<TaskEntity>>> fetchTasksSuggestions(
      {required String query});
  Future<ApiResponse<List<TaskEntity>>> fetchFilteredTasks(
      {required Map<String, dynamic> filters});
  Future<ApiResponse<TaskDetailsResponseModel>> fetchTaskDetails(
      {required int id});

  Future<ApiResponse<bool>> sendQuotation({required Map<String, dynamic> data});
}

class TasksRemoteSrcImpl extends TasksRemoteSrc {
  final Dio dio;
  TasksRemoteSrcImpl({
    required this.dio,
  });
  @override
  Future<ApiResponse<TaskRespEntity>> fetchTasks(
      {required String choice}) async {
    try {
      final response = await dio.post(
        APIConst.browseTasks,
        data: {
          "search_type": choice,
        },
      );
      // log(response.data.toString(), name: "TASKS API DATA");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: RequestsAPIResponse.fromMap(response.data).data,
            statusCode: response.statusCode ?? 300);
      }

      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.stackTrace.toString());
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<List<TaskEntity>>> fetchTasksSuggestions(
      {required String query}) async {
    try {
      final response = await dio.post(
        APIConst.tasksSuggestions,
        data: {"search": query},
      );
      // log(response.data.toString(), name: "SUGGESTIONS API DATA");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: TasksSuggestionsResponse.fromJson(response.data).suggestions,
            statusCode: response.statusCode ?? 300);
      }

      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.stackTrace.toString());
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<List<TaskEntity>>> fetchFilteredTasks(
      {required Map<String, dynamic> filters}) async {
    try {
      final response = await dio.post(
        APIConst.filteredTasks,
        data: filters,
      );
      // log(response.data.toString(), name: "Filter API DATA");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: FilteredTasksResponse.fromJson(response.data).filteredTasks,
            statusCode: response.statusCode ?? 300);
      }

      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.stackTrace.toString());
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<TaskDetailsResponseModel>> fetchTaskDetails(
      {required int id}) async {
    try {
      final accessToken = LocalDB.getString(DBKeys.accessToken);

      final response = await dio.get(
        APIConst.taskDetail + id.toString(),
        options: Options(
          headers: {'authorization': "Bearer $accessToken"},
        ),
      );
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: TaskDetailsResponseModel.fromJson(
                response.data as Map<String, dynamic>),
            statusCode: response.statusCode ?? 300);
      }

      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.stackTrace.toString());
      log(e.toString());
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }

  @override
  Future<ApiResponse<bool>> sendQuotation(
      {required Map<String, dynamic> data}) async {
    try {
      final accessToken = LocalDB.getString(DBKeys.accessToken);

      final response = await dio.post(
        APIConst.sendQuotation,
        data: data,
        options: Options(
          headers: {'authorization': "Bearer $accessToken"},
        ),
      );
      if (response.statusCode == 201) {
        return ApiResponse(
            status: true,
            message: "success",
            data: true,
            statusCode: response.statusCode ?? 300);
      }
      if (response.statusCode == 409) {
        return ApiResponse(
          status: false,
          message:
              response.data['message'] ?? "Error Occurred! Try again later.",
          statusCode: response.statusCode ?? 300,
        );
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      return ApiResponse(
        status: false,
        message:
            e.response?.data["message"] ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }
}
