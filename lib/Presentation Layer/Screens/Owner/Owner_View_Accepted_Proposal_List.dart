// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/models/OwnerAcceptedProposalModel.dart';

import '../../../../BuisnessLogic Layer/Api.dart';
import '../../../../models/OwnerProfileModel.dart';
import '../../../../models/OwnerSubmitProposalsModel.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import '../Professionals/ProCommonPages/Pro_View_Accepted_Proposal.dart';
import 'Owner_Desire_Building.dart';
import 'Owner_View_Accepted_Proposals.dart';
import 'Owner_View_Profile.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

String? currenUserEmailAPL;
String? ownerId;
String? _firstName;
String? _lastName;
String? _city;
String ?_country;
String? _profilePhoto;
String? _ownerEmail;



class OwnerViewAcceptedProposalList extends StatefulWidget {
  String email;
  OwnerViewAcceptedProposalList(this.email);

  @override
  State<OwnerViewAcceptedProposalList> createState() => _OwnerViewAcceptedProposalList();
}

class _OwnerViewAcceptedProposalList extends State<OwnerViewAcceptedProposalList> {

  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();


  @override
  Widget build(BuildContext context) {
    currenUserEmailAPL=widget.email;
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
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();
  List<ProAcceptedProposalsModel> _getAcceptedProposals=[];
  List<OwnerProfileModel> _getOwnerProfileData=[];

  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getAcceptedProposal().then((value){
      setState(() {
        _getAcceptedProposals.addAll(value);
        for(int index=0;index<_getAcceptedProposals.length;index++) {


          print("--------------------------------------------------------------");
          print("Title:          :" + _getAcceptedProposals[index].projectTitle.toString());
          projectTitle=_getAcceptedProposals[index].projectTitle.toString();
          proposalCreatedTime=_getAcceptedProposals[index].proposalAcceptedTime.toString();
          proposalSavedTime=_getAcceptedProposals[index].proposalAcceptedDate.toString();
          _ownerEmail=_getAcceptedProposals[index].senderEmail.toString();
          print("--------------------------------------------------------------");
          print("Title:          :" + _getAcceptedProposals[index].projectTitle.toString());

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
          } }//set data we get
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
                    "/View Accepted Proposals",
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
              for(int index=0;index<_getAcceptedProposals.length;index++)
                if(_getAcceptedProposals[index].senderEmail==currenUserEmailAPL)
                //  if (_getOwnerProposal[index].email==_currentUserEmail.toString())
                  SizedBox(
                      height: 150,
                      child:
                      GestureDetector(

                        onTap: (){
                          if(_getAcceptedProposals[index].projectFile!=null){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OwnerViewAcceptedProposals(currenUserEmailAPL.toString(),_getAcceptedProposals[index].sId.toString(),_getAcceptedProposals[index].senderEmail.toString(),_getAcceptedProposals[index].projectTitle.toString(),_getAcceptedProposals[index].projectType.toString(),
                                  _getAcceptedProposals[index].workMonths.toString(),_getAcceptedProposals[index].projectBudget.toString()
                                  ,_getAcceptedProposals[index].plotWidthA.toString(),
                                  _getAcceptedProposals[index].plotWidthB.toString(),_getAcceptedProposals[index].plotLengthA.toString(),
                                  _getAcceptedProposals[index].plotLengthB.toString(),_getAcceptedProposals[index].actualPlotSize.toString(),
                                  _getAcceptedProposals[index].floors.toString(),_getAcceptedProposals[index].grroundFloor.toString(),
                                  _getAcceptedProposals[index].city.toString(),
                                  _getAcceptedProposals[index].plotLocation.toString(),_getAcceptedProposals[index].describeYourProject.toString(),
                                  _getAcceptedProposals[index].proFirstName.toString(),_getAcceptedProposals[index].proLastName.toString(),_getAcceptedProposals[index].proCity.toString(),_getAcceptedProposals[index].proCountry.toString(),_getAcceptedProposals[index].proProfilePicUrl.toString(),
                                  projectFile: _getAcceptedProposals[index].projectFile.toString(),)));}
                          else{
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OwnerViewAcceptedProposals(currenUserEmailAPL.toString(),_getAcceptedProposals[index].sId.toString(),_getAcceptedProposals[index].senderEmail.toString(),
                                  _getAcceptedProposals[index].projectTitle.toString(),_getAcceptedProposals[index].projectType.toString(),
                                  _getAcceptedProposals[index].workMonths.toString(),_getAcceptedProposals[index].projectBudget.toString(),
                                  _getAcceptedProposals[index].plotWidthA.toString(),
                                  _getAcceptedProposals[index].plotWidthB.toString(),_getAcceptedProposals[index].plotLengthA.toString(),
                                  _getAcceptedProposals[index].plotLengthB.toString(),_getAcceptedProposals[index].actualPlotSize.toString(),
                                  _getAcceptedProposals[index].floors.toString(),_getAcceptedProposals[index].grroundFloor.toString(),
                                  _getAcceptedProposals[index].city.toString(),
                                  _getAcceptedProposals[index].plotLocation.toString(),_getAcceptedProposals[index].describeYourProject.toString(),
                                    _getAcceptedProposals[index].proFirstName.toString(),_getAcceptedProposals[index].proLastName.toString(),_getAcceptedProposals[index].proCity.toString(),_getAcceptedProposals[index].proCountry.toString(),_getAcceptedProposals[index].proProfilePicUrl.toString(),

                                  projectFile: "",)));}
                        }

                        ,



                        child: HoverContainer(
                          height: 150,
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
                                          _getAcceptedProposals[index].projectTitle.toString(),
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
                                          "Proposal Accepted at " +_getAcceptedProposals[index].proposalAcceptedTime.toString(),
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
                                          "Proposal Saved at " +_getAcceptedProposals[index].proposalAcceptedDate.toString(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
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
                          builder: (context) =>  OwnerViewProfile(currenUserEmailAPL.toString())));
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
