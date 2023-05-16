// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../../../BuisnessLogic Layer/Api.dart';

import '../../../../models/OwnerSubmitProposalsModel.dart';

import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';

import 'ProOffers.dart';
import 'Pro_View_Profile.dart';
import 'Pro_View_Requested_Proposals.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

String? currenUserEmailOfferList;
String? ownerId;
String? _firstName;
String? _lastName;
String? _city;
String ?_country;
String? _profilePhoto;
String? _ownerEmail;






class ProOfferList extends StatefulWidget {
  String email;
  ProOfferList (this.email);

  @override
  State<ProOfferList > createState() => _ProOfferList ();
}

class _ProOfferList  extends State<ProOfferList > {

  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();


  @override
  Widget build(BuildContext context) {
    currenUserEmailOfferList=widget.email;
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
                    MyOffersList(),
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
class  MyOffersList extends StatefulWidget {
  const  MyOffersList({super.key});

  @override
  State<MyOffersList> createState() => _MyOffersList();
}

class _MyOffersList extends State<MyOffersList> {

  ApiService apiService = new ApiService();

  List<OwnerSubmitProposalsModel> _getOwnerProposal=[];

  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getOwnerSubmitProposal().then((value){
      setState(() {
        _getOwnerProposal.addAll(value);

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
                    "My Offers",
                    style: TextStyle(
                      color: Color(0xFFFFA62B),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 5, bottom: 0),
                  child: Text(
                    "/Offers",
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
               if (_getOwnerProposal[index].proEmail==currenUserEmailOfferList.toString()&&_getOwnerProposal[index].status=="Pending")
                SizedBox(
                    height: 160,
                    child:

                    GestureDetector(

                      onTap: (){
                        if(_getOwnerProposal[index].projectFile!=null){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProOffers(currenUserEmailOfferList.toString(),_getOwnerProposal[index].sId.toString(),_getOwnerProposal[index].email.toString(),_getOwnerProposal[index].status.toString(),_getOwnerProposal[index].projectTitle.toString(),_getOwnerProposal[index].projectType.toString(),_getOwnerProposal[index].workMonths.toString(),_getOwnerProposal[index].projectBudget.toString(),_getOwnerProposal[index].plotWidthA.toString(),
                                _getOwnerProposal[index].plotWidthB.toString(),_getOwnerProposal[index].plotLengthA.toString(),
                                _getOwnerProposal[index].plotLengthB.toString(),_getOwnerProposal[index].actualPlotSize.toString(),
                                _getOwnerProposal[index].floors.toString(),_getOwnerProposal[index].grroundFloor.toString(),
                                _getOwnerProposal[index].city.toString(),
                                _getOwnerProposal[index].plotLocation.toString(),_getOwnerProposal[index].describeYourProject.toString(),
                                _getOwnerProposal[index].firstName.toString(),_getOwnerProposal[index].lastName.toString(),_getOwnerProposal[index].ownerCity.toString(),_getOwnerProposal[index].country.toString(),_getOwnerProposal[index].profilePicUrl.toString(),
                                _getOwnerProposal[index].offer.toString(),_getOwnerProposal[index].offerSavedDate.toString(),_getOwnerProposal[index].offerStatus.toString(),projectFile: _getOwnerProposal[index].projectFile.toString(),)));}
                        else{
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProOffers(currenUserEmailOfferList.toString().toString(),_getOwnerProposal[index].sId.toString(),_getOwnerProposal[index].email.toString(),_getOwnerProposal[index].status.toString(),_getOwnerProposal[index].projectTitle.toString(),_getOwnerProposal[index].projectType.toString(),_getOwnerProposal[index].workMonths.toString(),_getOwnerProposal[index].projectBudget.toString(),_getOwnerProposal[index].plotWidthA.toString(),
                                _getOwnerProposal[index].plotWidthB.toString(),_getOwnerProposal[index].plotLengthA.toString(),
                                _getOwnerProposal[index].plotLengthB.toString(),_getOwnerProposal[index].actualPlotSize.toString(),
                                _getOwnerProposal[index].floors.toString(),_getOwnerProposal[index].grroundFloor.toString(),
                                _getOwnerProposal[index].city.toString(),
                                _getOwnerProposal[index].plotLocation.toString(),_getOwnerProposal[index].describeYourProject.toString()
                                ,  _getOwnerProposal[index].firstName.toString(),_getOwnerProposal[index].lastName.toString(),_getOwnerProposal[index].ownerCity.toString(),_getOwnerProposal[index].country.toString(),_getOwnerProposal[index].profilePicUrl.toString(),
                                _getOwnerProposal[index].offer.toString(),_getOwnerProposal[index].offerSavedDate.toString(),_getOwnerProposal[index].offerStatus.toString(),projectFile: "",)));}
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
                                        "Offer Created at " +_getOwnerProposal[index].offerCreatedTime.toString(),
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
                                        "Offer Saved at " +_getOwnerProposal[index].offerSavedDate.toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                  Padding(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 20, bottom: 0),
                                      child:offerStatus=="Rejected"? Text(
                                        "Your offer is Rejected !",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ):Text("")),

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
                          builder: (context) =>  ProViewProfile(currenUserEmailOfferList.toString().toString())));
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
