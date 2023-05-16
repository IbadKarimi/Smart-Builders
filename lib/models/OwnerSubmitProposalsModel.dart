class OwnerSubmitProposalsModel {
  String? email;
  String? to;
  String? sId;
  String? projectTitle;
  String? projectType;
  String? workMonths;
  String?projectBudget;
  String? plotLengthA;
  String? plotLengthB;
  String? plotWidthA;
  String? plotWidthB;
  String? actualPlotSize;
  String? floors;
  String? city;
  String?plotLocation;
  String ?grroundFloor;
  String? describeYourProject;
  String? projectFile;
  String? proposalCreatedTime;
  String? proposalSavedDate;
  String? firstName;
  String? lastName;
  String? ownerCity;
  String? country;
  String? profilePicUrl;
  String? selectedContractorCity;
  String? status;
  String? proEmail;
  String? proFirstName;
  String? proLastName;
  String? proCity;
  String? proCountry;
  String? proProfilePicUrl;
  String ?offer;
  String ?offerCreatedTime;
  String ?offerSavedDate;
  String ?offerStatus;

  OwnerSubmitProposalsModel(
      {this.email,
        this.to,
        this.status,
        this.projectTitle,
        this.projectType,
        this.workMonths,
        this.projectBudget,
        this.plotLengthA,
        this.plotLengthB,
        this.plotWidthA,
        this.plotWidthB,
        this.actualPlotSize,
        this.floors,
        this.city,
        this.describeYourProject,
        this.projectFile,
        this.proposalCreatedTime,
        this.proposalSavedDate,
        this.grroundFloor,
        this.firstName,
        this.lastName,
        this.ownerCity,
        this.country,
        this.profilePicUrl,
        this.selectedContractorCity,
        this.sId,
        this.proEmail,
        this.proFirstName,
        this.proLastName,
        this.proCity,
        this.proCountry,
        this.proProfilePicUrl,
        this.offer,
        this.offerCreatedTime,
        this.offerSavedDate,
        this.offerStatus,





      });

  OwnerSubmitProposalsModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    to = json['to'];
    status = json['status'];
    projectTitle = json['projectTitle'];
    projectType = json['projectType'];
    workMonths = json['workMonths'];
    projectBudget=json["projectBudget"];
    plotLengthA = json['plotLengthA'];
    plotLengthB = json['plotLengthB'];
    plotWidthA = json['plotWidthA'];
    plotWidthB = json['plotWidthB'];
    actualPlotSize = json['actualPlotSize'];
    floors = json['floors'];
    city = json['city'];
    plotLocation = json['plotLocation'];
    grroundFloor = json['groundFloor'];
    describeYourProject = json['describeYourProject'];
    projectFile = json['projectFile'];
    proposalCreatedTime = json['proposalCreatedTime'];
    proposalSavedDate = json['proposalSavedDate'];
    firstName = json['ownerFirstName'];
    lastName = json['ownerLastName'];
    ownerCity = json['ownerCity'];
    country = json['ownerCountry'];
    profilePicUrl = json['ownerProfilePicUrl'];
    selectedContractorCity=json["selectedContractorCity"];
    sId = json['_id'];

    proFirstName = json['proFirstName'];
    proLastName = json['proLastName'];
    proCity = json['proCity'];
    proCountry = json['proCountry'];
    proProfilePicUrl = json['proProfilePicUrl'];
    proEmail=json['proEmail'];


    offer = json['offer'];
    offerCreatedTime = json['offerCreatedTime'];
    offerSavedDate=json['offerSavedDate'];
    offerStatus=json['offerStatus'];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = new Map<String, dynamic>();
    _data['email'] = this.email;
    _data['to'] = this.to;
    _data['status'] = this.status;
    _data['projectTitle'] = this.projectTitle;
    _data['projectType'] = this.projectType;
    _data['workMonths'] = this.workMonths;
    _data['projectBudget'] = this.projectBudget;
    _data['plotLengthA'] = this.plotLengthA;
    _data['plotLengthB'] = this.plotLengthB;
    _data['plotWidthA'] = this.plotWidthA;
    _data['plotWidthB'] = this.plotWidthB;
    _data['actualPlotSize'] = this.actualPlotSize;
    _data['floors'] = this.floors;
    _data['city'] = this.city;
    _data['plotLocation'] = this.plotLocation;
    _data['groundFloor'] = this.grroundFloor;
    _data['describeYourProject'] = this.describeYourProject;
    _data['projectFile'] = this.projectFile;
    _data['proposalCreatedTime'] = this.proposalCreatedTime;
    _data['proposalSavedDate'] = this.proposalSavedDate;
    _data['_id'] = this.sId;
    _data['ownerFirstName']=this.firstName;
    _data['ownerLastName']=this.lastName;
    _data['ownerCity']=this.ownerCity;
    _data['ownerCountry']=this.country;
    _data['ownerProfilePicUrl']=this.profilePicUrl;
    _data['selectedContractorCity']=this.selectedContractorCity;
    _data['proEmail']=this.proEmail;
    _data['proFirstName']=this.proFirstName;
    _data['proLastName']=this.proLastName;
    _data['proCity']=this.proCity;
    _data['proCountry']=this.proCountry;
    _data['proProfilePicUrl']=this.proProfilePicUrl;

    _data['offer']=this.offer;
    _data['offerCreatedTime']=this.offerCreatedTime;
    _data['offerSavedDate']=this.offerSavedDate;
    _data['offerStatus'] = this.offerStatus;
    return _data;
  }
}
