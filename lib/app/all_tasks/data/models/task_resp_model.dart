// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amrtmm_project/app/all_tasks/data/models/task_model.dart';
import 'package:amrtmm_project/app/all_tasks/domain/entities/task_resp_entity.dart';

import '../../../service/data/models/skill_model.dart';

class TaskRespModel extends TaskRespEntity {
  TaskRespModel({
    required List<TaskModel> requests,
    required List<SkillModel> skills,
    required int minBudget,
    required int maxBudget,
  }) : super(
            requests: requests,
            skills: skills,
            minBudget: minBudget,
            maxBudget: maxBudget);

  factory TaskRespModel.fromJson(Map<String, dynamic> json) {
    return TaskRespModel(
      requests: (json['requests'] as List?)
              ?.map((request) => TaskModel.fromJson(request))
              .toList() ??
          [],
      skills: (json['skills'] as List?)
              ?.map((skill) => SkillModel.fromJson(skill))
              .toList() ??
          [],
      minBudget: json["min_budget"] ?? 0,
      maxBudget: json["max_budget"] ?? 0,
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      "requests": requests,
      "skills": skills,
      "min_budget": minBudget,
      "max_budget": maxBudget,
    };
  }

  TaskRespEntity toEntity() {
    return TaskRespEntity(
        requests: requests,
        skills: skills,
        minBudget: minBudget,
        maxBudget: maxBudget);
  }
}

class TasksSuggestionsResponse {
  final bool success;
  final List<TaskModel> suggestions;

  TasksSuggestionsResponse({
    required this.success,
    required this.suggestions,
  });

  factory TasksSuggestionsResponse.fromJson(Map<String, dynamic> json) {
    return TasksSuggestionsResponse(
      success: json['success'] ?? false,
      suggestions: (json['suggestions'] as List<dynamic>?)
              ?.map((task) => TaskModel.fromJson(task))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'suggestions': suggestions.map((task) => task.toJson()).toList(),
    };
  }
}

class FilteredTasksResponse {
  final bool success;
  final List<TaskModel> filteredTasks;

  FilteredTasksResponse({
    required this.success,
    required this.filteredTasks,
  });

  factory FilteredTasksResponse.fromJson(Map<String, dynamic> json) {
    return FilteredTasksResponse(
      success: json['success'] ?? false,
      filteredTasks: (json['filtered_requests'] as List<dynamic>?)
              ?.map((task) => TaskModel.fromJson(task))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'filtered_requests': filteredTasks.map((task) => task.toJson()).toList(),
    };
  }
}

class RequestsAPIResponse {
  final bool status;
  final String message;
  final TaskRespEntity data;
  RequestsAPIResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  factory RequestsAPIResponse.fromMap(Map<String, dynamic> map) {
    return RequestsAPIResponse(
      status: map['status'] as bool,
      message: map['message'] as String,
      data: TaskRespModel.fromJson(map['data'] as Map<String, dynamic>)
          .toEntity(),
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  String toJson() => json.encode(toMap());

  factory RequestsAPIResponse.fromJson(String source) =>
      RequestsAPIResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class TaskDetailsResponseModel {
  final bool status;
  final String message;
  final TaskModel task;
  final List<dynamic> quotations;

  TaskDetailsResponseModel({
    required this.status,
    required this.message,
    required this.task,
    required this.quotations,
  });

  factory TaskDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return TaskDetailsResponseModel(
      status: json['status'],
      message: json['message'],
      task: TaskModel.fromJson(json['data']['task']),
      quotations: json['data']['quotations'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": {
        "task": task.toJson(),
        "quotations": quotations,
      },
    };
  }
}
