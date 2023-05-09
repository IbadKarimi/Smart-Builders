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


  OwnerSubmitProposalsModel(
      {this.email,
        this.to,
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
        this.sId});

  OwnerSubmitProposalsModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    to = json['to'];
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
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = new Map<String, dynamic>();
    _data['email'] = this.email;
    _data['to'] = this.to;
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
    return _data;
  }
}
