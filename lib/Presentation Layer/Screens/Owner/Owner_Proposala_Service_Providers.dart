import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../HomePage/HiringProfessionals/Contractors.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import '../Professionals/ProCommonPages/Pro_Porfile_Page.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class ProposalServiceProvider extends StatefulWidget {
  const ProposalServiceProvider({super.key});

  @override
  State<ProposalServiceProvider> createState() => _ProposalServiceProvider();
}

class _ProposalServiceProvider extends State<ProposalServiceProvider> {
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
                    ProposalServiceProviderI(),
                    PlotSize(),
                    DescribeYourProject(),
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
        margin: const EdgeInsets.only(top: 60, bottom: 10),
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
          GestureDetector(
              onTap: () {
                isOpenProjectType = !isOpenProjectType;
                setState(() {});
              },
              child: Container(
                width: 300,
                height: 35,
                margin: const EdgeInsets.only(left: 60, top: 30),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedOptionProjectType),
                      Icon(
                          isOpenProjectType
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.black),
                    ],
                  ),
                ),
              )),
          if (isOpenProjectType)
            Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black38, width: 1),
                  borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.only(left: 60),
              child: ListView(
                  primary: true,
                  shrinkWrap: true,
                  children: optionsProjectTypeList
                      .map((e) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  isOpenProjectType = false;
                                  selectedOptionProjectType = e;
                                  setState(() {});
                                },
                                child: HoverContainer(
                                    height: 35,
                                    hoverDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xFFFFA62B),
                                          width: 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(e),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ))
                      .toList()),
            ),
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
        Center(
          child: Container(
            width: 900,
            margin: EdgeInsets.only(top: 10, left: 00, bottom: 10),
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
        margin: const EdgeInsets.only(top: 10, bottom: 50),
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
                    new TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        )),
                  ])),
          //---------------------Button-----------------//
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50),
                  child: Container(
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(width: 1, color: Colors.grey)),
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
                                      fontSize: 14, color: Color(0xFFFFA62B)),
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
          //----------------Review and Submit--------------//
          Row(
            children: <Widget>[
              Padding(
                  padding:
                      const EdgeInsets.only(top: 10, left: 550, bottom: 30),
                  child: SizedBox(
                      width: 140,
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ContractorsMain()));
                          },
                          // ignore: sort_child_properties_last
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          )))),
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, bottom: 30),
                  child: Container(
                      width: 140,
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return OfferSentShowDialog();
                                });
                          },
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
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Color(0xFFFFA62B))))),
            ],
          ),
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
                                    builder: (context) => const ViewProfile()));
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
