import 'package:amrtmm_project/app/all_tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required int id,
    required int userId,
    required int serviceProviderId,
    required String title,
    required String dateTime,
    required String location,
    required String description,
    required String endResultDescription,
    required int myBudget,
    required String createdAt,
    required String updatedAt,
    required int requestStatus,
    String? tags,
    required String requestProgressStatus,
    double? latitude,
    double? longitude,
    required int acceptedQuoteId,
    required int isWithdrawMade,
    String? withdrawRequestedDatetime,
    String? withdrawApprovedDatetime,
    required int acceptedQuoteCount,
    required int isDirectRequest,
    required String serviceType,
    String? comment,
    required int requestQuotationCount,
    required List<dynamic> userRequestPhotoVideos,
    required List<dynamic> requesQuotation,
  }) : super(
            id: id,
            userId: userId,
            serviceProviderId: serviceProviderId,
            title: title,
            dateTime: dateTime,
            location: location,
            description: description,
            endResultDescription: endResultDescription,
            myBudget: myBudget,
            createdAt: createdAt,
            updatedAt: updatedAt,
            requestStatus: requestStatus,
            tags: tags,
            requestProgressStatus: requestProgressStatus,
            latitude: latitude,
            longitude: longitude,
            acceptedQuoteId: acceptedQuoteId,
            isWithdrawMade: isWithdrawMade,
            withdrawRequestedDatetime: withdrawRequestedDatetime,
            withdrawApprovedDatetime: withdrawApprovedDatetime,
            acceptedQuoteCount: acceptedQuoteCount,
            isDirectRequest: isDirectRequest,
            serviceType: serviceType,
            comment: comment,
            requestQuotationCount: requestQuotationCount,
            requesQuotation: requesQuotation,
            userRequestPhotoVideos: userRequestPhotoVideos);

  /// Convert JSON to Model
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"],
      userId: json["user_id"],
      serviceProviderId: json["service_provider_id"],
      title: json["title"],
      dateTime: json["date_time"],
      location: json["location"],
      description: json["description"] ?? '',
      endResultDescription: json["end_result_description"] ?? '',
      myBudget: json["my_budget"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      requestStatus: json["request_status"],
      tags: json["tags"],
      requestProgressStatus: json["request_progress_status"],
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      acceptedQuoteId: json["accepted_quote_id"],
      isWithdrawMade: json["is_withdraw_made"],
      withdrawRequestedDatetime: json["withdraw_requested_datetime"],
      withdrawApprovedDatetime: json["withdraw_approved_datetime"],
      acceptedQuoteCount: json["accepted_quote_count"],
      isDirectRequest: json["is_direct_request"],
      serviceType: json["service_type"],
      comment: json["comment"],
      requestQuotationCount:
          json["request_quotation_count"] ?? 0, // Fixed key typo
      userRequestPhotoVideos:
          json['user_request_photo_videos'] ?? [], // Ensuring a list
      requesQuotation: json['reques_quotation'] ?? [], // Ensuring a list
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "service_provider_id": serviceProviderId,
      "title": title,
      "date_time": dateTime,
      "location": location,
      "description": description,
      "end_result_description": endResultDescription,
      "my_budget": myBudget,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "request_status": requestStatus,
      "tags": tags,
      "request_progress_status": requestProgressStatus,
      "latitude": latitude,
      "longitude": longitude,
      "accepted_quote_id": acceptedQuoteId,
      "is_withdraw_made": isWithdrawMade,
      "withdraw_requested_datetime": withdrawRequestedDatetime,
      "withdraw_approved_datetime": withdrawApprovedDatetime,
      "accepted_quote_count": acceptedQuoteCount,
      "is_direct_request": isDirectRequest,
      "service_type": serviceType,
      "comment": comment,
      "request_quotation_count": requestQuotationCount, // Fixed key typo
      "user_request_photo_videos": userRequestPhotoVideos,
      "reques_quotation": requesQuotation,
    };
  }
}
