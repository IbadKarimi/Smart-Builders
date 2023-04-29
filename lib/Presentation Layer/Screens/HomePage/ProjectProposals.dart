// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Owner/Owner_Desire_Building.dart';
import '../Professionals/ProCommonPages/Pro_Accepted_Proposals.dart';
import '../Professionals/ProCommonPages/Pro_View_Profile.dart';
import 'Chat/ChatScreen.dart';
import 'footer.dart';
import 'header.dart';
import 'home_page.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class ProjectProposalMain extends StatefulWidget {
  const ProjectProposalMain({super.key});

  @override
  State<ProjectProposalMain> createState() => _ProjectProposalMain();
}

class _ProjectProposalMain extends State<ProjectProposalMain> {
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
                  children: const <Widget>[
                    Boxes(),
                    ProjectProposal(),
                    Footer()
                  ],
                ))));
  }
}

class ProjectProposal extends StatefulWidget {
  const ProjectProposal({super.key});

  @override
  State<ProjectProposal> createState() => _ProjectProposal();
}

class _ProjectProposal extends State<ProjectProposal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 800,
                height: 1100,
                margin: const EdgeInsets.only(top: 50, bottom: 50, left: 230),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: strokeColor)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 20, bottom: 0),
                          child: Text(
                            "Project Proposals",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 70, left: 20, bottom: 0),
                          child: Text(
                            "Project Title",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, bottom: 20),
                          child: Text(
                            "Build House",
                            style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )),

                      //------------------------------------------top end--------------------//

                      Container(
                        height: 450,
                        width: 800,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(color: strokeColor),
                          bottom: BorderSide(color: strokeColor),
                        )),
                        child:
                            // ignore: prefer_const_literals_to_create_immutables
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              const Padding(
                                  padding: EdgeInsets.only(
                                      top: 30, left: 20, bottom: 0),
                                  child: Text(
                                    "Describe Your Project",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                              const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, bottom: 0),
                                  child: Text(
                                    "I want to build 5 marla house .....",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                              //-----------------------button-------------------//
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 300, left: 20),
                                  child: Container(
                                      width: 210,
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DesireBuilding()));
                                          },
                                          // ignore: sort_child_properties_last
                                          child: Row(children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        width: 40,
                                                        height: 40,
                                                        margin: const EdgeInsets
                                                            .only(left: 5),
                                                        child: const Icon(
                                                          Icons.folder,
                                                          color:
                                                              Color(0xFFFFA62B),
                                                        )),
                                                    const Text(
                                                      "Download",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "File",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFFA62B),
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      height: 40,
                                                      width: 1,
                                                      color: Colors.white,
                                                    ),
                                                    Container(
                                                        width: 40,
                                                        height: 40,
                                                        margin: const EdgeInsets
                                                            .only(left: 0),
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: const Icon(
                                                          Icons
                                                              .file_download_outlined,
                                                          color:
                                                              Color(0xFFFFA62B),
                                                        )),
                                                  ],
                                                )),
                                          ]),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              backgroundColor:
                                                  const Color(0xFF363B42)))))
                            ]),
                      ),
                      //=================================4
                      Container(
                        height: 350,
                        width: 800,
                        margin: const EdgeInsets.only(top: 0),
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
                                      padding: EdgeInsets.only(
                                          top: 30, left: 20, bottom: 0),
                                      child: Text(
                                        "Which Service Provider do you need",
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
                                        "Contractor",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 20, bottom: 0),
                                      child: Text(
                                        "How long will your work take",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 20, bottom: 0),
                                      child: Text(
                                        "3 to 6 months",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 20, bottom: 0),
                                      child: Text(
                                        "Project Budget",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 20, bottom: 0),
                                      child: Text(
                                        "3 to 6 months",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ]),
                          ],
                        ),
                      ),
                    ])),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 280,
                  margin: EdgeInsets.only(top: 50, left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: strokeColor, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 30, left: 0),
                          child: Container(
                              width: 210,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DesireBuilding()));
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Accept ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    "Proposals",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFFA62B),
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ]),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      backgroundColor:
                                          const Color(0xFF363B42))))),
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 0),
                          child: Container(
                              width: 210,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DesireBuilding()));
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Decline",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    "Proposals",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFFA62B),
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ]),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      backgroundColor:
                                          const Color(0xFF363B42))))),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 0, bottom: 25),
                          child: Container(
                              width: 210,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BidNowShowDialog();
                                        });
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Bid Now",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            )),
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
                ),
                //------------------------profile and message
                Container(
                  width: 280,
                  margin: EdgeInsets.only(top: 5, left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: strokeColor, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 250,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: 80,
                                      height: 80,
                                      margin: const EdgeInsets.only(
                                          top: 20, left: 20),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "TestomonialClientsImages/T-Clients.jpg")),
                                      )),
                                  const Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 0, right: 0),
                                      child: Text("Muhammad Abdullah Gul",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700))),
                                  const Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 20),
                                      child: Text("Business, employee at",
                                          style: TextStyle(
                                              color: TextlightGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400))),
                                  const Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 20),
                                      child: Text("Lahore, Punjab, Pakistan",
                                          style: TextStyle(
                                              color: TextlightGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400))),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: SizedBox(
                                              width: 90,
                                              height: 30,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Chat()));
                                                  },
                                                  // ignore: sort_child_properties_last
                                                  child: const Text(
                                                    "Message",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFFFFA62B),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                  )))),
                                    ],
                                  ),
                                ]))
                      ]),
                ),
              ],
            ),
          ],
        ),
        //---------------------------------last button
        Padding(
            padding: const EdgeInsets.only(top: 0, left: 220, bottom: 25),
            child: Container(
                width: 140,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AcceptedProposalMain()));
                    },
                    // ignore: sort_child_properties_last
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Back",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              )),
                        ]),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: const Color(0xFFFFA62B),
                    )))),
      ],
    );
  }
}

class BidNowShowDialog extends StatefulWidget {
  const BidNowShowDialog({super.key});

  @override
  State<BidNowShowDialog> createState() => _BidNowShowDialog();
}

class _BidNowShowDialog extends State<BidNowShowDialog> {
  _BidNowShowDialog() {
    _selectedValue = questionItems[0]; // default value placed here
    //default value set in constructor
  }
  String question = "Your Mother Maiden Name";
  final questionItems = [
    "Your Mother Maiden Name",
    'Your First Pets Name',
    'Your Best Friend Nick Name"',
    'Your Favorites Singer',
  ];

  String _selectedValue = ""; // new selected  value intialized here
  final answerController = TextEditingController(); // controller text
  @override
  Widget build(BuildContext context) {
    int? _value = 1;
    final _formKey = GlobalKey<FormState>(); // form global key
    // List of items in our dropdown menu

    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Form(
            key: _formKey,
            child: Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(left: 0, top: 20),
                        child: Text(
                          "Project Proposals",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Text(
                          "Project Title",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 10, right: 0, bottom: 0),
                        child: Text(
                          "Build house",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          "Project Description",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 10, right: 0, bottom: 0),
                        child: Text(
                          "I wan to build 5 marla house",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          "Project Budget",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 10, right: 0, bottom: 10),
                        child: Text(
                          "5000000",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Divider(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 10, right: 0, bottom: 10),
                              child: Text(
                                "Enter Offer",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 0, right: 0),
                              child: SizedBox(
                                  width: 350,
                                  height: 35,
                                  child: TextFormField(
                                    controller: answerController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                  ))),
                          //------------------------------------------//
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 10, right: 0, bottom: 10),
                              child: Text(
                                "Enter Rate Per Sq ft you offer  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 0, right: 0),
                              child: SizedBox(
                                  width: 350,
                                  height: 35,
                                  child: TextFormField(
                                    controller: answerController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                  ))),
                          //-------------------------------------------//
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 10, right: 0, bottom: 10),
                              child: Text(
                                "Enter Description  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Container(
                              height: 100,
                              width: 350,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: strokeColor, width: 1)),
                              margin: EdgeInsets.only(
                                  top: 20, right: 0, bottom: 10),
                              child: ListView(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    new TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ])),
                          //--------------------------------------------------//
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 60, left: 340),
                              child: Container(
                                  width: 140,
                                  height: 35,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); //previous alert dialog remove

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return OfferSentShowDialog();
                                            });
                                      },
                                      // ignore: sort_child_properties_last
                                      child: Row(children: const <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(left: 25),
                                            child: Center(
                                                child: Text(
                                              "Initiate Bid",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ))),
                                      ]),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          backgroundColor:
                                              const Color(0xFFFFA62B))))),
                        ]),
                  ],
                ))));
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
                    "Offer sent to Ibad Karimi!",
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
                                    builder: (context) =>  ProViewProfile("")));
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
