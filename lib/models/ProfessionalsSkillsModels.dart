

class ProSkillsModel {
  late String? id;
  late String? email;
  late String? skills;


  ProSkillsModel ({
    this.id,
    this.email,
    this.skills,

  });

  ProSkillsModel .fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    skills = json['skills'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['email'] = email;
    _data['skills'] = skills;

    return _data;
  }
}
