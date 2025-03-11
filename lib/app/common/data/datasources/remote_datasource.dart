// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:amrtmm_project/app/common/data/models/common_model.dart';
import 'package:amrtmm_project/app/common/domain/entities/common_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:dio/dio.dart';

abstract class CommonRemoteDatasource {
  Future<ApiResponse<CommonEntity>> fetchScreenData(String endPoint);
}

class CommonRemoteDatasourceImpl extends CommonRemoteDatasource {
  final Dio dio;
  CommonRemoteDatasourceImpl({
    required this.dio,
  });
  @override
  Future<ApiResponse<CommonEntity>> fetchScreenData(String endPoint) async {
    try {
      log("CALLED THIS METHOD ${endPoint.toString()}");
      final response = await dio.get(
        endPoint,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: CommonModel.fromJson(response.data).toEntity(),
            statusCode: response.statusCode ?? 300);
      }
      return ApiResponse(
        status: false,
        message: response.statusMessage ?? "Error Occurred! Try again later.",
        statusCode: response.statusCode ?? 300,
      );
    } on DioException catch (e) {
      log(e.response!.realUri.toString());
      log("ENTERING HERE");
      return ApiResponse(
        status: false,
        message: e.message ?? "Error Occurred! Try again later.",
        statusCode: e.response?.statusCode ?? 300,
      );
    }
  }
}
