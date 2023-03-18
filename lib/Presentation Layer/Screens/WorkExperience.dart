// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import 'HomePage/footer.dart';
import 'HomePage/header.dart';
import 'Owner/Owner_Desire_Building.dart';
import 'Professionals/ProCommonPages/Pro_Add_Education.dart';
import 'Professionals/ProCommonPages/Pro_Add_Title.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class WorkExperience1 extends StatefulWidget {
  const WorkExperience1({super.key});

  @override
  State<WorkExperience1> createState() => _WorkExperience1();
}

class _WorkExperience1 extends State<WorkExperience1> {
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
                  WorkExperienceInterface(),
                  Footer(),
                ],
              ),
            )));
  }
}

class WorkExperienceInterface extends StatefulWidget {
  const WorkExperienceInterface({super.key});

  @override
  State<WorkExperienceInterface> createState() => _WorkExperienceInterface();
}

class _WorkExperienceInterface extends State<WorkExperienceInterface> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 120),
        width: 700,
        height: 600,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "If you have a work experience , add it here",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  '''
Professional service providers who want to add their experience to win work, if you 
are just starting out, you can still create a great profile. Just head on to the next page
                  ''',
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 16,
                  ),
                )),
            //----------------------------Add Experinece Box
            Container(
                margin: const EdgeInsets.only(top: 0, right: 350),
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF363B42),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(children: <Widget>[
                  //--------------------------------------------alert dialog
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return showAddExperinceAlertDialog();
                            });
                      }, //-------------------------------------show dialog ends here----------------------------//
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
                  Padding(
                      padding: EdgeInsets.only(top: 130, left: 70),
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Experience",
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
                                  builder: (context) => const AddTitle()));
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
                                  builder: (context) => const AddEducations()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Center(
                                      child: Text(
                                    "Next,",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Add your education",
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

class showAddExperinceAlertDialog extends StatefulWidget {
  const showAddExperinceAlertDialog({super.key});

  @override
  State<showAddExperinceAlertDialog> createState() =>
      _showAddExperinceAlertDialogState();
}

class _showAddExperinceAlertDialogState
    extends State<showAddExperinceAlertDialog> {
  bool isOpen = false;
  String selectedOption = "City";
  List<String> options = [
    'Rawalpindi',
    'Islamabad',
    'Lahore',
    'Karachi',
    'Multan',
  ];

  //-----------------------------------Start End-----------//
  bool isOpenMonth = false;
  String selectedOptionMonth = "Month";
  List<String> optionsMonth = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  //-----------------------------------
  bool isOpenYear = false;
  String selectedOptionYear = "Year";
  List<String> optionsYear = [
    '1997',
    '1998',
    '1999',
    '2000',
    '2021',
    '2022',
    '2023',
  ]; //--------------------------------
  //-----------------------------------Start End-----------//
  bool isOpenMonthEnd = false;
  String selectedOptionMonthEnd = "Month";
  List<String> optionsMonthEnd = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  //-----------------------------------
  bool isOpenYearEnd = false;
  String selectedOptionYearEnd = "Year";
  List<String> optionsYearEnd = [
    '1997',
    '1998',
    '1999',
    '2000',
    '2021',
    '2022',
    '2023',
  ];

  String startDate = 'Month';
  String endDate = 'Month';
  String starDateYear = "Year";
  String endDateYear = "Year";

  // List of items in our dropdown menu

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
  static const checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: StatefulBuilder(builder: (context, setState) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Container(
                  width: 650,
                  height: 580,
                  child: Column(children: <Widget>[
                    //  Form(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(top: 20, right: 70),
                            child: Text(
                              "Add Work Experience",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        SizedBox(
                          width: 390,
                        ),
                      ],
                    ),

                    Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 610, bottom: 10),
                        child: Text(
                          "Title",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, right: 20),
                        child: SizedBox(
                            width: 640,
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                            ))),
                    Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 580, bottom: 10),
                        child: Text(
                          "Company",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, right: 20),
                        child: SizedBox(
                            width: 640,
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                            ))),
                    // ignore: prefer_const_literals_to_create_immutables
                    Row(children: <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 5),
                          child: Text(
                            "Location",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 275,
                            bottom: 10,
                          ),
                          child: Text(
                            "City",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ]),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        //--------------------------------------------------//check box im currently
                        Padding(
                            padding: const EdgeInsets.only(top: 40, left: 0),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  value: checkbox,
                                  onChanged: (value) {
                                    setState(() {
                                      // _checkbox = false;
                                    });
                                  },
                                ),
                                const Text(
                                  "I'm currently working in this side",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        //--------------------------------------------------------------//
                        //---------------------------------------------------------
                        Row(
                          children: const <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 80, bottom: 10, left: 5),
                                child: Text(
                                  "Start Date",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 80, bottom: 10, left: 245),
                                child: Text(
                                  "End Date",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ),
                        //--------------------------------------//Back and next button thats why remove the transparency
                        Row(
                          children: <Widget>[
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 220, left: 0),
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
                                          backgroundColor:
                                              const Color(0xFFD9D9D9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        )))),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 220, left: 350),
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
                                              padding:
                                                  EdgeInsets.only(left: 30),
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
                        //---------------------------------------------------------drop down starts here
                        Container(
                          margin: EdgeInsets.only(top: 120),
                          height: isOpenMonth == true ||
                                  isOpenYear == true ||
                                  isOpenMonthEnd == true ||
                                  isOpenYearEnd == true
                              ? 186
                              : 36,
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            isOpenMonth = !isOpenMonth;
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 150,
                                            height: 35,
                                            margin: const EdgeInsets.only(
                                                left: 0, top: 0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black38,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(selectedOptionMonth),
                                                  Icon(
                                                      isOpenMonth
                                                          ? Icons.arrow_drop_up
                                                          : Icons
                                                              .arrow_drop_down,
                                                      color: Colors.black),
                                                ],
                                              ),
                                            ),
                                          )),
                                      if (isOpenMonth)
                                        SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Container(
                                            width: 150,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black38,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            margin:
                                                const EdgeInsets.only(left: 0),
                                            child: ListView(
                                                primary: true,
                                                shrinkWrap: true,
                                                children: optionsMonth
                                                    .map((e) => Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                isOpenMonth =
                                                                    false;
                                                                selectedOptionMonth =
                                                                    e;
                                                                setState(() {});
                                                              },
                                                              child:
                                                                  HoverContainer(
                                                                      height:
                                                                          35,
                                                                      hoverDecoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        border: Border.all(
                                                                            color:
                                                                                const Color(0xFFFFA62B),
                                                                            width: 1),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Row(
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
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              //------------------------2nd drop down-------------------//

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          isOpenYear = !isOpenYear;
                                          setState(() {});
                                        },
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Container(
                                            width: 150,
                                            height: 35,
                                            margin: const EdgeInsets.only(
                                                left: 10, top: 0, right: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black38,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(selectedOptionYear),
                                                  Icon(
                                                      isOpenYear
                                                          ? Icons.arrow_drop_up
                                                          : Icons
                                                              .arrow_drop_down,
                                                      color: Colors.black),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                    if (isOpenYear)
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black38,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: ListView(
                                              primary: true,
                                              shrinkWrap: true,
                                              children:
                                                  optionsYear //--------------------list
                                                      .map((e) => Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  isOpenYear =
                                                                      false;
                                                                  selectedOptionYear =
                                                                      e;
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    HoverContainer(
                                                                        height:
                                                                            35,
                                                                        hoverDecoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                          border: Border.all(
                                                                              color: const Color(0xFFFFA62B),
                                                                              width: 1),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
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
                                      ),
                                  ],
                                ),
                              ),
                              //---------first drop down ending date---------------//
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          isOpenMonthEnd = !isOpenMonthEnd;
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 35,
                                          margin: const EdgeInsets.only(
                                              left: 0, top: 0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black38,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(selectedOptionMonthEnd),
                                                Icon(
                                                    isOpenMonthEnd
                                                        ? Icons.arrow_drop_up
                                                        : Icons.arrow_drop_down,
                                                    color: Colors.black),
                                              ],
                                            ),
                                          ),
                                        )),
                                    if (isOpenMonthEnd)
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black38,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          margin:
                                              const EdgeInsets.only(left: 0),
                                          child: ListView(
                                              primary: true,
                                              shrinkWrap: true,
                                              children: optionsMonthEnd
                                                  .map((e) => Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              isOpenMonthEnd =
                                                                  false;
                                                              selectedOptionMonthEnd =
                                                                  e;
                                                              setState(() {});
                                                            },
                                                            child:
                                                                HoverContainer(
                                                                    height: 35,
                                                                    hoverDecoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      border: Border.all(
                                                                          color: const Color(
                                                                              0xFFFFA62B),
                                                                          width:
                                                                              1),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                              e),
                                                                        ],
                                                                      ),
                                                                    )),
                                                          ),
                                                        ),
                                                      ))
                                                  .toList()),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              //------------------------2nd drop down-------------------//

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          isOpenYearEnd = !isOpenYearEnd;
                                          setState(() {});
                                        },
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Container(
                                            width: 150,
                                            height: 35,
                                            margin: const EdgeInsets.only(
                                                left: 10, top: 0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black38,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(selectedOptionYearEnd),
                                                  Icon(
                                                      isOpenYearEnd
                                                          ? Icons.arrow_drop_up
                                                          : Icons
                                                              .arrow_drop_down,
                                                      color: Colors.black),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                    if (isOpenYearEnd)
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black38,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: ListView(
                                              primary: true,
                                              shrinkWrap: true,
                                              children: optionsYearEnd
                                                  .map((e) => Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              isOpenYearEnd =
                                                                  false;
                                                              selectedOptionYearEnd =
                                                                  e;
                                                              setState(() {});
                                                            },
                                                            child:
                                                                HoverContainer(
                                                                    height: 35,
                                                                    hoverDecoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      border: Border.all(
                                                                          color: const Color(
                                                                              0xFFFFA62B),
                                                                          width:
                                                                              1),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                              e),
                                                                        ],
                                                                      ),
                                                                    )),
                                                          ),
                                                        ),
                                                      ))
                                                  .toList()),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //----------------------------------------------------------------------------//

                        Row(children: <Widget>[
                          Padding(
                              padding: isOpen == true
                                  ? EdgeInsets.only(
                                      bottom: 140,
                                    )
                                  : EdgeInsets.only(
                                      bottom: 0,
                                    ),
                              child: SizedBox(
                                  width: 300,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                  ))),

                          //location texxt field ends here

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      isOpen = !isOpen;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 300,
                                      height: 35,
                                      margin: const EdgeInsets.only(
                                          left: 30, top: 0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black38, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(selectedOption),
                                            Icon(
                                                isOpen
                                                    ? Icons.arrow_drop_up
                                                    : Icons.arrow_drop_down,
                                                color: Colors.black),
                                          ],
                                        ),
                                      ),
                                    )),
                                if (isOpen)
                                  SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Container(
                                      width: 300,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black38, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      margin: const EdgeInsets.only(left: 30),
                                      child: ListView(
                                          primary: true,
                                          shrinkWrap: true,
                                          children: options
                                              .map((e) => Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          isOpen = false;
                                                          selectedOption = e;
                                                          setState(() {});
                                                        },
                                                        child: HoverContainer(
                                                            height: 35,
                                                            hoverDecoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
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
                                  ),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),

                    // ignore: prefer_const_literals_to_create_immutables

                    //Back and Next Button--------------------------------------------------------------------------------------------
                  ]))),
        );
      }),
    );
  }
}
