import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/models/OwnerSubmitProposalsModel.dart';

import '../../../../BuisnessLogic Layer/Api.dart';
import '../../../../models/ProfessionalsProfileModel.dart';
import '../../HomePage/Chat/ChatScreen.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';
import 'Pro_Offer_List.dart';
import 'Pro_View_Profile.dart';
import 'Pro_View_Requested_Proposals_List.dart';
import 'package:intl/intl.dart';

bool progressBarVisible=false;


const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
String? projectTitle;
String ?projectType;
String ?workMonth;
String ?projectBudget;
String ?plotFrontSideWidth;
String ?plotBackSideWidth;
String ?plotLeftSideLength;
String ?plotRightSideLength;
String ?actualPlotSize;
String ?city; //ye city pro ke city me insert horahi hai
String ?plotLocation;
String ?describeYourProject;
String ?projectFile;
String ?email;
String ?ownerfirstName;
String ?ownerlastName;
String ?ownercity;
String? ownercountry;
String ?ownerProfilePicture;
String ?floors;
String ?groundFloors;
String ?_currentUserEmailVRP;
String ?id;
String ?status;

String? proFirstName;
String? proLastName;
String? proCity;
String? proCountry;
String? proProfilePicture;
String? offer;
String? offerSavedDate;
String?offerStatus;

class ProOffers extends StatefulWidget {
  String id;
  String projectTitle;
  String projectType;
  String workMonth;
  String projectBudget;
  String plotFrontSideWidth;
  String plotBackSideWidth;
  String plotLeftSideLength;
  String plotRightSideLength;
  String actualPlotSize;
  String floors;
  String groundFloors;
  String city;
  String plotLocation;
  String describeYourProject;
  String projectFile;
  String email;
  String OwnerfirstName;
  String OwnerlastName;
  String Ownercity;
  String Ownercountry;
  String OwnerProfilePicture;

  String _currentUserEmailVRP;
  String status;
  String offer;
  String offerSavedDate;
  String offerStatus;






  ProOffers(this._currentUserEmailVRP,this.id,this.email,this.status,this.projectTitle,this.projectType,this.workMonth,this.projectBudget,
      this.plotFrontSideWidth,this.plotBackSideWidth,this.plotLeftSideLength,
      this.plotRightSideLength,this.actualPlotSize,this.floors,this.groundFloors,this.city,this.plotLocation,this.describeYourProject,this.OwnerfirstName,
      this.OwnerlastName,this.Ownercity,this.Ownercountry,this.OwnerProfilePicture,this.offer,this.offerSavedDate,this.offerStatus,
      {required this.projectFile});

  @override
  State<ProOffers> createState() => _ProOffers();
}

class _ProOffers extends State<ProOffers> {
  @override
  ApiService apiService = new ApiService();
  List<ProfessionalsProfileModel> _getOwnerProfileData=[];
  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getProProfile().then((value){
      setState(() {
        _getOwnerProfileData.addAll(value);
        for(int index=0;index<_getOwnerProfileData.length;index++) {
          if (_getOwnerProfileData[index].email==_currentUserEmailVRP) {


            proFirstName=_getOwnerProfileData[index].firstName.toString();
            proLastName=_getOwnerProfileData[index].lastName.toString();
            proCity=_getOwnerProfileData[index].city.toString();
            proCountry=_getOwnerProfileData[index].country.toString();
            proProfilePicture=_getOwnerProfileData[index].uploadPhoto.toString();


            print("--------------------------------------------------------------");

          }
        }//set data we get
        //set data we get
      });
    });


    super.initState();
  }
  Widget build(BuildContext context) {

    projectTitle=widget.projectTitle;
    projectType=widget.projectType;
    workMonth=widget.workMonth;
    projectBudget=widget.projectBudget;
    plotFrontSideWidth=widget.plotFrontSideWidth;
    plotBackSideWidth=widget.plotBackSideWidth;
    plotLeftSideLength=widget.plotLeftSideLength;
    plotRightSideLength=widget.plotRightSideLength;
    actualPlotSize=widget.actualPlotSize;
    _currentUserEmailVRP=widget._currentUserEmailVRP;
    city=widget.city;
    plotLocation=widget.plotLocation;
    describeYourProject=widget.describeYourProject;
    projectFile=widget.projectFile;
    email=widget.email;
    ownerfirstName=widget.OwnerfirstName;
    ownerlastName=widget.OwnerlastName;
    ownercity=widget.Ownercity;
    ownercountry=widget.Ownercountry;
    ownerProfilePicture=widget.OwnerProfilePicture;
    floors=widget.floors;
    groundFloors=widget.groundFloors;
    id=widget.id;
    status=widget.status;
    offer=widget.offer;
    offerSavedDate=widget.offerSavedDate;
    offerStatus=widget.offerStatus;
    debugPrint(id.toString());

    print("project file is"+projectFile.toString());

    return Scaffold(
        body:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Boxes(),
                    Padding(
                        padding: EdgeInsets.only(top: 50, left: 0, bottom: 0),
                        child: widget.offerStatus=="Rejected"?Center(
                          child: Text(
                            "Your Offer is Rejected against this proposal !",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ):Text("")),
                    Padding(
                        padding:
                        const EdgeInsets.only(top:10),
                        child:progressBarVisible!=true?Container():Center(child: CircularProgressIndicator())),
                    Row(  mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          ProfessionalOffer(),
                          ProAcceptDeclinePropsals()
                        ]),
                         ProposalServiceProviderI(),
                         PlotSize(),
                         DescribeYourProject(),
                    Row(

                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 170, bottom: 50),
                            child: SizedBox(
                                width: 140,
                                height: 35,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                             ProOfferList(_currentUserEmailVRP.toString())));//professsioal_view_requested_proposal_list naviagte krna hai
                                    },
                                    // ignore: sort_child_properties_last
                                    child: const Text(
                                      "Back",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFFFA62B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(30.0),
                                      ),
                                    )))),
                      ],
                    ),
                    Footer(),
                  ],
                ))));
  }
}



class ProposalServiceProviderI extends StatefulWidget {
  const ProposalServiceProviderI({super.key});

  @override
  State<ProposalServiceProviderI> createState() => _ProposalServiceProviderI();
}

class _ProposalServiceProviderI extends State<ProposalServiceProviderI> {
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();
  List<OwnerSubmitProposalsModel> _getOwnerProposal=[];
  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getOwnerSubmitProposal().then((value){
      setState(() {
        _getOwnerProposal.addAll(value);
        //set data we get
      });
    });
    super.initState();
  }
  @override
  bool isOpenProjectType = false;
  String selectedOptionProjectType = "Select Option";
  List<String> optionsProjectTypeList = [
    "Residential ",
    'Commercial',
  ];
  int _months=1;

  Widget build(BuildContext context) {


    const checkbox = false;
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10,left:170),
        width: 900,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 50, left: 50, bottom: 0),
                child: Text(
                  "Project detail",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 50, left: 50, bottom: 0),
                child: Text(
                  "Project Title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 50),
              child: Container(
                  width: 400,
                  height: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: strokeColor,width:1)
                  ),
                  child:Padding(
                    padding: EdgeInsets.only(left:10,top:5),
                    child:Text(projectTitle.toString(), style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),)
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "Project Type",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 50),
                child: Container(
                  width: 400,
                  height: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey,width:1)
                  ),
                  child:Padding(
                      padding: EdgeInsets.only(left:10,top:5),
                      child:Text(projectType.toString(), style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),)),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "How long will your work take",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 50, bottom: 0),
                child:RadioListTile(
                  title: Text(workMonth.toString()),
                  value: 1,
                  groupValue: _months,
                  onChanged: (value) {
                    _months=1;
                  },
                )),

            //-----------------------------Project Budget-----------------//
            const Padding(
                padding: EdgeInsets.only(top: 10, left: 50, bottom: 0),
                child: Text(
                  "Project Budget",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 50,bottom: 10),
                child: Container(
                  width: 400,
                  height: 35,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey,width:1)
                  ),
                  child:Padding(
                      padding: EdgeInsets.only(left:10,top:6),
                      child:Text(projectBudget.toString(), style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),)),
                )),

            //----------------Review and Submit--------------//
          ],
        ));
  }
}
class ProfessionalOffer extends StatefulWidget {
  const ProfessionalOffer({super.key});

  @override
  State<ProfessionalOffer> createState() => _ProfessionalOffer();
}

class _ProfessionalOffer extends State<ProfessionalOffer> {
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();
  List<OwnerSubmitProposalsModel> _getOwnerProposal=[];
  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getOwnerSubmitProposal().then((value){
      setState(() {
        _getOwnerProposal.addAll(value);
        //set data we get
      });
    });
    super.initState();
  }
  @override
  bool isOpenProjectType = false;
  String selectedOptionProjectType = "Select Option";
  List<String> optionsProjectTypeList = [
    "Residential ",
    'Commercial',
  ];
  int _months=1;

  Widget build(BuildContext context) {


    const checkbox = false;
    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 0),
        width: 900,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 50, left: 50, bottom: 0),
                    child: Text(
                      "Status          :",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 50, left: 50, bottom: 0),
                    child: offerStatus!="Rejected"? Text(
                      status.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ):Text(
                      offerStatus.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                    child: Text(
                      "Title              :",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                    child: Text(
                      projectTitle.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                    child: Text(
                      "Offer to        :",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                    child: Text(
                      firstName.toString()+" "+lastName.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                    child: Text(
                      "Offer             :",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:16 ,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                    child: Text(
                      offer.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                    child: Text(
                      "Offer Date    :",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 30),
                    child: Text(
                      offerSavedDate.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),













            //----------------Review and Submit--------------//
          ],
        ));
  }
}
class ProAcceptDeclinePropsals extends StatefulWidget {
  const ProAcceptDeclinePropsals({super.key});

  @override
  State<ProAcceptDeclinePropsals> createState() => _ProAcceptDeclinePropsals();
}

class _ProAcceptDeclinePropsals extends State<ProAcceptDeclinePropsals> {

  //CurrentUser currentUserEmailObject=CurrentUser();

  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime currentDate = DateTime.now();
    String _currentDateNow = DateFormat('dd-MM-yyy').format(currentDate);
    int hour = now.hour;
    int minute = now.minute;
    TimeOfDay time = TimeOfDay(hour: hour, minute:minute);
    String _currentTimeNow=time.format(context);
    print(_currentTimeNow);
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //------------------------profile and message
        Container(
          width: 280,
          margin: EdgeInsets.only(top: 50, left: 10),
          decoration: BoxDecoration(
              border: Border.all(color: strokeColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height:
                    250, //----------------profile Container Height
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10,left:10),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child:ownerProfilePicture!=null? Image.network(
                                      ownerProfilePicture.toString(),
                                      height: 90.0,
                                      width: 90.0,
                                      scale: 2,
                                      fit: BoxFit.cover,
                                    ):Container(width:40,height: 40,decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        borderRadius: BorderRadius.circular((100),)),)
                                ),
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 30, right: 0),
                                      child: Text(
                                          ownerfirstName.toString()+" "+ownerlastName.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight.w700))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 5, right: 0),
                                      child: Text(
                                          "Owner",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight.w700))),

                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 5, left: 20),
                                      child: Text(
                                          ownercity.toString()+" "+ownercountry.toString(),
                                          style: TextStyle(
                                              color: TextlightGrey,
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight.w400))),
                                ],
                              )
                            ],
                          ),

                          //---------------------------Message--------------------//

                          //-----------------------Accept Decline Button


                        ]))
              ]),
        ),
      ],
    );

  }
}


class PlotSize extends StatefulWidget {
  const PlotSize({super.key});

  @override
  State<PlotSize> createState() => _PlotSize();
}

class _PlotSize extends State<PlotSize> {
  var _months=1;

  _plotSize() {
    // defauslt value set in constructor
    _selectedValue = cityItems[0];
  }

  String city = "City";
  final cityItems = [
    "City",
    "Islamabad",
    'Rawalpindi',
    'Lahore',
    'Karachi',
  ];
  String _selectedValue = "City";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 900,
          margin: EdgeInsets.only(top: 10, left: 170, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF999999), width: 1)),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
                padding: EdgeInsets.only(top: 40, left: 50, bottom: 0),
                child: Text(
                  "Add a accurate plot size and locations",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 60, left: 50, bottom: 0),
                    child: Text(
                      "Enter Plot Front Side Length",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(top: 60, left: 200, bottom: 0),
                    child: Text(
                      "Enter Plot Back Side Length",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: 250,
                height: 32,
                margin: EdgeInsets.only(top: 20, left: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: strokeColor, width: 0.5)),
                child: Stack(
                  children: [
                    Padding(
                        padding:  EdgeInsets.only(top: 0, right: 0),
                        child: Container(
                          width: 250,
                          height: 32,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey,width:1)

                          ),
                          child:Padding(
                              padding: EdgeInsets.only(left:10,top:6),
                              child:Text(plotFrontSideWidth.toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),)),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 210),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),

                      ),
                      child: Container(
                          width: 40,
                          height: 32,
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, bottom: 0),
                              child: Text(
                                "ft",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))),
                    )
                  ],
                ),
              ),
              //---------------------Second Field
              Container(
                width: 250,
                height: 32,
                margin: EdgeInsets.only(top: 20, left: 155),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: strokeColor, width: 0.5)),
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 0, right: 0),
                        child: Container(
                          width: 250,
                          height: 32,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey,width:1)

                          ),
                          child:Padding(
                              padding: EdgeInsets.only(left:10,top:6),
                              child:Text(plotBackSideWidth.toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),)),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 210),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFFFA62B),
                      ),
                      child: Container(
                          width: 40,
                          height: 32,
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, bottom: 0),
                              child: Text(
                                "ft",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))),
                    )
                  ],
                ),
              ),
            ]),
            //---------------------------------------------------------Second Row of right left length
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                    child: Text(
                      "Enter Plot Left Side Length",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 220, bottom: 0),
                    child: Text(
                      "Enter Plot Right Side Length",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: 250,
                height: 32,
                margin: EdgeInsets.only(top: 20, left: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: strokeColor, width: 0.5)),
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 0, right: 0),
                        child:Container(
                          width: 250,
                          height: 32,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey,width:1)

                          ),
                          child:Padding(
                              padding: EdgeInsets.only(left:10,top:6),
                              child:Text(plotLeftSideLength.toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),)),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 220),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFFFA62B),
                      ),
                      child: Container(
                          width: 40,
                          height: 32,
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, bottom: 0),
                              child: Text(
                                "ft",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))),
                    )
                  ],
                ),
              ),
              //---------------------Second Field
              Container(
                width: 250,
                height: 32,
                margin: EdgeInsets.only(top: 20, left: 155),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: strokeColor, width: 0.5)),
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 0, right: 0),
                        child:Container(
                          width: 250,
                          height: 32,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey,width:1)

                          ),
                          child:Padding(
                              padding: EdgeInsets.only(left:10,top:6),
                              child:Text(plotRightSideLength.toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),)),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 210),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFFFA62B),
                      ),
                      child: Container(
                          width: 40,
                          height: 32,
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, bottom: 0),
                              child: Text(
                                "ft",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))),
                    )
                  ],
                ),
              ),
            ]),
            //------------------Total Plot Size----------------//
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "Enter Actual Plot Size",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: 250,
                height: 32,
                margin: EdgeInsets.only(top: 20, left: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: strokeColor, width: 0.5)),
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 0, right: 0),
                        child: Container(
                          width: 250,
                          height: 32,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey,width:1)

                          ),
                          child:Padding(
                              padding: EdgeInsets.only(left:10,top:6),
                              child:Text(actualPlotSize.toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),)),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 210),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFFFA62B),
                      ),
                      child: Container(
                          width: 40,
                          height: 32,
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, bottom: 0),
                              child: Text(
                                "ft",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))),
                    )
                  ],
                ),
              ),
              //---------------------Second Field
            ]),
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "How many floors you want to build",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: 250,
                height: 32,
                margin: EdgeInsets.only(top: 20, left: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: strokeColor, width: 0.5)),
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 0, right: 0),
                        child: Container(
                          width: 250,
                          height: 32,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey,width:1)

                          ),
                          child:Padding(
                              padding: EdgeInsets.only(left:10,top:6),
                              child:Text(floors.toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),)),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 210),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFFFA62B),
                      ),
                      child: Container(
                          width: 40,
                          height: 32,
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, bottom: 0),
                              child: Text(
                                "ft",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))),
                    )
                  ],
                ),
              ),
              //---------------------Second Field
            ]),

            Padding(
                padding: EdgeInsets.only(top: 10, left: 50, bottom: 0),
                child:RadioListTile(
                  title: Text(groundFloors.toString()),
                  value: 1,
                  groupValue: _months,
                  onChanged: (value) {
                    _months=1;
                  },
                )),
            //-------------------Location
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "Select Location:",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding:
                        EdgeInsets.only(top: 10, left: 50, bottom: 0),
                        child: Text(
                          "City",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 50,bottom: 10),
                        child: Container(
                          width: 250,
                          height: 35,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey,width:1)
                          ),
                          child:Padding(
                              padding: EdgeInsets.only(left:10,top:6),
                              child:Text(city.toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),)),
                        )),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                        padding:
                        EdgeInsets.only(top: 10, left: 140, bottom: 0),
                        child: Text(
                          "Plot Location",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 140,bottom: 10),
                        child: Container(
                          width: 300,
                          height: 35,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.grey,width:1)
                          ),
                          child:Padding(
                              padding: EdgeInsets.only(left:10,top:6),
                              child:Text(plotLocation.toString(), style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),)),
                        )),
                  ],
                )
              ],
            ),


          ]),
        ),
      ],
    );
  }
}

class DescribeYourProject extends StatefulWidget {
  const DescribeYourProject({super.key});

  @override
  State<DescribeYourProject> createState() => _DescribeYourProject();
}

class _DescribeYourProject extends State<DescribeYourProject> {
  @override
  bool isOpenProjectType = false;
  String selectedOptionProjectType = "Select Option";
  List<String> optionsProjectTypeList = [
    "Residential ",
    'Commercial',
  ];
  String? _months;

  Widget build(BuildContext context) {
    const checkbox = false;
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 50,left:170),
        width: 900,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.only(top: 30, left: 50, bottom: 0),
              child: Text(
                "Describe your Project",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
              child: Text(
                '''
This is how Professional figures out what you need and why you’re great to work with!
Include your expectations about the task or deliverable, what you’re looking for in a work 
relationship, and anything unique about your project, team, or company. ''',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Container(
              height: 200,
              width: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: strokeColor, width: 1)),
              margin: EdgeInsets.only(top: 20, left: 50, bottom: 10),
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left:10,top:6),
                        child:Text(describeYourProject.toString(), style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),)),
                  ])),

        ]));
  }
}

class OfferSentShowDialog extends StatefulWidget {
  String firstName;
  String lastName;
  OfferSentShowDialog(this.firstName,this.lastName);

  @override
  State<OfferSentShowDialog> createState() => _OfferSentShowDialog();
}

class _OfferSentShowDialog extends State<OfferSentShowDialog> {
  @override
  Widget build(BuildContext context) {
    String addNo = '+92';

    // List of items in our dropdown menu
    var addNoItems = [
      '+92',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
          width: 500,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 60, left: 180),
                  decoration: const BoxDecoration(
                    image:
                    DecorationImage(image: AssetImage("Logo/accept.png")),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 0, top: 40),
                  child: Center(
                      child: Text(
                        "Offer sent to"+" "+ownerfirstName.toString()+" "+ownerlastName.toString()+"!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
              Padding(
                  padding: EdgeInsets.only(left: 0, top: 10),
                  child: Center(
                      child: Text(
                        "We will notify you When"+" "+ownerfirstName.toString()+" "+ownerlastName.toString()+" "+"Responds to your offer ",
                        style: TextStyle(
                          color: Color(0xFFFFA62B),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ))),

              //-------------------------Add mobile no------------------//

              //--------------------------Buttons-------------------------//
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 60, left: 340),
                      child: Container(
                          width: 140,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProViewProfile(_currentUserEmailVRP.toString())));
                              },
                              // ignore: sort_child_properties_last
                              child: Row(children: const <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 3),
                                    child: Center(
                                        child: Text(
                                          "Go Back to My Profile",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ))),
                              ]),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  backgroundColor: Color(0xFFFFA62B))))),
                ],
              ),
            ],
          )),
    );
  }
}




class showOfferAlertDialog extends StatefulWidget {
  const showOfferAlertDialog ({super.key});

  @override
  State<showOfferAlertDialog > createState() =>
      _showOfferAlertDialog ();
}

class _showOfferAlertDialog  extends State<showOfferAlertDialog> {

  final _keyOffer = GlobalKey<FormState>();
  final _offerController=TextEditingController();

  bool _autoValidate=false;
  static const checkbox = false;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime currentDate = DateTime.now();
    String offerSavedDate = DateFormat('dd-MM-yyy').format(currentDate);
    int hour = now.hour;
    int minute = now.minute;
    TimeOfDay time = TimeOfDay(hour: hour, minute:minute);
    String offerCreatedTime=time.format(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: StatefulBuilder(builder: (context, setState) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Container(
                  width: 550,

                  child: Form(
                    key: _keyOffer,
                    autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          //  Form(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(top: 20, left:10),
                                  child: Text(
                                    "Project Proposal",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),

                            ],
                          ),

                          Padding(
                              padding:
                              EdgeInsets.only(top: 20, left:10, bottom: 0),
                              child: Text(
                                "Project Title",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          Padding(
                              padding:
                              EdgeInsets.only(top: 10, left:10, bottom: 0),
                              child: Text(
                                projectTitle.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),

                          Padding(
                              padding:
                              EdgeInsets.only(top: 20, left:10, bottom: 0),
                              child: Text(
                                "Project Budget",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          Padding(
                              padding:
                              EdgeInsets.only(top: 10, left:10, bottom: 20),
                              child: Text(
                                projectBudget.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Divider(),

                          Padding(
                              padding:
                              EdgeInsets.only(top: 20, left:10, bottom: 10),
                              child: Text(
                                "Tell your offer about proposal ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),

                          Padding(
                              padding:
                              EdgeInsets.only(top: 20, left:10, bottom: 10),
                              child: Text(
                                "Enter your offer ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),

                          Padding(
                              padding: EdgeInsets.only(top: 0, left:10),
                              child: SizedBox(
                                  width: 640,

                                  child: TextFormField(
                                    // autovalidateMode:AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.name,
                                    controller: _offerController,
                                    decoration: InputDecoration(
                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 11),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        )),
                                    onChanged: (value) {
                                      final formatter = NumberFormat('#,##0', 'en_US');
                                      final newValue = value.replaceAll(',', '');
                                      final formattedValue = formatter.format(int.parse(newValue));
                                      if (value != formattedValue) {
                                        _offerController.value =  _offerController.value.copyWith(
                                          text: formattedValue,
                                          selection: TextSelection.collapsed(
                                            offset: formattedValue.length,
                                          ),
                                        );
                                      }
                                    },
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "Offer is Required";
                                      }

                                      return null;
                                    },
                                  ))),


                          // ignore: prefer_const_literals_to_create_immutables

                          Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Row(
                                children: <Widget>[
                                  Padding(
                                      padding:
                                      const EdgeInsets.only(top: 120, left: 240,bottom: 30),
                                      child: SizedBox(
                                          width: 140,
                                          height: 35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              // ignore: sort_child_properties_last
                                              child: const Text(
                                                "Back",
                                                style: TextStyle(color: Colors.black),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                const Color(0xFFD9D9D9),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(30.0),
                                                ),
                                              )))),
                                  Padding(
                                      padding:
                                      const EdgeInsets.only(top: 120, left: 20,bottom: 30),
                                      child: Container(
                                          width: 140,
                                          height: 40,
                                          child: ElevatedButton(
                                              onPressed: ()async {
                                                if( _keyOffer.currentState!.validate()){
                                                  var response=await apiService.ProOffer(id.toString(),"Pending", _currentUserEmailVRP.toString(),
                                                      proFirstName.toString(), proLastName.toString(), proCity.toString(), proCountry.toString(), proProfilePicture.toString(),
                                                      _offerController.text, offerCreatedTime, offerSavedDate);
                                                  if(response=="200"){
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProViewProfile(_currentUserEmailVRP.toString())));
                                                  }


                                                }else{

                                                  setState(() {

                                                    _autoValidate=true;
                                                  });


                                                }

                                              },
                                              // ignore: sort_child_properties_last
                                              child: Row(children: const <Widget>[
                                                Padding(
                                                    padding:
                                                    EdgeInsets.only(left: 30),
                                                    child: Center(
                                                        child: Text(
                                                          "Submit",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12),
                                                        ))),
                                              ]),
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(30.0),
                                                  ),
                                                  backgroundColor:
                                                  const Color(0xFF363B42))))),
                                ],
                              ),
                            ],
                          ),

                          // ignore: prefer_const_literals_to_create_immutables

                          //Back and Next Button--------------------------------------------------------------------------------------------
                        ]),
                  ))),
        );
      }),
    );
  }
}