class RetailerProfileModel {
  String ?email;
  String? firstName;
  String? lastName;
  String? shopName;
  String? country;
  String? city;
  String? phoneNo;
  String? profilePhoto;
  String? coverPhoto;
  String? sId;
  String? storeAdress;
  String?latitude;
  String ?longitude;

  RetailerProfileModel(
      {this.firstName,
        this.lastName,
        this.shopName,
        this.country,
        this.city,
        this.phoneNo,
        this.profilePhoto,
        this.coverPhoto,
        this.storeAdress,
        this.latitude,
        this.longitude,
        this.sId});

  RetailerProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    shopName = json['shopName'];
    country = json['country'];
    city = json['city'];
    phoneNo = json['phoneNo'];
    profilePhoto = json['profilePhoto'];
    coverPhoto = json['coverPhoto'];
    storeAdress = json['storeAddress'];
    longitude= json['longitude'];
    latitude=json['latitude'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['shopName'] = this.shopName;
    data['country'] = this.country;
    data['city'] = this.city;
    data['phoneNo'] = this.phoneNo;
    data['profilePhoto'] = this.profilePhoto;
    data['coverPhoto'] = this.coverPhoto;
    data['_id'] = this.sId;
    data['email'] = this.email;
    return data;
  }
}
