// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../../../BuisnessLogic Layer/Api.dart';
import '../../../../models/OwnerAcceptedProposalModel.dart';
import '../../../../models/OwnerProfileModel.dart';
import '../../../../models/OwnerSubmitProposalsModel.dart';
import '../../../../models/ProfessionalsProfileModel.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';
import '../../Owner/Owner_View_Submitted_Proposals.dart';
import 'Pro_View_Profile.dart';
import 'Pro_View_Requested_Proposals.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

String? currenUserEmailRPL;
String? ownerId;
String? _firstName;
String? _lastName;
String? _city;
String ?_country;
String? _profilePhoto;
String? _ownerEmail;






class ViewProposalRequestedProposalList extends StatefulWidget {
  String email;
   ViewProposalRequestedProposalList(this.email);

  @override
  State<ViewProposalRequestedProposalList> createState() => _ViewProposalRequestedProposalList();
}

class _ViewProposalRequestedProposalList extends State<ViewProposalRequestedProposalList> {

  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();


  @override
  Widget build(BuildContext context) {
    currenUserEmailRPL=widget.email;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Boxes(),
                    ViewProposal(),
                    Button(),
                    Footer()
                  ],
                ))));
  }
}

String? projectTitle;
String ?proposalCreatedTime;
String ?proposalSavedTime;
String ?length;
class ViewProposal extends StatefulWidget {
  const ViewProposal({super.key});

  @override
  State<ViewProposal> createState() => _ViewProposal();
}

class _ViewProposal extends State<ViewProposal> {
  String _proStatus="";
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();
  List<OwnerSubmitProposalsModel> _getOwnerProposal=[];
  List<OwnerProfileModel> _getOwnerProfileData=[];
  List<ProfessionalsProfileModel> _getProProfileData=[];


  //CurrentUser currentUserEmailObject=CurrentUser();
  List<ProAcceptedProposalsModel> _getAcceptedProposals=[];


  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getOwnerSubmitProposal().then((value){
      setState(() {
        _getOwnerProposal.addAll(value);
        for(int index=0;index<_getOwnerProposal.length;index++) {


            print("--------------------------------------------------------------");
            print("Title:          :" + _getOwnerProposal[index].projectTitle.toString());
            projectTitle=_getOwnerProposal[index].projectTitle.toString();
            proposalCreatedTime=_getOwnerProposal[index].proposalCreatedTime.toString();
            proposalSavedTime=_getOwnerProposal[index].proposalSavedDate.toString();
            _ownerEmail=_getOwnerProposal[index].email.toString();
            print("--------------------------------------------------------------");
            print("Title:          :" + _getOwnerProposal[index].projectTitle.toString());
            print("Created time    :" + _getOwnerProposal[index].proposalCreatedTime.toString());
            print("sved Date       :" + _getOwnerProposal[index].proposalSavedDate.toString());
            print("--------------------------------------------------------------");

          }
        //set data we get
        //set data we get
      });
    });
    apiService.getOwnerProfile().then((value){
      setState(() {
        _getOwnerProfileData.addAll(value);
        for(int index=0;index<_getOwnerProfileData.length;index++) {
          if(_ownerEmail != null) {
            ownerId = _getOwnerProfileData[index].id.toString();
            _firstName = _getOwnerProfileData[index].firstName.toString();
            _lastName = _getOwnerProfileData[index].lastName.toString();
            _city = _getOwnerProfileData[index].city.toString();
            _country = _getOwnerProfileData[index].country.toString();
            _profilePhoto = _getOwnerProfileData[index].uploadPhoto.toString();
            print(_firstName.toString());
            print(_lastName.toString());
          }
        }//set data we get
        //set data we get
      });
    });
    apiService.getAcceptedProposal().then((value){
      setState(() {
        _getAcceptedProposals.addAll(value);
        for(int index=0;index<_getAcceptedProposals.length;index++) {
          if(_getAcceptedProposals[index].accepterEmail==currenUserEmailRPL&&_getAcceptedProposals[index].status.toString()=="Accepted"){
            _proStatus=_getAcceptedProposals[index].status.toString();
              continue;
            print(_proStatus.toString());
          }


        }
        //set data we get
        //set data we get
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 800,
        height: 580,
        margin: const EdgeInsets.only(top: 50, bottom: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: strokeColor)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, bottom: 0),
                  child: Text(
                    "Proposals",
                    style: TextStyle(
                      color: Color(0xFFFFA62B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 5, bottom: 0),
                  child: Text(
                    "/View Requested Proposals",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Container(
                width: 250,
                height: 32,
                margin: EdgeInsets.only(top: 20, left: 250),
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
                            decoration: const BoxDecoration(),
                            child: const TextField(
                              decoration:
                              InputDecoration(border: InputBorder.none),
                            ))),
                    Container(
                      margin: const EdgeInsets.only(left: 220),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFFFA62B),
                      ),
                      child: const Icon(
                        Icons.search,
                        size: 32,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ]),
            //------------------------------------------top end--------------------//
            Column(children: [
              for(int index=0;index<_getOwnerProposal.length;index++)
              //  if (_getOwnerProposal[index].email==_currentUserEmail.toString())
                  SizedBox(
                      height: 160,
                      child:

                      GestureDetector(

                        onTap: (){
                          if(_getOwnerProposal[index].projectFile!=null){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProViewRequestedProposals(currenUserEmailRPL.toString(),_getOwnerProposal[index].sId.toString(),_getOwnerProposal[index].email.toString(),_getOwnerProposal[index].status.toString(),_getOwnerProposal[index].projectTitle.toString(),_getOwnerProposal[index].projectType.toString(),_getOwnerProposal[index].workMonths.toString(),_getOwnerProposal[index].projectBudget.toString(),_getOwnerProposal[index].plotWidthA.toString(),
                                  _getOwnerProposal[index].plotWidthB.toString(),_getOwnerProposal[index].plotLengthA.toString(),
                                  _getOwnerProposal[index].plotLengthB.toString(),_getOwnerProposal[index].actualPlotSize.toString(),
                                    _getOwnerProposal[index].floors.toString(),_getOwnerProposal[index].grroundFloor.toString(),
                                  _getOwnerProposal[index].city.toString(),
                                  _getOwnerProposal[index].plotLocation.toString(),_getOwnerProposal[index].describeYourProject.toString(),
                                  _getOwnerProposal[index].firstName.toString(),_getOwnerProposal[index].lastName.toString(),_getOwnerProposal[index].ownerCity.toString(),_getOwnerProposal[index].country.toString(),_getOwnerProposal[index].profilePicUrl.toString(),
                                  projectFile: _getOwnerProposal[index].projectFile.toString(),)));}
                          else{
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProViewRequestedProposals(currenUserEmailRPL.toString(),_getOwnerProposal[index].sId.toString(),_getOwnerProposal[index].email.toString(),_getOwnerProposal[index].status.toString(),_getOwnerProposal[index].projectTitle.toString(),_getOwnerProposal[index].projectType.toString(),_getOwnerProposal[index].workMonths.toString(),_getOwnerProposal[index].projectBudget.toString(),_getOwnerProposal[index].plotWidthA.toString(),
                                  _getOwnerProposal[index].plotWidthB.toString(),_getOwnerProposal[index].plotLengthA.toString(),
                                  _getOwnerProposal[index].plotLengthB.toString(),_getOwnerProposal[index].actualPlotSize.toString(),
                                  _getOwnerProposal[index].floors.toString(),_getOwnerProposal[index].grroundFloor.toString(),
                                  _getOwnerProposal[index].city.toString(),
                                  _getOwnerProposal[index].plotLocation.toString(),_getOwnerProposal[index].describeYourProject.toString()
                                  ,  _getOwnerProposal[index].firstName.toString(),_getOwnerProposal[index].lastName.toString(),_getOwnerProposal[index].ownerCity.toString(),_getOwnerProposal[index].country.toString(),_getOwnerProposal[index].profilePicUrl.toString(),
                                  projectFile: "",)));}
                        }

                        ,



                        child: HoverContainer(
                          height: 160,
                          width: 800,
                          margin: const EdgeInsets.only(top: 10),
                          hoverDecoration: BoxDecoration(
                              color: const Color(0xFFFFEBCC),
                              border: Border(
                                top: BorderSide(color:strokeColor),
                                //  bottom: BorderSide(color: strokeColor),
                              )),
                          decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: strokeColor),
                                //bottom: BorderSide(color: strokeColor),
                              )),
                          child:
                          // ignore: prefer_const_literals_to_create_immutables
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Padding(
                                        padding:
                                        EdgeInsets.only(top: 30, left: 20, bottom: 0),
                                        child: Text(
                                          _getOwnerProposal[index].projectTitle.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                        EdgeInsets.only(top: 10, left: 20, bottom: 0),
                                        child: Text(
                                          "Proposal Created at " +_getOwnerProposal[index].proposalCreatedTime.toString(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                        EdgeInsets.only(top: 10, left: 20, bottom: 0),
                                        child: Text(
                                          "Proposal Saved " +_getOwnerProposal[index].proposalSavedDate.toString(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                    Row(
                                      children: [
                                        //Icon(Icons.task_alt,color: Colors.green),
                                        if(_getOwnerProposal[index].proEmail==currenUserEmailRPL.toString() &&_getOwnerProposal[index].status=="Accepted")
                                        Padding(padding:
                                          EdgeInsets.only(top: 10, left: 20, bottom: 5),
                                          child:Image.asset("Logo/accept.png",width: 20,height: 20,)),
                                        //if(_getOwnerProposal[index].proEmail==currenUserEmailRPL.toString() &&_getOwnerProposal[index].status=="Accepted")
                                        Padding(
                                            padding:EdgeInsets.only(top: 10, left: 10, bottom: 5),
                                            child:_getOwnerProposal[index].proEmail==currenUserEmailRPL.toString() &&_getOwnerProposal[index].status=="Accepted"? Text(
                                              "This proposal is Accepted by you !",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ): Padding(
                                                padding:EdgeInsets.only(top: 0, left: 10, bottom: 5),
                                                child:_getOwnerProposal[index].proEmail!=currenUserEmailRPL.toString() &&_getOwnerProposal[index].status=="Accepted"?Text(
                                              "This proposal is Accepted by another service provider !",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ): Padding(
                                                    padding:EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                                    child:_getOwnerProposal[index].proEmail==currenUserEmailRPL.toString() ||_getOwnerProposal[index].proEmail!=currenUserEmailRPL.toString() &&_getOwnerProposal[index].status=="Pending"? Text(
                                                      "",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ):Text("")))


                                        ),
                                      ],
                                    ),
                                  ]),
                              Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(Icons.more_horiz),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ],
                          ),
                        ),
                      )




                  ),],),

          ]),
        ));
  }
}

class AddProposal extends StatefulWidget {
  const AddProposal({super.key});

  @override
  State<AddProposal> createState() => _AddProposal();
}

class _AddProposal extends State<AddProposal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 370,
      margin: const EdgeInsets.only(top: 50, bottom: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: strokeColor)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        const Padding(
            padding: EdgeInsets.only(left: 50, top: 20),
            child: Text(
              "Proposals",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 60,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DesireBuilding()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "View Requested Proposals",
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "(0)",
                              style: TextStyle(
                                  color: Color(0xFFFF9900), fontSize: 16),
                            )),
                      ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DesireBuilding()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Center(
                          child: Text(
                            "Accepted for Bidding",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "(0)",
                          style:
                          TextStyle(color: Color(0xFFFF9900), fontSize: 16),
                        )),
                  ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
      ]),
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 0, left: 360, bottom: 40),
            child: Container(
                width: 140,
                height: 35,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  ProViewProfile(currenUserEmailRPL.toString())));
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
    );
  }
}
