

class OwnerSignUpModel {
  late String? id;
  late String? firstName;
  late String? lastName;
  late String? email;
  late String? password;
  late String? role;


  OwnerSignUpModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.role,
  });

  OwnerSignUpModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    role=json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] =lastName;
    _data['email'] = email;
    _data['password'] = password;
    _data['role'] = role;
    return _data;
  }
}
