class LanguageEntity {
  final int id;
  final String nameEn;
  final String nameAr;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const LanguageEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
