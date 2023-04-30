

class ProEducationHistoryModel {
  late String? id;
  late String? email;
  late String? school;
  late String? qualification;
  late String? startYear;
  late String? endYear;



  ProEducationHistoryModel({
    this.id,
    this.email,
    this.school,
    this.qualification,
    this.startYear,
    this.endYear,

  });

  ProEducationHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    school = json['school'];
    qualification = json['qualification'];
    startYear = json['startYear'];
    endYear = json['endYear'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['email'] = email;
    _data['school'] = school;
    _data['qualification'] = qualification;
    _data['startYear'] = startYear;
    _data['endYear'] = endYear;
    return _data;
  }
}
