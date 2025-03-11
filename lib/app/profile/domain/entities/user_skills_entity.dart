import '../../../service/domain/entities/skill_entity.dart';

class UserSkillEntity {
  final String skillId;
  final String skillName;
  final String isVerified;
  final List<dynamic> modifiedDoc;
  final SkillEntity skill;

  const UserSkillEntity({
    required this.skillId,
    required this.skillName,
    required this.isVerified,
    required this.modifiedDoc,
    required this.skill,
  });
}
