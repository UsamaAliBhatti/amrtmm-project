import 'dart:convert';
import 'dart:developer';

import '../../domain/entities/skill_entity.dart';

class SkillModel extends SkillEntity {
  SkillModel({
    required int id,
    required String skillEn,
    required String skillAr,
    required String createdAt,
    String? updatedAt,
    required int isDeleted,
    required int active,
    required int createdBy,
    required int categoryId,
    required int isSensitive,
    required List<DocumentEntity> documents,
  }) : super(
          id: id,
          skillEn: skillEn,
          skillAr: skillAr,
          createdAt: createdAt,
          updatedAt: updatedAt,
          isDeleted: isDeleted,
          active: active,
          createdBy: createdBy,
          categoryId: categoryId,
          isSensitive: isSensitive,
          documents: documents,
        );

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      id: json['id'].runtimeType == int ? json['id'] : int.parse(json['id']),
      skillEn: json['skill_en'],
      skillAr: json['skill_ar'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isDeleted: json['is_deleted'].runtimeType == int
          ? json['is_deleted']
          : int.parse(json['is_deleted']),
      active: json['active'].runtimeType == int
          ? json['active']
          : int.parse(json['active']),
      createdBy: json['created_by'].runtimeType == int
          ? json['created_by']
          : int.parse(json['created_by']),
      categoryId: json['category_id'].runtimeType == String
          ? int.parse(json['category_id'])
          : json['category_id'],
      isSensitive: json['is_sensitive'].runtimeType == int
          ? json['is_sensitive']
          : int.parse(json['is_sensitive'].toString().isEmpty ? "0" : "0"),
      documents: _parseDocuments(json['documents']),
    );
  }

  static List<DocumentEntity> _parseDocuments(dynamic documents) {
    if (documents is List) {
      // Case 1: If documents is already a List
      return documents.map((doc) => DocumentModel.fromJson(doc)).toList();
    } else if (documents is String && documents.isNotEmpty) {
      try {
        // Case 2: If documents is a String, try decoding it
        final decodedDocs = jsonDecode(documents);
        if (decodedDocs is List) {
          return decodedDocs.map((doc) => DocumentModel.fromJson(doc)).toList();
        }
      } catch (e) {
        log("Error parsing documents: $e"); // Handle error gracefully
      }
    }
    return []; // Default case: return empty list
  }

  SkillEntity toEntity() {
    return SkillEntity(
        id: id,
        skillEn: skillEn,
        skillAr: skillAr,
        createdAt: createdAt,
        isDeleted: isDeleted,
        active: active,
        createdBy: createdBy,
        categoryId: categoryId,
        isSensitive: isSensitive,
        documents: documents);
  }
}

class DocumentModel extends DocumentEntity {
  DocumentModel({
    required String documentEn,
    required String documentAr,
    required bool isRequired,
  }) : super(
          documentEn: documentEn,
          documentAr: documentAr,
          isRequired: isRequired,
        );

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      documentEn: json['document_en'],
      documentAr: json['document_ar'],
      isRequired: json['is_required'] == 1,
    );
  }
}

// Top-level Function to Parse the Response
class SkillsResponse {
  final bool status;
  final String message;
  final List<SkillModel> data;

  SkillsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SkillsResponse.fromJson(Map<String, dynamic> json) {
    return SkillsResponse(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>)
          .map((item) => SkillModel.fromJson(item))
          .toList(),
    );
  }
}
