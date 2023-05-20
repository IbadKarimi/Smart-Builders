// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../../../BuisnessLogic Layer/Api.dart';

import '../../../../models/OwnerSubmitProposalsModel.dart';
import '../../../models/OfferModel.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Accepted_Offer.dart';
import 'Owner_Offer.dart';
import 'Owner_View_Profile.dart';
import 'Owner_Offer.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

String? currenUserEmailAcceptedList;
String? ownerId;
String? _firstName;
String? _lastName;
String? _city;
String? _country;
String? _profilePhoto;
String? _ownerEmail;

class OwnerAcceptedOfferList extends StatefulWidget {
  String email;
  OwnerAcceptedOfferList(this.email);

  @override
  State<OwnerAcceptedOfferList> createState() => _OwnerAcceptedOfferList();
}

class _OwnerAcceptedOfferList extends State<OwnerAcceptedOfferList> {
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();

  @override
  Widget build(BuildContext context) {
    currenUserEmailAcceptedList = widget.email;
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
String? proposalCreatedTime;
String? proposalSavedTime;
String? length;

class MyOffersList extends StatefulWidget {
  const MyOffersList({super.key});

  @override
  State<MyOffersList> createState() => _MyOffersList();
}

class _MyOffersList extends State<MyOffersList> {
  ApiService apiService = new ApiService();

  List<OwnerSubmitProposalsModel> _getOwnerProposal = [];
  List<OfferProposalsModel> _getOfferProposal = [];

  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getOwnerSubmitProposal().then((value) {
      setState(() {
        _getOwnerProposal.addAll(value);
      });
    });
    apiService.getOfferProposal().then((value) {
      setState(() {
        _getOfferProposal.addAll(value);
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
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    "/Accepted Offers",
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
            Column(
              children: [
                for (int index = 0; index < _getOfferProposal.length; index++)
                  if( _getOfferProposal[index].ownerEmail.toString()==currenUserEmailAcceptedList.toString()&&_getOfferProposal[index].offerStatus.toString()=="Accepted")
                  SizedBox(
                      height: 160,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OwnerViewAcceptedOffers(
                                  _getOfferProposal[index].proposalId.toString(),
                                  _getOfferProposal[index].ownerEmail.toString(),
                                  _getOfferProposal[index].id.toString(),
                                  _getOfferProposal[index].proEmail.toString(),
                                  _getOfferProposal[index].proFirstName.toString(),
                                  _getOfferProposal[index].proLastName.toString(),
                                  _getOfferProposal[index].proCity.toString(),
                                  _getOfferProposal[index].proCountry.toString(),
                                  _getOfferProposal[index].profilePicUrl.toString(),
                                  _getOfferProposal[index].offer.toString(),
                                  _getOfferProposal[index].offerStatus.toString(),
                                  _getOfferProposal[index].offerSavedDate.toString())));
                        },
                        child: HoverContainer(
                          height: 160,
                          width: 800,
                          margin: const EdgeInsets.only(top: 10),
                          hoverDecoration: BoxDecoration(
                              color: const Color(0xFFFFEBCC),
                              border: Border(
                                top: BorderSide(color: strokeColor),
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
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 30, left: 20, bottom: 0),
                                        child: Text(
                                          _getOfferProposal[index]
                                              .projectTitle
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, left: 20, bottom: 0),
                                        child: Text(
                                          "Offer Accepted at " +
                                              _getOfferProposal[index]
                                                  .offerAcceptedTime
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, left: 20, bottom: 0),
                                        child: Text(
                                          "Offer Saved at " +
                                              _getOfferProposal[index]
                                                  .offerAcceptedDate
                                                  .toString(),
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
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ],
                          ),
                        ),
                      )),
              ],
            ),
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
                          builder: (context) => OwnerViewProfile(
                              currenUserEmailAcceptedList.toString().toString())));
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
