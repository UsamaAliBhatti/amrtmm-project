import 'package:amrtmm_project/app/common/domain/entities/common_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

abstract class CommonRepo {
  Future<ApiResponse<CommonEntity>> fetchData(String endPoint);
}
