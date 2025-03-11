class TaskEntity {
  final int id;
  final int userId;
  final int serviceProviderId;
  final String title;
  final String dateTime;
  final String location;
  final String description;
  final String endResultDescription;
  final int myBudget;
  final String createdAt;
  final String updatedAt;
  final int requestStatus;
  final String? tags;
  final String requestProgressStatus;
  final double? latitude;
  final double? longitude;
  final int acceptedQuoteId;
  final int isWithdrawMade;
  final String? withdrawRequestedDatetime;
  final String? withdrawApprovedDatetime;
  final int acceptedQuoteCount;
  final int isDirectRequest;
  final String serviceType;
  final String? comment;
  final int requestQuotationCount;
  final List<dynamic> userRequestPhotoVideos;
  final List<dynamic> requesQuotation;

  const TaskEntity({
    required this.id,
    required this.userId,
    required this.serviceProviderId,
    required this.title,
    required this.dateTime,
    required this.location,
    required this.description,
    required this.endResultDescription,
    required this.myBudget,
    required this.createdAt,
    required this.updatedAt,
    required this.requestStatus,
    this.tags,
    required this.requestProgressStatus,
    this.latitude,
    this.longitude,
    required this.acceptedQuoteId,
    required this.isWithdrawMade,
    this.withdrawRequestedDatetime,
    this.withdrawApprovedDatetime,
    required this.acceptedQuoteCount,
    required this.isDirectRequest,
    required this.serviceType,
    this.comment,
    required this.requestQuotationCount,
    required this.requesQuotation,
    required this.userRequestPhotoVideos,
  });
}
