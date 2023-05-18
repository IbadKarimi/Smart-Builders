class OfferProposalsModel {
  String? id;
  String? proposalId;
  String? proEmail;
  String? proFirstName;
  String? proLastName;
  String? proCity;
  String? proCountry;
  String? profilePicUrl;
  String? offer;
  String? offerCreatedTime;
  String? offerSavedDate;
  String? offerStatus;
  String? projectTitle;
  String? ownerEmail;

  OfferProposalsModel({
    this.id,
    this.proposalId,
    this.proEmail,
    this.proFirstName,
    this.proLastName,
    this.proCity,
    this.proCountry,
    this.profilePicUrl,
    this.offer,
    this.offerCreatedTime,
    this.offerSavedDate,
    this.offerStatus,
    this.projectTitle,
    this.ownerEmail,
  });

  OfferProposalsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    proposalId = json['proposalId'];
    proEmail = json['proEmail'];
    proFirstName = json['proFirstName'];
    proLastName = json['proLastName'];
    proCity = json['proCity'];
    proCountry = json['proCountry'];
    profilePicUrl = json['profilePicUrl'];
    offer = json['offer'];
    offerCreatedTime = json['offerCreatedTime'];
    offerSavedDate = json['offerSavedDate'];
    offerStatus = json['offerStatus'];
    projectTitle = json['projectTitle'];
    ownerEmail = json['ownerEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = new Map<String, dynamic>();
    _data['id'] = this.id;
    _data['proposalId'] = this.proposalId;
    _data['proEmail'] = this.proEmail;
    _data['proFirstName'] = this.proFirstName;
    _data['proLastName'] = this.proLastName;
    _data['proCity'] = this.proCity;
    _data['proCountry'] = this.proCountry;
    _data['profilePicUrl'] = this.profilePicUrl;
    _data['offer'] = this.offer;
    _data['offerCreatedTime'] = this.offerCreatedTime;
    _data['offerSavedDate'] = this.offerSavedDate;
    _data['offerStatus'] = this.offerStatus;
    _data['projectTitle'] = this.projectTitle;
    _data['ownerEmail'] = this.ownerEmail;
    return _data;
  }
}
