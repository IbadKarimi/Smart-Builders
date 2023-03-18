import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';


import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Accept_Decline_Offer.dart';
import 'Owner_Select_Title_ServiceProvider.dart';


const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class ProposalsArchitect extends StatefulWidget {
  const ProposalsArchitect({super.key});

  @override
  State<ProposalsArchitect> createState() => _ProposalsArchitect();
}

class _ProposalsArchitect extends State<ProposalsArchitect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Boxes(),
                    ProposalArchitectI(),
                    PlotSize(),
                    ProjectRequirement(),
                    Padding(
                      padding: const EdgeInsets.only(left: 380, bottom: 80),
                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 550, bottom: 30),
                              child: SizedBox(
                                  width: 140,
                                  height: 35,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddTitleServiceProvider()));
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
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, bottom: 30),
                              child: Container(
                                  width: 140,
                                  height: 35,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      // ignore: sort_child_properties_last
                                      child: Row(children: const <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: Center(
                                                child: Text(
                                              "Review & Submit",
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
                                              Color(0xFFFFA62B))))),
                        ],
                      ),
                    ),
                    Footer(),
                  ],
                ))));
  }
}

class ProposalArchitectI extends StatefulWidget {
  const ProposalArchitectI({super.key});

  @override
  State<ProposalArchitectI> createState() => _ProposalArchitectI();
}

class _ProposalArchitectI extends State<ProposalArchitectI> {
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
        margin: const EdgeInsets.only(top: 60, bottom: 0),
        width: 900,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 50, left: 80, bottom: 0),
                child: Text(
                  "Add Details , write the proper requirement to hire a Professional for your project",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
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
          ],
        ));
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
        Center(
          child: Container(
            width: 900,
            margin: EdgeInsets.only(top: 30, left: 00, bottom: 40),
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
                      Container(
                          width: 150,
                          height: 38,
                          margin: const EdgeInsets.only(left: 50, top: 10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black38, width: 1),
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
        ),
      ],
    );
  }
}

class ProjectRequirement extends StatefulWidget {
  const ProjectRequirement({super.key});

  @override
  State<ProjectRequirement> createState() => _ProjectRequirement();
}

class _ProjectRequirement extends State<ProjectRequirement> {
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
  bool floor1 = false;
  bool floor2 = false;
  bool floor3 = false;
  bool floor4 = false;
  bool floor5 = false;

  bool Beds1 = false;
  bool Beds2 = false;
  bool Beds3 = false;
  bool Beds4 = false;
  bool Beds5 = false;

  bool Baths1 = false;
  bool Baths2 = false;
  bool Baths3 = false;
  bool Baths4 = false;
  bool Baths5 = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 900,
            margin: EdgeInsets.only(top: 20, left: 00, bottom: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF999999), width: 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 50, left: 60, bottom: 0),
                    child: Text(
                      "Add Project Requirement",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(top: 10, left: 60, bottom: 0),
                    child: Text(
                      '''
This is how Professional figures out what you need and why you’re great to work with!
Include your expectations about the task or deliverable, what you’re looking for in a work 
relationship, and anything unique about your project, team, or company. 
''',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 60, bottom: 0),
                    child: Text(
                      "Floors",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 55),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.floor1,
                              onChanged: (value) {
                                setState(() {
                                  this.floor1 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '1',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    //----------------//
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.floor2,
                              onChanged: (value) {
                                setState(() {
                                  this.floor2 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '2',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    //------------------------//
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.floor3,
                              onChanged: (value) {
                                setState(() {
                                  this.floor3 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '3',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    //-------------------//
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.floor4,
                              onChanged: (value) {
                                setState(() {
                                  this.floor4 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '4',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.floor5,
                              onChanged: (value) {
                                setState(() {
                                  this.floor5 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '5',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                  ],
                ),
                //---------------------------------Beds-----------------------//
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 60, bottom: 0),
                    child: Text(
                      "Beds",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 55),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Beds1,
                              onChanged: (value) {
                                setState(() {
                                  this.Beds1 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '1',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    //----------------//
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Beds2,
                              onChanged: (value) {
                                setState(() {
                                  this.Beds2 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '2',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    //------------------------//
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Beds3,
                              onChanged: (value) {
                                setState(() {
                                  this.Beds3 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '3',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    //-------------------//
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Beds4,
                              onChanged: (value) {
                                setState(() {
                                  this.Beds4 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '4',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Beds5,
                              onChanged: (value) {
                                setState(() {
                                  this.Beds5 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '5',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                  ],
                ),
                //------------------------Baths---------------------//
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 60, bottom: 0),
                    child: Text(
                      "Baths",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 55),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Baths1,
                              onChanged: (value) {
                                setState(() {
                                  this.Baths1 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '1',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    //----------------//
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Baths2,
                              onChanged: (value) {
                                setState(() {
                                  this.Baths2 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '2',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    //------------------------//
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Baths3,
                              onChanged: (value) {
                                setState(() {
                                  this.Baths3 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '3',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    //-------------------//
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Baths4,
                              onChanged: (value) {
                                setState(() {
                                  this.Baths4 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '4',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.Baths5,
                              onChanged: (value) {
                                setState(() {
                                  this.Baths5 = value as bool;
                                });
                              },
                            ),
                            const Text(
                              '5',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 60, bottom: 0),
                    child: Text(
                      "Architectural Style",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Colonial Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Cape Cod Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'French Colonial Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Contemporary Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Cottage Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Craftsman Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Farmhouse Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'French Country Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Greek Revival Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Mediterranean Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Modern Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Mid-century Modern Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Prairie Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Pueblo Revival Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Victorian Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Gothic Revival Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Second Empire',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Queen Anne Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 55),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.Baths5,
                          onChanged: (value) {
                            setState(() {
                              this.Baths5 = value as bool;
                            });
                          },
                        ),
                        const Text(
                          'Shingle Style',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                //--------------------------------Description-----------------//
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  child: const Text(
                    "Add Description",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
                Container(
                    height: 200,
                    width: 700,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: strokeColor, width: 1)),
                    margin: EdgeInsets.only(top: 20, left: 50, bottom: 10),
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
                //----------------------Attach File---------------//
                Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 20, left: 50),
                        child: Container(
                            width: 140,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: ElevatedButton(
                                onPressed: () {},
                                // ignore: sort_child_properties_last
                                child: Row(children: <Widget>[
                                  Icon(
                                    Icons.attach_file,
                                    color: Color(0xFFFFA62B),
                                    size: 20,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 3),
                                      child: Center(
                                          child: Text(
                                        "Attach File",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFFFFA62B)),
                                      ))),
                                ]),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    backgroundColor: Colors.white)))),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 10, left: 55, bottom: 20),
                    child: Text(
                      "Max file size: 100 MB",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            )));
  }
}
