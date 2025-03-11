class SkillEntity {
  final int id;
  final String skillEn;
  final String skillAr;
  final String createdAt;
  final String? updatedAt;
  final int isDeleted;
  final int active;
  final int createdBy;
  final int categoryId;
  final int isSensitive;
  final List<DocumentEntity> documents;

  SkillEntity({
    required this.id,
    required this.skillEn,
    required this.skillAr,
    required this.createdAt,
    this.updatedAt,
    required this.isDeleted,
    required this.active,
    required this.createdBy,
    required this.categoryId,
    required this.isSensitive,
    required this.documents,
  });
}

class DocumentEntity {
  final String documentEn;
  final String documentAr;
  final bool isRequired;

  DocumentEntity({
    required this.documentEn,
    required this.documentAr,
    required this.isRequired,
  });
}
