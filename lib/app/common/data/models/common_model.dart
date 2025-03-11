import 'package:amrtmm_project/app/common/domain/entities/common_entity.dart';

class CommonModel {
  final bool status;
  final String message;
  final DataModel data;

  CommonModel({
    required this.status,
    required this.message,
    required this.data,
  });

  /// Factory method to create a model from JSON
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: DataModel.fromJson(json['data']),
    );
  }

  /// Converts the model to the domain entity
  CommonEntity toEntity() {
    return CommonEntity(
      status: status,
      message: message,
      data: data.toEntity(),
    );
  }
}

class DataModel {
  final int id;
  final String titleEn;
  final String titleAr;
  final String descEn;
  final String descAr;
  final String createdAt;
  final String updatedAt;

  DataModel({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.descEn,
    required this.descAr,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Factory method to create a model from JSON
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'] as int,
      titleEn: json['title_en'] as String,
      titleAr: json['title_ar'] as String,
      descEn: json['desc_en'] as String,
      descAr: json['desc_ar'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  /// Converts the model to the domain entity
  Data toEntity() {
    return Data(
      id: id,
      titleEn: titleEn,
      titleAr: titleAr,
      descEn: descEn,
      descAr: descAr,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
    );
  }
}
