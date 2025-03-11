// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/common/domain/entities/common_entity.dart';
import 'package:amrtmm_project/app/common/domain/repositories/common_repo.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:amrtmm_project/core/utils/res/usecase.dart';

import '../../../../core/constants/api_constants.dart';

class CommonUsecase implements UseCase<ApiResponse<CommonEntity>, String> {
  final CommonRepo repo;
  CommonUsecase({
    required this.repo,
  });
  @override
  Future<ApiResponse<CommonEntity>> call({String? params}) {
    return repo.fetchData(params ?? APIConst.aboutUs);
  }
}
