// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';
import 'package:amrtmm_project/app/service/domain/repositories/service_repository.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:amrtmm_project/core/utils/res/usecase.dart';

class FetchSkillsUC implements UseCase<ApiResponse<List<SkillEntity>>, void> {
  final ServiceRepository repo;
  FetchSkillsUC({
    required this.repo,
  });
  @override
  Future<ApiResponse<List<SkillEntity>>> call({void params}) {
    return repo.fetchSkills();
  }
}

class CheckSubcriptionUsecase implements UseCase<ApiResponse<bool>, void> {
  final ServiceRepository repo;
  CheckSubcriptionUsecase({
    required this.repo,
  });
  @override
  Future<ApiResponse<bool>> call({void params}) {
    return repo.checkSubscription();
  }
}

class CreateTaskUsecase
    extends UseCase<ApiResponse<bool>, Map<String, dynamic>> {
  final ServiceRepository repo;

  CreateTaskUsecase({required this.repo});
  @override
  Future<ApiResponse<bool>> call({Map<String, dynamic>? params}) {
    return repo.createTask(data: params ?? {});
  }
}
