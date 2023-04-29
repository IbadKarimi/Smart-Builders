class OwnerAboutModel {
  String? about;
  String? email;

  OwnerAboutModel({this.about, this.email});

  OwnerAboutModel.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = new Map<String, dynamic>();
    _data['about'] = this.about;
    _data['email'] = this.email;
    return _data;
  }
}