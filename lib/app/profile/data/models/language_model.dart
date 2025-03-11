// data/models/language_model.dart
import 'package:amrtmm_project/app/profile/domain/entities/language_entity.dart';

class LanguageModel extends LanguageEntity {
  LanguageModel({
    required int id,
    required String nameEn,
    required String nameAr,
    required int status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          id: id,
          nameEn: nameEn,
          nameAr: nameAr,
          status: status,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['id'],
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  LanguageEntity toEntity(LanguageModel model) {
    return LanguageEntity(
      id: model.id,
      nameEn: model.nameEn,
      nameAr: model.nameAr,
      status: model.status,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}

class LanguageResponseModel {
  final bool status;
  final String message;
  final List<LanguageEntity> languages;

  LanguageResponseModel({
    required this.status,
    required this.message,
    required this.languages,
  });

  factory LanguageResponseModel.fromJson(Map<String, dynamic> json) {
    return LanguageResponseModel(
      status: json['status'],
      message: json['message'],
      languages: (json['oData'] as List)
          .map((e) => LanguageModel.fromJson(e))
          .toList(),
    );
  }
}
