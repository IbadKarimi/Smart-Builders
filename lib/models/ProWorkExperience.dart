

class ProWorkExperienceModel {
  late String? id;
  late String? email;
  late String? companyName;
  late String? experience;
  late String? title;


  ProWorkExperienceModel({
    this.id,
    this.email,
    this.companyName,
    this.experience,
    this.title,

  });

  ProWorkExperienceModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    companyName = json['companyName'];
    experience = json['experience'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['email'] = email;
    _data['companyName'] = companyName;
    _data['experience'] = experience;
    _data['title'] = title;
    return _data;
  }
}
