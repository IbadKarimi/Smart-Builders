// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';


import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Desire_Building.dart';
import 'Owner_Pofile_Info.dart';
import 'Owner_View_Submitted_Proposals.dart';


const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class OwnerSubmittedProposals extends StatefulWidget {
  const OwnerSubmittedProposals({super.key});

  @override
  State<OwnerSubmittedProposals> createState() => _OwnerSubmittedProposals();
}

class _OwnerSubmittedProposals extends State<OwnerSubmittedProposals> {
  @override
  Widget build(BuildContext context) {
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

class ViewProposal extends StatefulWidget {
  const ViewProposal({super.key});

  @override
  State<ViewProposal> createState() => _ViewProposal();
}

class _ViewProposal extends State<ViewProposal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 800,
        height: 600,
        margin: const EdgeInsets.only(top: 50, bottom: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: strokeColor)),
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
                  "/Submitted Proposals",
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

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ViewSubmittedProposals()));
            },
            child: HoverContainer(
              height: 150,
              width: 800,
              margin: const EdgeInsets.only(top: 20),
              hoverDecoration: BoxDecoration(
                  color: const Color(0xFFFFEBCC),
                  border: Border(
                    top: BorderSide(color: strokeColor),
                    bottom: BorderSide(color: strokeColor),
                  )),
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(color: strokeColor),
                bottom: BorderSide(color: strokeColor),
              )),
              child:
                  // ignore: prefer_const_literals_to_create_immutables
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                            padding:
                                EdgeInsets.only(top: 30, left: 20, bottom: 0),
                            child: Text(
                              "Build house",
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
                              "Created 2 Hours ago by you",
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
                              "Proposal Saved Dec-18-2022",
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
          ),
          //=================================4
          HoverContainer(
            height: 150,
            width: 800,
            margin: const EdgeInsets.only(top: 0),
            hoverDecoration: BoxDecoration(
                color: const Color(0xFFFFEBCC),
                border: Border(
                  bottom: BorderSide(color: strokeColor),
                )),
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: strokeColor),
            )),
            child:
                // ignore: prefer_const_literals_to_create_immutables
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 20, bottom: 0),
                          child: Text(
                            "Build house",
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
                            "Created 2 Hours ago by you",
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
                            "Proposal Saved Dec-18-2022",
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
          HoverContainer(
            height: 150,
            width: 800,
            margin: const EdgeInsets.only(top: 0),
            hoverDecoration: BoxDecoration(
                color: const Color(0xFFFFEBCC),
                border: Border(
                  bottom: BorderSide(color: strokeColor),
                )),
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: strokeColor),
            )),
            child:
                // ignore: prefer_const_literals_to_create_immutables
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 20, bottom: 0),
                          child: Text(
                            "Build house",
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
                            "Created 2 Hours ago by you",
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
                            "Proposal Saved Dec-18-2022",
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
          )
        ]));
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
                          builder: (context) =>  OwnerViewProfile("",)));
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
