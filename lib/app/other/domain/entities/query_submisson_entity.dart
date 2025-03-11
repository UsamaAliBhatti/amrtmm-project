class QuerySubmissionEntity {
  final bool status;
  final String message;
  final QueryDataEntity data;

  QuerySubmissionEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class QueryDataEntity {
  final String fullName;
  final String email;
  final String contactNumber;
  final String subject;
  final String message;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  QueryDataEntity({
    required this.fullName,
    required this.email,
    required this.contactNumber,
    required this.subject,
    required this.message,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
}
