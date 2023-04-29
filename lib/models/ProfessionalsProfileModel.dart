

class ProfessionalsProfileModel {
  late String? id;
  late String? firstName;
  late String? lastName;
  late String? title;
  late String ? email;
  late String ? companyName;
  late String? country;
  late String? city;
  late String? zipPostalCode;
  late String? streetAddress;
  late String? phoneNo;
  late String? cnicNo;
  late String? ntnNo;
  late String? uploadPhoto;
  late String? uploadCnicPhoto;
  late String ?uploadCoverPhoto;
  late String ? timeNow;
  late String ?about;
  late String? licenseNo;
  late String? permitNo;
  ProfessionalsProfileModel({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.companyName,
    this.country,
    this.city,
    this.zipPostalCode,
    this.streetAddress,
    this.phoneNo,
    this.cnicNo,
    this.ntnNo,
    this.permitNo,
    this.licenseNo,
    this.uploadPhoto,
    this.uploadCnicPhoto,
    this.uploadCoverPhoto,
    this.timeNow,
    this.about,
  });
  ProfessionalsProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
     title= json['title'];
    email= json['email'];
    companyName= json['companyName'];
    country=json['country'];
    city=json['city'];
    zipPostalCode=json['zipPostalCode'];
    streetAddress=json['streetAddress'];
    phoneNo=json['phoneNo'];
    cnicNo=json['cnicNo'];
    ntnNo=json['ntnNo'];
    licenseNo=json['licenseNo'];
    permitNo=json['permitNo'];
    uploadPhoto=json['uploadPhoto'];
    uploadCnicPhoto=json['uploadCnicPhoto'];
    uploadCoverPhoto=json['uploadCoverPhoto'];
    timeNow= json['timeNow'];
    about= json['ownerAbout'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] =lastName;
    _data['email'] =email;
    _data['companyName'] = companyName;
    _data['country'] = country;
    _data['city'] = city;
    _data['zipPostalCode'] = zipPostalCode;
    _data['streetAddress'] = streetAddress;
    _data['phoneNo'] = phoneNo;
    _data['cnicNo'] = cnicNo;
    _data['ntnNo'] = ntnNo;
    _data['licenseNo'] = licenseNo;
    _data['permitNo'] = permitNo;
    _data['uploadPhoto'] = uploadPhoto;
    _data['uploadCnicPhoto'] = uploadCnicPhoto;
    _data['uploadCoverPhoto'] = uploadCoverPhoto;
    _data['timeNow'] =timeNow;
    _data['ownerAbout'] =about;
    return _data;
  }
}
