// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:amrtmm_project/app/other/data/models/contact_us_model.dart';
import 'package:amrtmm_project/app/other/data/models/query_submisson_model.dart';
import 'package:amrtmm_project/app/other/domain/entities/contact_us_entity.dart';
import 'package:amrtmm_project/app/other/domain/entities/query_submisson_entity.dart';
import 'package:amrtmm_project/core/constants/api_constants.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:dio/dio.dart';

abstract class ContactUsRemoteDb {
  Future<ApiResponse<ContactUsEntity>> fetchContactUs();
  Future<ApiResponse<QuerySubmissionEntity>> submitUserQuery(
      {required Map<String, String> queryData});
}

class ContactUsRemoteDbImpl implements ContactUsRemoteDb {
  final Dio dio;
  ContactUsRemoteDbImpl({
    required this.dio,
  });
  @override
  Future<ApiResponse<ContactUsEntity>> fetchContactUs() async {
    try {
      final response = await dio.get(
        APIConst.contactUs,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: ContactUsModel.fromJson(response.data).toEntity(),
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

  @override
  Future<ApiResponse<QuerySubmissionEntity>> submitUserQuery(
      {required Map<String, String> queryData}) async {
    try {
      final response = await dio.post(APIConst.saveQuery, data: queryData);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return ApiResponse(
            status: true,
            message: "success",
            data: QuerySubmissionModel.fromJson(response.data).toEntity(),
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
