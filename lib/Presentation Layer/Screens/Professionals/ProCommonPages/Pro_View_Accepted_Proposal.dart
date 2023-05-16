import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/models/OwnerSubmitProposalsModel.dart';

import '../../../../BuisnessLogic Layer/Api.dart';
import '../../HomePage/Chat/ChatScreen.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';
import 'Pro_View_Accepted_Propsal_List.dart';
import 'Pro_View_Profile.dart';
import 'Pro_View_Requested_Proposals_List.dart';
import 'package:intl/intl.dart';




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
String ?city;
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

class ProViewAcceptedProposals extends StatefulWidget {
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




  ProViewAcceptedProposals(this._currentUserEmailVRP,this.id,this.email,this.projectTitle,this.projectType,this.workMonth,this.projectBudget,
      this.plotFrontSideWidth,this.plotBackSideWidth,this.plotLeftSideLength,
      this.plotRightSideLength,this.actualPlotSize,this.floors,this.groundFloors,this.city,this.plotLocation,this.describeYourProject,this.OwnerfirstName,
      this.OwnerlastName,this.Ownercity,this.Ownercountry,this.OwnerProfilePicture,
      {required this.projectFile});

  @override
  State<ProViewAcceptedProposals> createState() => _ProViewAcceptedProposals();
}

class _ProViewAcceptedProposals extends State<ProViewAcceptedProposals> {
  @override
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
                    Row(  mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[ProposalServiceProviderI(),ProAcceptDeclinePropsals()]),
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
                                              ViewAcceptedProposalList(_currentUserEmailVRP.toString())));//professsioal_view_requested_proposal_list naviagte krna hai
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
        margin: const EdgeInsets.only(top: 60, bottom: 10),
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
                    450, //----------------profile Container Height
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
                                  const Padding(
                                      padding: EdgeInsets.only(
                                          top: 5, left: 20),
                                      child: Text(
                                          "Business, employee at",
                                          style: TextStyle(
                                              color: TextlightGrey,
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight.w400))),
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
                          Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 280,
                                  margin: EdgeInsets.only(
                                      top: 20, left: 10),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [


                                    ],
                                  ),
                                ),
                                //-------------------------------------------------//
                              ])
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
          //---------------------Button-----------------//
          if(projectFile.toString()!="")
            Padding(
                padding: const EdgeInsets.only(top: 100, left: 50, bottom: 30),
                child: Container(
                    width: 210,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DesireBuilding()));
                        },
                        // ignore: sort_child_properties_last
                        child: Row(children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 40,
                                      height: 40,
                                      margin: const EdgeInsets.only(left: 5),
                                      child: const Icon(
                                        Icons.folder,
                                        color: Color(0xFFFFA62B),
                                      )),
                                  const Text(
                                    "Download",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "File",
                                      style: TextStyle(
                                          color: Color(0xFFFFA62B), fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    height: 40,
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  Container(
                                      width: 40,
                                      height: 40,
                                      margin: const EdgeInsets.only(left: 0),
                                      decoration: const BoxDecoration(),
                                      child: const Icon(
                                        Icons.file_download_outlined,
                                        color: Color(0xFFFFA62B),
                                      )),
                                ],
                              )),
                        ]),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor:const Color(0xFF363B42))))),

          //----------------Review and Submit--------------//
        ]));
  }
}

class OfferSentShowDialog extends StatefulWidget {
  const OfferSentShowDialog({super.key});

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
              const Padding(
                  padding: EdgeInsets.only(left: 0, top: 40),
                  child: Center(
                      child: Text(
                        "Offer sent to Abdullah Gul!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
              const Padding(
                  padding: EdgeInsets.only(left: 0, top: 10),
                  child: Center(
                      child: Text(
                        "We will notify you When Ibad karimi Responds to your offer ",
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
                                    builder: (context) => ProViewProfile("")));
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
