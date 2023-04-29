// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hovering/hovering.dart';

import '../HomePage/Chat/ChatScreen.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import '../Professionals/ProCommonPages/Pro_View_Profile.dart';
import 'Owner_Desire_Building.dart';
import 'Owner_Mange_Offers.dart';


const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class OwnersAcceptOfferApplyContract extends StatefulWidget {
  const OwnersAcceptOfferApplyContract({super.key});

  @override
  State<OwnersAcceptOfferApplyContract> createState() =>
      _OwnersAcceptOfferApplyContract();
}

class _OwnersAcceptOfferApplyContract
    extends State<OwnersAcceptOfferApplyContract> {
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
                    ProjectProposal(),
                    ProposalServiceProviderI(),
                    PlotSize(),
                    DescribeYourProject(),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 0, right: 940, bottom: 50),
                        child: Container(
                            width: 140,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const OwnerManageOffers()));
                                },
                                // ignore: sort_child_properties_last
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Back",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
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
                height: 746,
                margin: const EdgeInsets.only(top: 50, bottom: 0, left: 230),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: strokeColor)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 50, bottom: 0),
                              child: Text(
                                "Status",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 30, left: 140, bottom: 0),
                              child: Text(
                                "Accepted",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 50, bottom: 0),
                              child: Text(
                                "Contract Title",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 85, bottom: 0),
                              child: Text(
                                "Build House",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 50, bottom: 0),
                              child: Text(
                                "Accepted By",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 95, bottom: 0),
                              child: Text(
                                "Ibad Karimi",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 50, bottom: 0),
                              child: Text(
                                "Offer Accepted Date",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 35, bottom: 0),
                              child: Text(
                                "January 23,2022",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 30, left: 50, bottom: 20),
                              child: Text(
                                "Contract Status",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 30, left: 73, bottom: 20),
                              child: Text(
                                "Pending",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                      ),

                      //------------------------------------------top end--------------------//

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 30, left: 50, bottom: 0),
                                child: Text(
                                  "Offers From Muhammad Abdullah Gul",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 30, left: 50, bottom: 0),
                                child: Text(
                                  "Offers",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 50, bottom: 0),
                                child: Text(
                                  "50000000",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 50, bottom: 0),
                                child: Text(
                                  "Rate Per Sq ft",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 50, bottom: 0),
                                child: Text(
                                  "350 per Sq ft",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 50, bottom: 0),
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 50, bottom: 20),
                                child: Text(
                                  '''This is my offer for your proposal if you'll agree on this than i'll going to
build your dream home''',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            //-----------------------button-------------------//
                          ]),
                      //=================================4
                    ])),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //------------------------profile and message
                Container(
                  width: 280,
                  margin: EdgeInsets.only(top: 50, left: 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: strokeColor, width: 1),
                      borderRadius: BorderRadius.circular(0)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height:
                                745, //----------------profile Container Height
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
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
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 30, right: 0),
                                              child: Text(
                                                  "Muhammad Abdullah Gul",
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
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, left: 20),
                                              child: Text(
                                                  "Lahore, Punjab, Pakistan",
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
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, left: 90),
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
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0, left: 0),
                                                  child: Container(
                                                      width: 210,
                                                      height: 40,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const DesireBuilding()));
                                                          },
                                                          // ignore: sort_child_properties_last
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        const Text(
                                                                          "Apply for",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 12),
                                                                        ),
                                                                        const Padding(
                                                                          padding:
                                                                              EdgeInsets.only(left: 5),
                                                                          child:
                                                                              Text(
                                                                            "Contract",
                                                                            style:
                                                                                TextStyle(color: Color(0xFFFFA62B), fontSize: 12),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )),
                                                              ]),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                  ),
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xFF363B42))))),
                                            ],
                                          ),
                                        ),
                                        //-------------------------------------------------//
                                      ])
                                ]))
                      ]),
                ),
              ],
            ),
          ],
        ),
        //---------------------------------last button
      ],
    );
  }
}

class ProposalServiceProviderI extends StatefulWidget {
  const ProposalServiceProviderI({super.key});

  @override
  State<ProposalServiceProviderI> createState() => _ProposalServiceProviderI();
}

class _ProposalServiceProviderI extends State<ProposalServiceProviderI> {
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
        margin: const EdgeInsets.only(top: 20, bottom: 0, left: 8),
        width: 1082,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 50, left: 50, bottom: 0),
                child: Text(
                  "Project Detail",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 50, left: 60, bottom: 0),
                child: Text(
                  "Project Title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 60),
                child: SizedBox(
                    width: 400,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                    ))),
            Stack(
              children: [
                RadioButtons(),
                const Padding(
                    padding: EdgeInsets.only(top: 10, left: 60, bottom: 0),
                    child: Text(
                      "Project Type",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(top: 90, left: 60, bottom: 0),
                    child: Text(
                      "How long will your work take",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                ProjectTypeCustomDropDown()
              ],
            ),
            //-----------------------------Project Budget-----------------//
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "Project Budget",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 50, bottom: 30),
                child: SizedBox(
                    width: 400,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                    ))),

            //----------------Review and Submit--------------//
          ],
        ));
  }
}

class ProjectTypeCustomDropDown extends StatefulWidget {
  @override
  State<ProjectTypeCustomDropDown> createState() =>
      _ProjectTypeCustomDropDownState();
}

class _ProjectTypeCustomDropDownState extends State<ProjectTypeCustomDropDown> {
  @override
  bool isOpenProjectType = false;
  String selectedOptionProjectType = "Select Option";
  List<String> optionsProjectTypeList = [
    "Residential ",
    'Commercial',
  ];
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
              padding: EdgeInsets.only(top: 30, left: 60),
              child: SizedBox(
                  width: 400,
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                  ))),
        ],
      ),
    );
  }
}

class RadioButtons extends StatefulWidget {
  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  @override
  String? _months;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, top: 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile(
            title: Text("1 to 3 months"),
            value: "1 to 3 months",
            groupValue: _months,
            onChanged: (value) {
              setState(() {
                _months = value.toString();
              });
            },
          ),
          RadioListTile(
            title: Text("3 to 6 months"),
            value: "",
            groupValue: _months,
            onChanged: (value) {
              setState(() {
                _months = value.toString();
              });
            },
          ),
          RadioListTile(
            title: Text("more than 6 months"),
            value: "more than 6 months",
            groupValue: _months,
            onChanged: (value) {
              setState(() {
                _months = value.toString();
              });
            },
          ),
        ],
      ),
    );
  }
}

class PlotSize extends StatefulWidget {
  const PlotSize({super.key});

  @override
  State<PlotSize> createState() => _PlotSize();
}

class _PlotSize extends State<PlotSize> {
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
          width: 1082,
          margin: EdgeInsets.only(top: 20, left: 8, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              border: Border.all(color: const Color(0xFF999999), width: 1)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
                padding: EdgeInsets.only(top: 40, left: 50, bottom: 0),
                child: Text(
                  "Plot size and location",
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
                              padding:
                                  EdgeInsets.only(top: 5, left: 10, bottom: 0),
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
                            decoration: const BoxDecoration(),
                            child: const TextField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ))),
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
                              padding:
                                  EdgeInsets.only(top: 5, left: 10, bottom: 0),
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
                    padding: EdgeInsets.only(top: 20, left: 210, bottom: 0),
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
                        child: Container(
                            width: 250,
                            height: 32,
                            decoration: const BoxDecoration(),
                            child: const TextField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ))),
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
                              padding:
                                  EdgeInsets.only(top: 5, left: 10, bottom: 0),
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
                            decoration: const BoxDecoration(),
                            child: const TextField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ))),
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
                              padding:
                                  EdgeInsets.only(top: 5, left: 10, bottom: 0),
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
                            decoration: const BoxDecoration(),
                            child: const TextField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ))),
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
                              padding:
                                  EdgeInsets.only(top: 5, left: 10, bottom: 0),
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
                        padding: EdgeInsets.only(top: 10, left: 50, bottom: 0),
                        child: Text(
                          "City",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                        width: 150,
                        height: 38,
                        margin: const EdgeInsets.only(left: 50, top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(0),
                            boxShadow: <BoxShadow>[]),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                          value: _selectedValue,
                          items: cityItems.map((e) {
                            return DropdownMenuItem(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0, left: 10),
                                  child: Text(
                                    e,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                value: e);
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedValue = newValue as String;
                            });
                          },
                          isExpanded: true,
                        ))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 10, left: 140, bottom: 0),
                        child: Text(
                          "Plot Location",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 140),
                        child: SizedBox(
                            width: 400,
                            height: 38,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              )),
                            ))),
                  ],
                )
              ],
            ),
            //------------------------------Sevearge System Location
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "Enter Sewerage System Location ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 50),
                child: SizedBox(
                    width: 400,
                    height: 38,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      )),
                    ))),
            //-------------------------------------------------------//
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "Enter Electric Pole Location  ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 50, bottom: 20),
                child: SizedBox(
                    width: 400,
                    height: 38,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      )),
                    ))),
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
        margin: const EdgeInsets.only(top: 10, bottom: 50, left: 8),
        width: 1082,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.only(top: 30, left: 50, bottom: 0),
              child: Text(
                "Project Description",
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
This is how you figures out what owner needs and why you’re great to work with! ''',
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
              margin: EdgeInsets.only(top: 20, left: 50, bottom: 50),
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    new TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        )),
                  ])),
          //---------------------Button-----------------//

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
