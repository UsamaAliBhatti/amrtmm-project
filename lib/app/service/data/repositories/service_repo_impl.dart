// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/service/data/datasources/remote_datasource.dart';
import 'package:amrtmm_project/app/service/domain/entities/skill_entity.dart';
import 'package:amrtmm_project/app/service/domain/repositories/service_repository.dart';
import 'package:amrtmm_project/core/network/network_info.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

class ServiceRepoImpl implements ServiceRepository {
  final NetworkInfoImpl networkInfo;
  final ServiceRemoteDatasourceImpl service;
  ServiceRepoImpl({
    required this.networkInfo,
    required this.service,
  });
  @override
  Future<ApiResponse<List<SkillEntity>>> fetchSkills() async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await service.fetchSkills();
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<bool>> checkSubscription() async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await service.checkSubscription();
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ApiResponse<bool>> createTask(
      {required Map<String, dynamic> data}) async {
    try {
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        return ApiResponse(
          status: false,
          message: "No Internet Connection",
          statusCode: 300,
        );
      }

      return await service.createTask(taskData: data);
    } catch (e) {
      return ApiResponse(
        status: false,
        statusCode: 300,
        message: e.toString(),
      );
    }
  }
}
