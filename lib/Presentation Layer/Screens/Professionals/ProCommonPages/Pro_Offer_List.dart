// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/models/OfferModel.dart';

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
String? _country;
String? _profilePhoto;
String? _ownerEmail;

class ProOfferList extends StatefulWidget {
  String email;
  ProOfferList(this.email);

  @override
  State<ProOfferList> createState() => _ProOfferList();
}

class _ProOfferList extends State<ProOfferList> {
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();

  @override
  Widget build(BuildContext context) {
    currenUserEmailOfferList = widget.email;
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

  List<OfferProposalsModel> _getOffer = [];

  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getOfferProposal().then((value) {
      setState(() {
        _getOffer.addAll(value);
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
            Column(
              children: [
                for (int index = 0; index < _getOffer.length; index++)
                  if (_getOffer[index].proEmail ==
                      currenUserEmailOfferList.toString())
                    SizedBox(
                        height: 160,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProOffers(
                                    _getOffer[index].proposalId.toString(),
                                    _getOffer[index].proEmail.toString(),
                                    _getOffer[index].proFirstName.toString(),
                                    _getOffer[index].proLastName.toString(),
                                    _getOffer[index].proCity.toString(),
                                    _getOffer[index].proCountry.toString(),
                                    _getOffer[index].profilePicUrl.toString(),
                                    _getOffer[index].offer.toString(),
                                    _getOffer[index].offerStatus.toString(),
                                    _getOffer[index]
                                        .offerSavedDate
                                        .toString())));
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 30, left: 20, bottom: 0),
                                          child: Text(
                                            _getOffer[index]
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
                                            "Offer Created at " +
                                                _getOffer[index]
                                                    .offerCreatedTime
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
                                                _getOffer[index]
                                                    .offerSavedDate
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
                                          child: offerStatus == "Rejected"
                                              ? Text(
                                                  "Your offer is Rejected !",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              : Text("")),
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
                          builder: (context) => ProViewProfile(
                              currenUserEmailOfferList.toString().toString())));
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
