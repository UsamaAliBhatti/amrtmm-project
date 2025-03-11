// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/other/domain/entities/contact_us_entity.dart';
import 'package:amrtmm_project/app/other/domain/entities/query_submisson_entity.dart';
import 'package:amrtmm_project/app/other/domain/repos/contact_us_repo.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

import '../../../../core/network/network_info.dart';
import '../datasources/contact_us_remote_db.dart';

class ContactUsRepoImpl implements ContactUsRepo {
  final NetworkInfoImpl networkInfo;
  final ContactUsRemoteDbImpl datasource;
  ContactUsRepoImpl({
    required this.networkInfo,
    required this.datasource,
  });
  @override
  Future<ApiResponse<ContactUsEntity>> fetchContactUs() async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await datasource.fetchContactUs();
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<QuerySubmissionEntity>> submitUserQuery(
      {required Map<String, String> queryData}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await datasource.submitUserQuery(queryData: queryData);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }
}
