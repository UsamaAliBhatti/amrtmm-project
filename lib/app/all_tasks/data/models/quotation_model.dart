import 'package:amrtmm_project/app/all_tasks/domain/entities/quotation_entity.dart';

class QuotationModel extends QuotationEntity {
  const QuotationModel({
    required int userId,
    required int requestId,
    required String descriptions,
    required double price,
    required int noOfHours,
    required int validity,
    required int quotationStatus,
    required String createdAt,
    required String updatedAt,
    required int id,
  }) : super(
          userId: userId,
          requestId: requestId,
          descriptions: descriptions,
          price: price,
          noOfHours: noOfHours,
          validity: validity,
          quotationStatus: quotationStatus,
          createdAt: createdAt,
          updatedAt: updatedAt,
          id: id,
        );

  /// Convert JSON to Model
  factory QuotationModel.fromJson(Map<String, dynamic> json) {
    return QuotationModel(
      userId: json["user_id"],
      requestId: int.parse(json["request_id"]),
      descriptions: json["descriptions"],
      price: double.parse(json["price"]),
      noOfHours: int.parse(json["no_of_hours"]),
      validity: int.parse(json["validity"]),
      quotationStatus: json["quotation_status"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      id: json["id"],
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "request_id": requestId.toString(),
      "descriptions": descriptions,
      "price": price.toString(),
      "no_of_hours": noOfHours.toString(),
      "validity": validity.toString(),
      "quotation_status": quotationStatus,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "id": id,
    };
  }
}
