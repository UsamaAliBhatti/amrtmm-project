// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/all_tasks/data/models/task_resp_model.dart';
import 'package:amrtmm_project/app/all_tasks/domain/entities/task_entity.dart';
import 'package:amrtmm_project/app/all_tasks/domain/entities/task_resp_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:amrtmm_project/core/utils/res/usecase.dart';

import '../repos/tasks_repo.dart';

class FetchTasksUsecase extends UseCase<ApiResponse<TaskRespEntity>, String> {
  final TasksRepo repo;
  FetchTasksUsecase({
    required this.repo,
  });
  @override
  Future<ApiResponse<TaskRespEntity>> call({String? params}) {
    return repo.fetchTasks(choice: params ?? "");
  }
}

class FetchTasksSuggestionsUsecase
    extends UseCase<ApiResponse<List<TaskEntity>>, String> {
  final TasksRepo repo;
  FetchTasksSuggestionsUsecase({
    required this.repo,
  });
  @override
  Future<ApiResponse<List<TaskEntity>>> call({String? params}) {
    return repo.fetchTasksSuggestions(query: params ?? "");
  }
}

class FetchFilteredTasksUsecase
    extends UseCase<ApiResponse<List<TaskEntity>>, Map<String, dynamic>> {
  final TasksRepo repo;
  FetchFilteredTasksUsecase({
    required this.repo,
  });
  @override
  Future<ApiResponse<List<TaskEntity>>> call({Map<String, dynamic>? params}) {
    return repo.fetchFilteredTasks(filters: params ?? {});
  }
}

class FetchTaskDetailsUsecase
    extends UseCase<ApiResponse<TaskDetailsResponseModel>, int> {
  final TasksRepo repo;
  FetchTaskDetailsUsecase({
    required this.repo,
  });
  @override
  Future<ApiResponse<TaskDetailsResponseModel>> call({int? params}) {
    return repo.fetchTaskDetails(id: params ?? 0);
  }
}

class SendQuotationUsecase
    extends UseCase<ApiResponse<bool>, Map<String, dynamic>> {
  final TasksRepo repo;
  SendQuotationUsecase({
    required this.repo,
  });
  @override
  Future<ApiResponse<bool>> call({Map<String, dynamic>? params}) {
    return repo.sendQuotation(data: params ?? {});
  }
}
