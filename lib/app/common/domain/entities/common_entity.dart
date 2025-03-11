class CommonEntity {
  final bool status;
  final String message;
  final Data data;

  CommonEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class Data {
  final int id;
  final String titleEn;
  final String titleAr;
  final String descEn;
  final String descAr;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.descEn,
    required this.descAr,
    required this.createdAt,
    required this.updatedAt,
  });
}
