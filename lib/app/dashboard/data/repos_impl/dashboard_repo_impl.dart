// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/dashboard/data/datasources/dashboard_remote_src.dart';
import 'package:amrtmm_project/app/dashboard/domain/entities/dashboard_summary_entity.dart';
import 'package:amrtmm_project/app/dashboard/domain/repos/dashboard_repo.dart';
import 'package:amrtmm_project/core/network/network_info.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

class DashboardRepoImpl extends DashboardRepo {
  final DashboardRemoteSrcImpl db;
  final NetworkInfoImpl networkInfo;
  DashboardRepoImpl({
    required this.db,
    required this.networkInfo,
  });
  @override
  Future<ApiResponse<DashboardSummaryEntity>> fetchDashboardSummary() async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return db.fetchDashboardSummary();
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }
}
