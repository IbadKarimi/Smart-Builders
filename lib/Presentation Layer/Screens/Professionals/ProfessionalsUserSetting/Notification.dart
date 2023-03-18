import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/OwnerUserSetting/UserSetting.dart';
import 'AccountInfoEdit.dart';
import 'BilingMethod.dart';
import 'PasswordSecurity.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class Notification_ extends StatefulWidget {
  const Notification_({super.key});

  @override
  State<Notification_> createState() => _Notification();
}

class _Notification extends State<Notification_> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screen = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
        designSize: const Size(1536, 792),
        builder: (context, child) => Scaffold(
            body: SingleChildScrollView(
                scrollDirection:
                    screenWidth > 1500 ? Axis.vertical : Axis.vertical,
                child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Boxes(),
                        SingleChildScrollView(
                          scrollDirection: screenWidth < 1300
                              ? Axis.horizontal
                              : Axis.vertical,
                          child: NotificationInterface(),
                        ),
                        Footer(),
                      ],
                    )))));
  }
}

class NotificationInterface extends StatefulWidget {
  const NotificationInterface({super.key});

  @override
  State<NotificationInterface> createState() => _NotificationInterface();
}

class _NotificationInterface extends State<NotificationInterface> {
  _NotificationInterface() {
    // default value placed here
    //default value set in constructor
  }

  bool isOpen = false;
  String selectedOption = "Select Option";
  List<String> options = [
    "All activity",
    'Important activity',
    'Nothing',
  ];

  String _selectedOption = "Select Option";
  List<String> _options = [
    "All activity",
    'Important activity',
    'Nothing',
  ];

  bool _isOpen = false;
  String _immediatelySelectedOption = "Select Option";
  List<String> _options1 = [
    "Immediately",
    'Every 15 minutes',
    'Once an hour',
    'Once a day',
  ];

  bool isOpenEmailDD = false;

  @override
  Widget build(BuildContext context) {
    bool checkbox = false;
    final screenWidth = MediaQuery.of(context).size.width;

    String UtcTime = 'UTC+05:00 Islamabad, Karachi';

    // List of items in our dropdown menu
    var utcTimeItems = [
      'UTC+05:00 Islamabad, Karachi',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    String Country = 'Country';

    // List of items in our dropdown menu
    var countryItems = [
      'Country',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];

    //final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: 900.w,
        margin: EdgeInsets.only(top: 80.h, bottom: 80.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: strokeColor)), // all the boxes are here like skill
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 60, left: 0),
                  width: 180.w,
                  height: 300.h,
                  child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 0, left: 0, bottom: 0),
                        child: Text(
                          "User Setting",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserSetting()));
                      },
                      child: HoverContainer(
                        width: 140.w,
                        height: 32.h,
                        margin:
                            EdgeInsets.only(top: 8.h, left: 40.w, bottom: 0),
                        hoverDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Color(0xFFFFA62B)),
                        child: Padding(
                            padding:
                                EdgeInsets.only(top: 6.h, left: 3.w, bottom: 0),
                            child: Text(
                              "Account Info",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ),
                    //Billing and Payment
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BillingMethod()));
                      },
                      child: HoverContainer(
                        width: 140.w,
                        height: 32.h,
                        margin:
                            EdgeInsets.only(top: 8.h, left: 40.w, bottom: 0),
                        hoverDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Color(0xFFFFA62B)),
                        child: Padding(
                            padding:
                                EdgeInsets.only(top: 6.h, left: 3.w, bottom: 0),
                            child: Text(
                              "Biling & Payment",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PasswordSecurity()));
                      },
                      child: HoverContainer(
                        width: 140.w,
                        height: 32.h,
                        margin:
                            EdgeInsets.only(top: 8.h, left: 40.w, bottom: 0),
                        hoverDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Color(0xFFFFA62B)),
                        child: Padding(
                            padding:
                                EdgeInsets.only(top: 6.h, left: 3.w, bottom: 0),
                            child: Text(
                              "Password & Security",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Notification_()));
                      },
                      child: HoverContainer(
                        width: 140.w,
                        height: 32.h,
                        margin:
                            EdgeInsets.only(top: 8.h, left: 40.w, bottom: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Color(0xFFFFA62B)),
                        hoverDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Color(0xFFFFA62B)),
                        child: Padding(
                            padding:
                                EdgeInsets.only(top: 6.h, left: 3.w, bottom: 0),
                            child: Text(
                              "Notification Setting",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ),
                  ])),
              //____________________________________________________________User Setting Button
              Container(
                width: 1.w,
                height: 300.h,
                color: TextlightGrey,
                margin: EdgeInsets.only(top: 60, left: 10.w),
              ),
              //straight line __________________________________________________
              Container(
                  child: Stack(children: <Widget>[
                //------------------------------------------------------last fields at the top

                //----------------------------check box------------------------------//
                Padding(
                    padding: const EdgeInsets.only(
                        top: 520,
                        left: 60,
                        bottom: 50), //----------------------check box end
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
                          'Only send when offline or idle',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    )), //-----------------------------------------------------------------last fields at the top of the page
                Padding(
                    padding: EdgeInsets.only(top: 60.h, left: 35),
                    child: Text(
                      "Notification Setting",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                //----------------------------------------------------Container---------------------------------//Rounded box
                Container(
                  width: 600.w,
                  height: 600,
                  margin: EdgeInsets.only(left: 30.w, top: 100.h, bottom: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: strokeColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 30, top: 20),
                            child: Text(
                              "Message",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth < 800 ? 12 : 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ]),
                      // end of row
                      Padding(
                          padding: EdgeInsets.only(left: 30, top: 20),
                          child: Text(
                            "Desktop",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth < 800 ? 12 : 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Text(
                            "Show notifications for:",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth < 800 ? 12 : 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      //------------------------------------------------------------------------------Stack Starts here
                      Stack(children: <Widget>[
                        //-----------------------------------------Drop Down field first----------starts here------------------
                        Padding(
                            padding: const EdgeInsets.only(top: 230, left: 30),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                      onTap: () {
                                        isOpenEmailDD = !isOpenEmailDD;
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 250,
                                        height: 35,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(_selectedOption),
                                              Icon(
                                                  isOpenEmailDD &&
                                                          _isOpen == false
                                                      ? Icons.arrow_drop_up
                                                      : Icons.arrow_drop_down,
                                                  color: Colors.black),
                                            ],
                                          ),
                                        ),
                                      )),
                                  if (isOpenEmailDD && _isOpen == false)
                                    Container(
                                      width: 250,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black38, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                                          isOpenEmailDD = false;
                                                          _selectedOption = e;
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
                                ],
                              ),
                            )),
                        //-------------next drop down-----------------------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              GestureDetector(
                                  onTap: () {
                                    _isOpen = !_isOpen;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 250,
                                    height: 35,
                                    margin:
                                        EdgeInsets.only(top: 230, left: 300),
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
                                          Text(_immediatelySelectedOption),
                                          Icon(
                                              _isOpen
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  )),
                              if (_isOpen && isOpenEmailDD == false)
                                Container(
                                  width: 250,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  margin: const EdgeInsets.only(left: 300),
                                  child: ListView(
                                      primary: true,
                                      shrinkWrap: true,
                                      children: _options1
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
                                                      _isOpen = false;
                                                      _immediatelySelectedOption =
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

                        Padding(
                            padding: EdgeInsets.only(left: 30, top: 160),
                            child: Text(
                              "Email Address",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth < 800 ? 12 : 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 190, left: 30, bottom: 0),
                            child: Text(
                              "(sending to a******91@gmail.com)",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 210, left: 30, bottom: 0),
                            child: Text(
                              "Send an email with unread activity for:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 30, top: 55),
                            child: Text(
                              "Increment message counter for:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth < 800 ? 12 : 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 85, left: 30),
                            child: SizedBox(
                                width: 300,
                                height: 35,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                                ))),
                        Container(
                          margin: const EdgeInsets.only(top: 140),
                          height: 1,
                          color: TextlightGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              GestureDetector(
                                  onTap: () {
                                    isOpen = !isOpen;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 300,
                                    height: 35,
                                    margin:
                                        const EdgeInsets.only(left: 30, top: 0),
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
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  margin: const EdgeInsets.only(left: 30),
                                  child: ListView(
                                      primary: true,
                                      shrinkWrap: true,
                                      children: options
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
                        //------------------------------------------------------------//

                        //check box
                        Padding(
                            padding: const EdgeInsets.only(top: 10, left: 340),
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
                                  'Also play a sound',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                      ]),

                      //end of row
                    ],
                  ),
                )
              ]))
            ]));
  }
}
//______________________-Account Info Container Ends Here
//---------------------------------------------------------------------------------------------------------------Location next container starts here
