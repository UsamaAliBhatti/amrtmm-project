class QuotationEntity {
  final int userId;
  final int requestId;
  final String descriptions;
  final double price;
  final int noOfHours;
  final int validity;
  final int quotationStatus;
  final String createdAt;
  final String updatedAt;
  final int id;

  const QuotationEntity({
    required this.userId,
    required this.requestId,
    required this.descriptions,
    required this.price,
    required this.noOfHours,
    required this.validity,
    required this.quotationStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });
}
