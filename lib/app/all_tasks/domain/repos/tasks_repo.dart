import 'package:amrtmm_project/app/all_tasks/data/models/task_resp_model.dart';
import 'package:amrtmm_project/app/all_tasks/domain/entities/task_resp_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

import '../entities/task_entity.dart';

abstract class TasksRepo {
  Future<ApiResponse<TaskRespEntity>> fetchTasks({required String choice});
  Future<ApiResponse<List<TaskEntity>>> fetchTasksSuggestions(
      {required String query});
  Future<ApiResponse<List<TaskEntity>>> fetchFilteredTasks(
      {required Map<String, dynamic> filters});
  Future<ApiResponse<TaskDetailsResponseModel>> fetchTaskDetails(
      {required int id});
  Future<ApiResponse<bool>> sendQuotation({required Map<String, dynamic> data});
}
