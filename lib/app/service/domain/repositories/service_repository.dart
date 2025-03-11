import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';

import '../../../../core/utils/res/api_response.dart';

abstract class ServiceRepository {
  Future<ApiResponse<List<SkillEntity>>> fetchSkills();
  Future<ApiResponse<bool>> checkSubscription();
  Future<ApiResponse<bool>> createTask({required Map<String, dynamic> data});
}
