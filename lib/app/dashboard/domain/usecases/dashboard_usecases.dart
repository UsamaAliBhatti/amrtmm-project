import 'package:amrtmm_project/app/dashboard/domain/entities/dashboard_summary_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:amrtmm_project/core/utils/res/usecase.dart';

import '../repos/dashboard_repo.dart';

class DashboardSummaryUseCase
    extends UseCase<ApiResponse<DashboardSummaryEntity>, void> {
  final DashboardRepo repository;

  DashboardSummaryUseCase({required this.repository});

  @override
  Future<ApiResponse<DashboardSummaryEntity>> call({void params}) {
    return repository.fetchDashboardSummary();
  }
}
