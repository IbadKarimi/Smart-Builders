class ProjectPortfolioModel {
  String? email;
  String? firstName;
  String? lastName;
  String? country;
  String? city;
  String? projectTitle;
  String? housePhoto;
  String? sId;
  String? construct;
  String ?address;
  String ?profilePhoto;
  ProjectPortfolioModel(
      {this.email,
        this.firstName,
        this.lastName,
        this.country,
        this.city,
        this.projectTitle,
        this.housePhoto,
        this.address,
        this.sId,
        this.construct,
        this.profilePhoto
       });

  ProjectPortfolioModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    country = json['country'];
    city = json['city'];
    projectTitle = json['projectTitle'];
    housePhoto = json['housePhoto'];
    sId = json['_id'];
    construct = json['construct'];
    address = json[' address '];
    profilePhoto  = json['profilePhoto'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['country'] = this.country;
    data['city'] = this.city;
    data['projectTitle'] = this.projectTitle;
    data['housePhoto'] = this.housePhoto;
    data['_id'] = this.sId;

    data['construct'] = this.construct;
    data['address'] = this.address;
    data['profilePhoto'] = this.profilePhoto;
    return data;
  }
}