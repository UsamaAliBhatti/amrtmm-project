// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/common/data/datasources/remote_datasource.dart';
import 'package:amrtmm_project/app/common/domain/entities/common_entity.dart';
import 'package:amrtmm_project/core/network/network_info.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

import '../../domain/repositories/common_repo.dart';

class CommonRepoImpl extends CommonRepo {
  NetworkInfoImpl networkInfo;
  CommonRemoteDatasourceImpl datasource;
  CommonRepoImpl({
    required this.networkInfo,
    required this.datasource,
  });
  @override
  Future<ApiResponse<CommonEntity>> fetchData(String endPoint) async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await datasource.fetchScreenData(endPoint);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }
}
