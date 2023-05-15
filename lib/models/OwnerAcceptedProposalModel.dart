class ProAcceptedProposalsModel {
  String? senderEmail;
  String ? accepterEmail;
  String? sId;
  String? projectStatus;
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
  String? proposalAcceptedTime;
  String? proposalAcceptedDate;
  String? firstName;
  String? lastName;
  String? ownerCity;
  String? country;
  String? profilePicUrl;
  String? status;

  String? proFirstName;
  String? proLastName;
  String? proCity;
  String? proCountry;
  String? proProfilePicUrl;




  ProAcceptedProposalsModel(
      {this.senderEmail,
        this.accepterEmail,
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
        this.proposalAcceptedTime,
        this.proposalAcceptedDate,
        this.grroundFloor,
        this.firstName,
        this.lastName,
        this.ownerCity,
        this.country,
        this.profilePicUrl,
        this.sId,
        this.proFirstName,
        this.proLastName,
        this.proCity,
        this.proCountry,
        this.proProfilePicUrl,




      });

  ProAcceptedProposalsModel.fromJson(Map<String, dynamic> json) {
    senderEmail = json['senderEmail'];
    status = json['projectStatus'];
    accepterEmail = json['accepterEmail'];
    projectStatus = json['projectStatus'];
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
    proposalAcceptedTime = json['proposalAcceptedTime'];
    proposalAcceptedDate = json['proposalAcceptedDate'];
    firstName = json['ownerFirstName'];
    lastName = json['ownerLastName'];
    ownerCity = json['ownerCity'];
    country = json['ownerCountry'];
    profilePicUrl = json['ownerProfilePicUrl'];

    proFirstName = json['proFirstName'];
    proLastName = json['proLastName'];
    proCity = json['proCity'];
    proCountry = json['proCountry'];
    proProfilePicUrl = json['proProfilePicUrl'];

    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = new Map<String, dynamic>();
    _data['senderEmail'] = this.senderEmail ;
    _data['projectStatus'] = this.status ;
    _data['accepterEmail'] = this.accepterEmail ;
    _data['projectStatus'] = this.projectStatus;
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
    _data['proposalAcceptedTime'] = this.proposalAcceptedTime;
    _data['proposalAcceptedDate'] = this.proposalAcceptedDate;
    _data['_id'] = this.sId;
    _data['ownerFirstName']=this.firstName;
    _data['ownerLastName']=this.lastName;
    _data['ownerCity']=this.ownerCity;
    _data['ownerCountry']=this.country;
    _data['ownerProfilePicUrl']=this.profilePicUrl;


    _data['proFirstName']=this.proFirstName;
    _data['proLastName']=this.proLastName;
    _data['proCity']=this.proCity;
    _data['proCountry']=this.proCountry;
    _data['proProfilePicUrl']=this.proProfilePicUrl;

    return _data;

  }
}
