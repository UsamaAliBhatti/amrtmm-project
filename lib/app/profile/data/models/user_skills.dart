import 'package:amrtmm_project/app/profile/domain/entities/user_skills_entity.dart';

import '../../../service/data/models/skill_model.dart';

class UserSkillsModel extends UserSkillEntity {
  UserSkillsModel({
    required String skillId,
    required String skillName,
    required String isVerified,
    required List<dynamic> modifiedDoc,
    required SkillModel skill,
  }) : super(
            skill: skill.toEntity(),
            skillName: skillName,
            isVerified: isVerified,
            modifiedDoc: modifiedDoc,
            skillId: skillId);

  factory UserSkillsModel.fromJson(Map<String, dynamic> json) =>
      UserSkillsModel(
        skillId: json["skill_id"],
        skillName: json["skill_name"],
        isVerified: json["is_verified"],
        modifiedDoc: List<dynamic>.from(json["modified_doc"].map((x) => x)),
        skill: SkillModel.fromJson(json["skill"]),
      );

  Map<String, dynamic> toJson() => {
        "skill_id": skillId,
        "skill_name": skillName,
        "is_verified": isVerified,
        "modified_doc": List<dynamic>.from(modifiedDoc.map((x) => x)),
        "skill": skill,
      };
}
