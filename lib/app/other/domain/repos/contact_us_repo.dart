import 'package:amrtmm_project/app/other/domain/entities/contact_us_entity.dart';
import 'package:amrtmm_project/app/other/domain/entities/query_submisson_entity.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';

abstract class ContactUsRepo {
  Future<ApiResponse<ContactUsEntity>> fetchContactUs();
  Future<ApiResponse<QuerySubmissionEntity>> submitUserQuery(
      {required Map<String, String> queryData});
}
