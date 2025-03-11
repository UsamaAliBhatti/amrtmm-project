// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/all_tasks/domain/entities/task_entity.dart';
import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';

class TaskRespEntity {
  List<TaskEntity> requests;
  List<SkillEntity> skills;
  int minBudget;
  int maxBudget;
  TaskRespEntity({
    required this.requests,
    required this.skills,
    required this.minBudget,
    required this.maxBudget,
  });
}
