// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:amrtmm_project/app/dashboard/data/models/dashboard_summary_model.dart';
import 'package:amrtmm_project/app/dashboard/domain/entities/dashboard_summary_entity.dart';
import 'package:amrtmm_project/core/services/databases/local_db.dart';
import 'package:amrtmm_project/core/services/keys/db_keys.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';

abstract class DashboardRemoteSrc {
  Future<ApiResponse<DashboardSummaryEntity>> fetchDashboardSummary();
}

class DashboardRemoteSrcImpl extends DashboardRemoteSrc {
  final Dio dio;
  DashboardRemoteSrcImpl({
    required this.dio,
  });
  @override
  Future<ApiResponse<DashboardSummaryEntity>> fetchDashboardSummary() async {
    try {
      final accessToken = LocalDB.getString(DBKeys.accessToken);
      log(accessToken ?? "", name: "FETCH USER DASHBOARD SUMMARY API METHOD");
      final response = await dio.post(APIConst.dashboardSummary,
          options: Options(headers: {'authorization': "Bearer $accessToken"}));
      log(response.data.toString(),
          name: "FETCH USER DASHBOARD SUMMARY API METHOD");
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: DashboardSummaryResponse.fromMap(response.data).oData,
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response?.realUri.toString() ?? "");
      log("FETCH USER DASHBOARD SUMMARY API METHOD");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }
}
