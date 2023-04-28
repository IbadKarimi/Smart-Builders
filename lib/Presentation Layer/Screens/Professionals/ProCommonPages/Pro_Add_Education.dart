import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';
import '../../WorkExperience.dart';
import 'Pro_Select_Language.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class AddEducations extends StatefulWidget {
  const AddEducations({super.key});

  @override
  State<AddEducations> createState() => _AddEducations();
}

class _AddEducations extends State<AddEducations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.white,
              child: Column(
                children: const <Widget>[
                  Boxes(),
                  AddEducationInterface(),
                  Footer(),
                ],
              ),
            )));
  }
}

class AddEducationInterface extends StatefulWidget {
  const AddEducationInterface({super.key});

  @override
  State<AddEducationInterface> createState() => _AddEducationInterface();
}

class _AddEducationInterface extends State<AddEducationInterface> {
  @override
  Widget build(BuildContext context) {
    const checkbox = false;
    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 120),
        width: 700,
        height: 700,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, left: 0),
                child: Center(
                    child: Text(
                  "Client want to know what you know, add  education here.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ))),
            const Padding(
                padding: EdgeInsets.only(top: 40, left: 50),
                child: Text(
                  '''
You dont have a degree. Adding any relevant  education helps 
make your profile  more visible 
                  ''',
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 16,
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(top: 0, left: 50),
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF363B42),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddEducationAlertDialog();
                            });
                      },
                      /////////////////////////dialog ends herer.........
                      child: Center(
                          child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.only(top: 0, right: 0),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("logo/Plus.png"),
                                    fit: BoxFit.contain),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              )))),
                  // ignore: prefer_const_literals_to_create_immutables
                  Padding(
                      padding: EdgeInsets.only(top: 140, left: 80),
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Education",
                                style: TextStyle(
                                  color: Color(0xFFFFA62B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ))
                ])),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 140, left: 50),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                       WorkExperience1("")));
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
                    padding: const EdgeInsets.only(top: 140, left: 250),
                    child: Container(
                        width: 220,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectLanguage()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Center(
                                      child: Text(
                                    "Next,",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Add language",
                                    style: TextStyle(
                                        color: Color(0xFFFF9900), fontSize: 12),
                                  )),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ],
            ),
          ],
        ));
  }
}

class AddEducationAlertDialog extends StatefulWidget {
  const AddEducationAlertDialog({super.key});

  @override
  State<AddEducationAlertDialog> createState() =>
      _AddEducationAlertDialogState();
}

class _AddEducationAlertDialogState extends State<AddEducationAlertDialog> {
  String datesAttended = "From";
  String city = "City";
  String startDate = 'Month';
  String endDate = 'Month';
  String starDateYear = "Year";
  String endDateYear = "Year";
  //----------------------------------------//
  bool isOpenFrom = false;
  String selectedOptionFrom = "From";
  List<String> optionsFrom = [
    "1 to 10",
    '2 to 10',
    '3 to 10',
  ];
  //--------------------------------------//
  bool isOpenTo = false;
  String selectedOptionTo = "To";
  List<String> optionsTo = [
    "2019-2023",
    '2014-2019',
    '2010-2014',
  ];
  //-------------Degree Optional---------------------//
  bool isOpenDegreeOptional = false;
  String selectedDegreeOptional = "Degree Optional ";
  List<String> optionsDegreeOptional = [
    "Degree Optional",
    'Degree Optional',
    'Degree Optional',
  ];

  //-------------Area Study---------------------//
  bool isOpenAreaStudy = false;
  String selectedAreaStudy = "Area Study ";
  List<String> optionsAreaStudy = [
    "Area Study",
    'Area Study',
    'Area Study',
  ];

  // List of items in our dropdown menu
  var datesAttendedItems = [
    'From',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var cityItems = [
    'City',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var startDateItems = [
    'Month',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var endDateItems = [
    'Month',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var starDateYearItems = [
    'Year',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var endDateYearItem = [
    'Year',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Container(
                width: 650,
                height: 700,
                child: Column(children: <Widget>[
                  //  Form(),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.only(top: 20, right: 0),
                          child: Text(
                            "Add Education",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      const SizedBox(
                        width: 390,
                      ),
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 20, right: 590),
                      child: Text(
                        "School",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, right: 20),
                      child: SizedBox(
                          width: 640,
                          height: 35,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                          ))),
                  // ignore: prefer_const_literals_to_create_immutables
                  Row(children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 10, right: 0),
                        child: Text(
                          "Dates Attended(Optional)",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    //Drop down diplay in row
                  ]),
                  Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 210, right: 560),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Container(
                          height: 200,
                          width: 630,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: strokeColor, width: 1)),
                          margin:
                              EdgeInsets.only(top: 250, right: 10, bottom: 10),
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
                      Padding(
                          padding: EdgeInsets.only(top: 120, right: 530),
                          child: Text(
                            "Degree Optional",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          )),
                      //------------------------Degree Optional Drop Down--------------------//
                      Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              GestureDetector(
                                  onTap: () {
                                    isOpenDegreeOptional =
                                        !isOpenDegreeOptional;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 630,
                                    height: 35,
                                    margin: const EdgeInsets.only(
                                        left: 0, top: 150),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black38, width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(selectedDegreeOptional),
                                          Icon(
                                              isOpenDegreeOptional
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  )),
                              if (isOpenDegreeOptional)
                                Container(
                                  width: 630,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  margin: const EdgeInsets.only(left: 0),
                                  child: ListView(
                                      primary: true,
                                      shrinkWrap: true,
                                      children: optionsDegreeOptional
                                          .map((e) => Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      isOpenDegreeOptional =
                                                          false;
                                                      selectedDegreeOptional =
                                                          e;
                                                      setState(() {});
                                                    },
                                                    child: HoverContainer(
                                                        height: 35,
                                                        hoverDecoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xFFFFA62B),
                                                              width: 1),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                        ),
                      ]),

                      //Area of study
                      Padding(
                          padding: EdgeInsets.only(top: 50, right: 550),
                          child: Text(
                            "Area of Study",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          )),
                      //-------------------------------Area of Study Drop Down----------------------//
                      Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              GestureDetector(
                                  onTap: () {
                                    isOpenAreaStudy = !isOpenAreaStudy;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 630,
                                    height: 35,
                                    margin:
                                        const EdgeInsets.only(left: 0, top: 70),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black38, width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(selectedAreaStudy),
                                          Icon(
                                              isOpenAreaStudy
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  )),
                              if (isOpenAreaStudy)
                                Container(
                                  width: 630,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  margin: const EdgeInsets.only(left: 0),
                                  child: ListView(
                                      primary: true,
                                      shrinkWrap: true,
                                      children: optionsAreaStudy
                                          .map((e) => Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      isOpenAreaStudy = false;
                                                      selectedAreaStudy = e;
                                                      setState(() {});
                                                    },
                                                    child: HoverContainer(
                                                        height: 35,
                                                        hoverDecoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xFFFFA62B),
                                                              width: 1),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                        ),
                      ]),
                      Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    isOpenFrom = !isOpenFrom;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 300,
                                    height: 35,
                                    margin:
                                        const EdgeInsets.only(left: 0, top: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black38, width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(selectedOptionFrom),
                                          Icon(
                                              isOpenFrom
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  )),
                              if (isOpenFrom)
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  margin: const EdgeInsets.only(left: 0),
                                  child: ListView(
                                      primary: true,
                                      shrinkWrap: true,
                                      children: optionsFrom
                                          .map((e) => Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      isOpenFrom = false;
                                                      selectedOptionFrom = e;
                                                      setState(() {});
                                                    },
                                                    child: HoverContainer(
                                                        height: 35,
                                                        hoverDecoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xFFFFA62B),
                                                              width: 1),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                        ),
                      ]),
                      //--------------------------second drop down-----------------//
                      Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              GestureDetector(
                                  onTap: () {
                                    isOpenTo = !isOpenTo;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 300,
                                    height: 35,
                                    margin: const EdgeInsets.only(
                                        left: 330, top: 0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black38, width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(selectedOptionTo),
                                          Icon(
                                              isOpenTo
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  )),
                              if (isOpenTo)
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  margin: const EdgeInsets.only(left: 330),
                                  child: ListView(
                                      primary: true,
                                      shrinkWrap: true,
                                      children: optionsTo
                                          .map((e) => Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      isOpenTo = false;
                                                      selectedOptionTo = e;
                                                      setState(() {});
                                                    },
                                                    child: HoverContainer(
                                                        height: 35,
                                                        hoverDecoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xFFFFA62B),
                                                              width: 1),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
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
                        ),
                      ]),
                    ],
                  ),
                  //----------------------------end drop down rwo-----------------------//

                  //-----------------------------------------------------------------------------//

                  Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: SizedBox(
                              width: 140,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
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
                          padding: const EdgeInsets.only(top: 20, left: 340),
                          child: Container(
                              width: 140,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DesireBuilding()));
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Row(children: const <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Center(
                                            child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ))),
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
                ]))),
      );
    });
  }
}
