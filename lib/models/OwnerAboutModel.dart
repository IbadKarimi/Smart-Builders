class OwnerAboutModel {
  String? about;
  String? email;

  OwnerAboutModel({this.about, this.email});

  OwnerAboutModel.fromJson(Map<String, dynamic> json) {
    about = json['ownerAbout'];
    email = json['ownerEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = new Map<String, dynamic>();
    _data['ownerAbout'] = this.about;
    _data['ownerEmail'] = this.email;
    return _data;
  }
}