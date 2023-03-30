

class OwnerModelProfile {
  late String? id;
  late String? firstName;
  late String? lastName;
  late String? country;
  late String? city;
  late String? zipPostalCode;
  late String? streetAddress;
  late String? phoneNo;
  late String? cnicNo;
  late String? ntnNo;
  late String? uploadPhoto;
  late String? uploadCnicPhoto;




  OwnerModelProfile({
    this.id,
    this.firstName,
    this.lastName,
    this.country,
    this.city,
    this.zipPostalCode,
    this.streetAddress,
    this.phoneNo,
    this.cnicNo,
    this.ntnNo,
    this.uploadPhoto,
    this.uploadCnicPhoto,
  });

  OwnerModelProfile.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    country=json['country'];
    city=json['city'];
    zipPostalCode=json['zipPostalCode'];
    streetAddress=json['streetAddress'];
    phoneNo=json['phoneNo'];
    cnicNo=json['cnicNo'];
    ntnNo=json['ntnNo'];
    uploadPhoto=json['uploadPhoto'];
    uploadCnicPhoto=json['uploadCnicPhoto'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] =lastName;
    _data['country'] = country;
    _data['city'] = city;
    _data['zipPostalCode'] = zipPostalCode;
    _data['streetAddress'] = streetAddress;
    _data['phoneNo'] = phoneNo;
    _data['cnicNo'] = cnicNo;
    _data['ntnNo'] = ntnNo;
    _data['uploadPhoto'] = uploadPhoto;
    _data['uploadCnicPhoto'] = uploadCnicPhoto;
    return _data;
  }
}
