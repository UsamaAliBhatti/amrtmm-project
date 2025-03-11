// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:amrtmm_project/app/all_tasks/data/models/task_resp_model.dart';
import 'package:amrtmm_project/app/all_tasks/data/remote_src/tasks_remote_src.dart';
import 'package:amrtmm_project/app/all_tasks/domain/entities/task_entity.dart';
import 'package:amrtmm_project/app/all_tasks/domain/entities/task_resp_entity.dart';
import 'package:amrtmm_project/app/all_tasks/domain/repos/tasks_repo.dart';
import 'package:amrtmm_project/core/network/network_info.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

class TasksRepoImpl extends TasksRepo {
  final NetworkInfoImpl networkInfo;
  final TasksRemoteSrcImpl db;
  TasksRepoImpl({
    required this.networkInfo,
    required this.db,
  });
  @override
  Future<ApiResponse<TaskRespEntity>> fetchTasks(
      {required String choice}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await db.fetchTasks(choice: choice);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<List<TaskEntity>>> fetchTasksSuggestions(
      {required String query}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await db.fetchTasksSuggestions(query: query);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<List<TaskEntity>>> fetchFilteredTasks(
      {required Map<String, dynamic> filters}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await db.fetchFilteredTasks(filters: filters);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<TaskDetailsResponseModel>> fetchTaskDetails(
      {required int id}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await db.fetchTaskDetails(id: id);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<bool>> sendQuotation(
      {required Map<String, dynamic> data}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await db.sendQuotation(data: data);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }
}
