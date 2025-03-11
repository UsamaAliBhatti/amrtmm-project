import '../../domain/entities/query_submisson_entity.dart';

class QuerySubmissionModel {
  final bool status;
  final String message;
  final QueryDataModel data;

  QuerySubmissionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  // Factory method to deserialize JSON into the model
  factory QuerySubmissionModel.fromJson(Map<String, dynamic> json) {
    return QuerySubmissionModel(
      status: json['status'],
      message: json['message'],
      data: QueryDataModel.fromJson(json['oData']),
    );
  }

  // Method to map model to entity
  QuerySubmissionEntity toEntity() {
    return QuerySubmissionEntity(
      status: status,
      message: message,
      data: data.toEntity(),
    );
  }
}

class QueryDataModel {
  final String fullName;
  final String email;
  final String contactNumber;
  final String subject;
  final String message;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  QueryDataModel({
    required this.fullName,
    required this.email,
    required this.contactNumber,
    required this.subject,
    required this.message,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  // Factory method to deserialize JSON into the model
  factory QueryDataModel.fromJson(Map<String, dynamic> json) {
    return QueryDataModel(
      fullName: json['full_name'],
      email: json['email'],
      contactNumber: json['contact_num'],
      subject: json['contact_us_subject'],
      message: json['contact_us_message'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
    );
  }

  // Method to map model to entity
  QueryDataEntity toEntity() {
    return QueryDataEntity(
      fullName: fullName,
      email: email,
      contactNumber: contactNumber,
      subject: subject,
      message: message,
      updatedAt: updatedAt,
      createdAt: createdAt,
      id: id,
    );
  }
}
