// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amrtmm_project/app/other/domain/entities/contact_us_entity.dart';
import 'package:amrtmm_project/app/other/domain/entities/query_submisson_entity.dart';
import 'package:amrtmm_project/app/other/domain/repos/contact_us_repo.dart';
import 'package:amrtmm_project/core/utils/res/api_response.dart';
import 'package:amrtmm_project/core/utils/res/usecase.dart';

class ContactUsUsecase implements UseCase<ApiResponse<ContactUsEntity>, void> {
  ContactUsRepo repo;
  ContactUsUsecase({
    required this.repo,
  });
  @override
  Future<ApiResponse<ContactUsEntity>> call({void params}) {
    return repo.fetchContactUs();
  }
}

class SubmitQueryUsecase
    implements
        UseCase<ApiResponse<QuerySubmissionEntity>, Map<String, String>> {
  ContactUsRepo repo;
  SubmitQueryUsecase({
    required this.repo,
  });

  @override
  Future<ApiResponse<QuerySubmissionEntity>> call(
      {Map<String, String>? params}) {
    return repo.submitUserQuery(queryData: params ?? {});
  }
}
