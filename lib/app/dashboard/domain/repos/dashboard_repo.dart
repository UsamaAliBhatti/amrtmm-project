import 'package:amrtmm_project/app/dashboard/domain/entities/dashboard_summary_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

abstract class DashboardRepo {
  Future<ApiResponse<DashboardSummaryEntity>> fetchDashboardSummary();
}
