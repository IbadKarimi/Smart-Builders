// ignore: file_names
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Professionals/ProfessionalsUserSetting/User.dart';
import '../../Professionals/ProfessionalsUserSetting/UserSetting.dart';
import 'AccountInfoEdit.dart';
import 'BilingMethod.dart';
import 'Notification.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class PasswordSecurity extends StatefulWidget {
  const PasswordSecurity({super.key});

  @override
  State<PasswordSecurity> createState() => _PasswordSecurity();
}

class _PasswordSecurity extends State<PasswordSecurity> {
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
                          child: PasswordSecurityInterface(),
                        ),
                        Footer(),
                      ],
                    )))));
  }
}

class PasswordSecurityInterface extends StatefulWidget {
  const PasswordSecurityInterface({super.key});

  @override
  State<PasswordSecurityInterface> createState() =>
      _PasswordSecurityInterface();
}

class _PasswordSecurityInterface extends State<PasswordSecurityInterface> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String UtcTime = 'UTC+05:00 Islamabad, Karachi';
    int? _value = 1;

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
        height: 700,
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
                        decoration: BoxDecoration(
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 60.h, left: 35),
                        child: Text(
                          "Password and Security",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    //------------------------con
                    Container(
                      width: 600.w,
                      margin: EdgeInsets.only(left: 30.w, top: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: strokeColor)),
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 30, top: 20),
                                child: Text(
                                  "Authentication Option",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth < 800 ? 12 : 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            //edit Button
                            GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                            padding: const EdgeInsets.only(
                                              left: 100,
                                            ),
                                            child: AlertDialog(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                              content: Container(
                                                  width: 500,
                                                  height: 400,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0,
                                                                  top: 20),
                                                          child: Text(
                                                            "Change Password",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  screenWidth <
                                                                          800
                                                                      ? 12
                                                                      : 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          )),
                                                      const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20,
                                                                  bottom: 10),
                                                          child: Text(
                                                            "Old Password",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF3D424A),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 0,
                                                                  right: 0),
                                                          child: SizedBox(
                                                              width: 550,
                                                              height: 32,
                                                              child: TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                )),
                                                              ))),
                                                      const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20,
                                                                  bottom: 10),
                                                          child: Text(
                                                            "Confirm Password",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF3D424A),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 0,
                                                                  right: 0),
                                                          child: SizedBox(
                                                              width: 550,
                                                              height: 32,
                                                              child: TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                )),
                                                              ))),
                                                      const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20,
                                                                  bottom: 10),
                                                          child: Text(
                                                            "New Password",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF3D424A),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 0,
                                                                  right: 0),
                                                          child: SizedBox(
                                                              width: 550,
                                                              height: 32,
                                                              child: TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                )),
                                                              ))),
                                                      Row(
                                                        children: <Widget>[
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 20,
                                                                      left:
                                                                          200),
                                                              child: SizedBox(
                                                                  width: 140,
                                                                  height: 35,
                                                                  child: ElevatedButton(
                                                                      onPressed: () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      // ignore: sort_child_properties_last
                                                                      child: const Text(
                                                                        "Cancel",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            const Color(0xFFD9D9D9),
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
                                                                        ),
                                                                      )))),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 20,
                                                                      left: 20),
                                                              child: Container(
                                                                  width: 140,
                                                                  height: 35,
                                                                  child: ElevatedButton(
                                                                      onPressed: () {},
                                                                      // ignore: sort_child_properties_last
                                                                      child: Row(children: const <Widget>[
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 40),
                                                                            child: Center(
                                                                                child: Text(
                                                                              "Save",
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              ),
                                                                            ))),
                                                                      ]),
                                                                      style: ElevatedButton.styleFrom(
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0),
                                                                          ),
                                                                          backgroundColor: Color(0xFFFFA62B))))),
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                            ));
                                      });
                                  //end of on tap
                                },
                                child: Container(
                                    margin: EdgeInsets.only(top: 20, left: 330),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: strokeColor, width: 1),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 3,
                                            left: 3,
                                            right: 3,
                                            top: 3),
                                        child: Image.asset(
                                          "PreviewProfilePic/edit.png",
                                          width: 15,
                                          height: 15,
                                        )))),
                            //-----------------------ends edit button
                          ]),
                          const Padding(
                              padding: EdgeInsets.only(left: 30, top: 30),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Password.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ))),
                          //______________________________________--row passwrod has been send
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 30, top: 20),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image: AssetImage("Logo/accept.png"))),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 20, bottom: 30),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '''You currently use Google sigin-in to login. We will only ask for your Smart Builder
password if we need to verify your identity.''',
                                        style: TextStyle(
                                          color: TextlightGrey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ))),
                            ],
                          ),
                          //___________________________________end of rowe_________________________________
                        ],
                      ),
                    ),
                    //------------------------------------------second container---------------------------
                    Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          //------------------------con
                          Container(
                            width: 600.w,
                            margin: EdgeInsets.only(left: 30.w, top: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: strokeColor)),
                            child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 20),
                                      child: Text(
                                        "Two-Step Verification Process",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth < 800 ? 12 : 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                  //edit Button
                                  GestureDetector(
                                      onTap: () {
                                        //---------------------------------setting alert dialog
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 100, top: 00),
                                                  child: AlertDialog(
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                    content: Container(
                                                        width: 500,
                                                        height: 400,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left: 0,
                                                                        top:
                                                                            20),
                                                                child: Text(
                                                                  "Set your verification preferences",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        screenWidth <
                                                                                800
                                                                            ? 12
                                                                            : 18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                )),
                                                            const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                  "If we need to confirm it's you, which should we try first?",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF3D424A),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                )),
                                                            //-------------------radio button strats here
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 0,
                                                                        left:
                                                                            0),
                                                                child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Radio(
                                                                        value:
                                                                            1,
                                                                        groupValue:
                                                                            _value,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _value =
                                                                                value;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          "Text Message",
                                                                          style: TextStyle(
                                                                              color: TextlightGrey,
                                                                              fontSize: 16)),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      )
                                                                    ])),
                                                            Row(children: <
                                                                Widget>[
                                                              Radio(
                                                                value: 2,
                                                                groupValue:
                                                                    _value,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _value =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                              const Text(
                                                                  "Mobile Prompt",
                                                                  style: TextStyle(
                                                                      color:
                                                                          TextlightGrey,
                                                                      fontSize:
                                                                          16)),
                                                              const SizedBox(
                                                                width: 10,
                                                              )
                                                            ]),
                                                            //-------------------------end of radio button
                                                            const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                  "When should we confirm?",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF3D424A),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                )),
                                                            //-------------------------radio button
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 0,
                                                                        left:
                                                                            0),
                                                                child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Radio(
                                                                        value:
                                                                            1,
                                                                        groupValue:
                                                                            _value,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            _value =
                                                                                value;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          "When my login or activity seems risky",
                                                                          style: TextStyle(
                                                                              color: TextlightGrey,
                                                                              fontSize: 16)),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      )
                                                                    ])),
                                                            Row(children: <
                                                                Widget>[
                                                              Radio(
                                                                value: 2,
                                                                groupValue:
                                                                    _value,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _value =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                              const Text(
                                                                  "At every login and when my login or activity seems risky",
                                                                  style: TextStyle(
                                                                      color:
                                                                          TextlightGrey,
                                                                      fontSize:
                                                                          16)),
                                                              const SizedBox(
                                                                width: 10,
                                                              )
                                                            ]),
                                                            //-------------------------end radio
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 20,
                                                                        left:
                                                                            200),
                                                                    child: SizedBox(
                                                                        width: 140,
                                                                        height: 35,
                                                                        child: ElevatedButton(
                                                                            onPressed: () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            // ignore: sort_child_properties_last
                                                                            child: const Text(
                                                                              "Cancel",
                                                                              style: TextStyle(color: Colors.black),
                                                                            ),
                                                                            style: ElevatedButton.styleFrom(
                                                                              backgroundColor: const Color(0xFFD9D9D9),
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(30.0),
                                                                              ),
                                                                            )))),
                                                                Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top: 20,
                                                                        left:
                                                                            20),
                                                                    child: Container(
                                                                        width: 140,
                                                                        height: 35,
                                                                        child: ElevatedButton(
                                                                            onPressed: () {
                                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PasswordSecurity()));
                                                                            },
                                                                            // ignore: sort_child_properties_last
                                                                            child: Row(children: const <Widget>[
                                                                              Padding(
                                                                                  padding: EdgeInsets.only(left: 40),
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                    "Save",
                                                                                    style: TextStyle(
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
                                                  ));
                                            });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 270),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                color: strokeColor, width: 1),
                                          ),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 3,
                                                  left: 3,
                                                  right: 3,
                                                  top: 3),
                                              child: Image.asset(
                                                "Logo/setting1.png",
                                                width: 15,
                                                height: 15,
                                              )))),
                                  //-----------------------ends edit button
                                ]),
                                const Padding(
                                    padding: EdgeInsets.only(left: 30, top: 20),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '''
Add an extra layer of security to block unauthorized access and protect 
your account.''',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ))),
                                //______________________________________--column recommended
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                left: 30, top: 10),
                                            child: Text(
                                              "Text Message.",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, left: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Image.asset(
                                                  "Logo/question.png",
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.contain,
                                                ))),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 10),
                                            child: Text(
                                              "(Recommended)",
                                              style: TextStyle(
                                                color: TextlightGrey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, left: 200),
                                            child: SizedBox(
                                                width: 70,
                                                height: 30,
                                                child: LiteRollingSwitch(
                                                  value: true,
                                                  width: 70,
                                                  textOn: '|',
                                                  textOff: '|',
                                                  textOnColor: Colors.white,
                                                  colorOn: Colors.black,
                                                  colorOff: Color(0xFFFFA62B),
                                                  iconOn: Icons.circle_sharp,
                                                  iconOff: Icons.circle_sharp,
                                                  animationDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                  onDoubleTap: () {},
                                                  onSwipe: (value) {},
                                                  onTap: () {
                                                    showDialog(
                                                        //-------------------------------------toggle button alert dialog
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          // return MessageShowDialog();
                                                          return MessageShowDialog();
                                                        });
                                                  },
                                                  onChanged: (bool) {},
                                                ))),
                                      ],
                                    ),
                                    const Padding(
                                        padding:
                                            EdgeInsets.only(left: 30, top: 10),
                                        child: Text(
                                          "Receive a six digit code by text message to confirm it’s you.",
                                          style: TextStyle(
                                            color: TextlightGrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                    Row(
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                left: 30, top: 10),
                                            child: Text(
                                              "Mobile Prompt.",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10, left: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Image.asset(
                                                  "Logo/question.png",
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.contain,
                                                ))),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 10),
                                            child: Text(
                                              "(Recommended)",
                                              style: TextStyle(
                                                color: TextlightGrey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, left: 185),
                                            child: SizedBox(
                                                width: 70,
                                                height: 30,
                                                child: LiteRollingSwitch(
                                                  value: true,
                                                  width: 70,
                                                  textOn: '|',
                                                  textOff: '|',
                                                  textOnColor: Colors.white,
                                                  colorOn: Colors.black,
                                                  colorOff: Color(0xFFFFA62B),
                                                  iconOn: Icons.circle_sharp,
                                                  iconOff: Icons.circle_sharp,
                                                  animationDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                  onDoubleTap: () {},
                                                  onSwipe: (value) {},
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return const VerficationShowDialog();
                                                        });
                                                  },
                                                  onChanged: (bool) {},
                                                ))),
                                      ],
                                    ),
                                    const Padding(
                                        padding:
                                            EdgeInsets.only(left: 30, top: 10),
                                        child: Text(
                                          "Answer a question you choose to confirm it’s you.",
                                          style: TextStyle(
                                            color: TextlightGrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                left: 30, top: 10),
                                            child: Text(
                                              "Security Question.",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10, left: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Image.asset(
                                                  "Logo/question.png",
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.contain,
                                                ))),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 10),
                                            child: Text(
                                              "(Recommended)",
                                              style: TextStyle(
                                                color: TextlightGrey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 165),
                                            child: SizedBox(
                                                width: 70,
                                                height: 30,
                                                child: LiteRollingSwitch(
                                                  value: true,
                                                  width: 70,
                                                  textOn: '|',
                                                  textOff: '|',
                                                  textOnColor: Colors.white,
                                                  colorOn: Colors.black,
                                                  colorOff: Color(0xFFFFA62B),
                                                  iconOn: Icons.circle_sharp,
                                                  iconOff: Icons.circle_sharp,
                                                  animationDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                  onDoubleTap: () {},
                                                  onSwipe: (value) {},
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return const SecurityShowDialog();
                                                        });
                                                  },
                                                  onChanged: (bool) {},
                                                ))),
                                        //--------------end of switch button
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(
                                            left: 30, top: 10, bottom: 30),
                                        child: Text(
                                          "Answer a question you choose to confirm it’s you.",
                                          style: TextStyle(
                                            color: TextlightGrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ],
                                )

                                //___________________________________end of rowe_________________________________
                              ],
                            ),
                          )
                        ]))
                    //-------------------------------------------end of second container------------------
                  ]))
            ]));
  }
}
//______________________-Account Info Container Ends Here
//---------------------------------------------------------------------------------------------------------------Location next container starts here

class MessageShowDialog extends StatefulWidget {
  MessageShowDialog({super.key});

  @override
  State<MessageShowDialog> createState() => _MessageShowDialog();
}

class _MessageShowDialog extends State<MessageShowDialog> {
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
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(left: 0, top: 20),
                  child: Text(
                    "Add Your Mobile Number",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 60, left: 180),
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("Logo/keys.png")),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 0, top: 40),
                  child: Center(
                      child: Text(
                    "Add Your Mobile Number",
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
                    "Phone Verification (SMS",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ))),
              //-------------------------Add mobile no------------------//
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 150,
                      height: 32,
                      margin: const EdgeInsets.only(left: 0, top: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: <BoxShadow>[]),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                        value: addNo,
                        items: addNoItems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(children: <Widget>[
                                Container(
                                  width: 38,
                                  height: 38,
                                  margin: EdgeInsets.only(top: 0, left: 0),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            "Logo/Pakistan.png",
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 38,
                                  width: 0.5,
                                  color: TextlightGrey,
                                ),
                                const Text(
                                  "+92",
                                  style: TextStyle(
                                      color: Color(0xFF3D424A), fontSize: 12),
                                ),
                              ]),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            addNo = newValue!;
                          });
                        },
                        isExpanded: true,
                      ))),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 20),
                      child: SizedBox(
                          width: 300,
                          height: 35,
                          child: TextField(
                            decoration: InputDecoration(
                                label: Text("Mobile Number"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                          ))),
                ],
              ),

              //--------------------------Buttons-------------------------//
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 60, left: 200),
                      child: SizedBox(
                          width: 140,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              )))),
                  Padding(
                      padding: const EdgeInsets.only(top: 60, left: 20),
                      child: Container(
                          width: 140,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const VerficationShowDialog()));
                              },
                              // ignore: sort_child_properties_last
                              child: Row(children: const <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 40),
                                    child: Center(
                                        child: Text(
                                      "Next",
                                      style: TextStyle(
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

class VerficationShowDialog extends StatefulWidget {
  const VerficationShowDialog({super.key});

  @override
  State<VerficationShowDialog> createState() => _VerficationShowDialog();
}

class _VerficationShowDialog extends State<VerficationShowDialog> {
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
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(left: 0, top: 20),
                  child: Text(
                    "Add Your Mobile Number",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 60, left: 180),
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("Logo/keys.png")),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 0, top: 40),
                  child: Center(
                      child: Text(
                    "Enter SMS Code",
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
                    "Text Message Verification",
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
                    "We've sent a text message to",
                    style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ))),
              //-------------------------Add mobile no------------------//
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 120),
                      child: SizedBox(
                          width: 38,
                          height: 38,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5),
                      child: SizedBox(
                          width: 38,
                          height: 38,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5),
                      child: SizedBox(
                          width: 38,
                          height: 38,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5),
                      child: SizedBox(
                          width: 38,
                          height: 38,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5),
                      child: SizedBox(
                          width: 38,
                          height: 38,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5),
                      child: SizedBox(
                          width: 38,
                          height: 38,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                          ))),
                ],
              ),
              Row(children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(left: 140, top: 20),
                    child: Center(
                        child: Text(
                      "Didn't receive your code?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ))),
                Padding(
                    padding: const EdgeInsets.only(left: 5, top: 20),
                    child: Center(
                        child: GestureDetector(
                            onTap: (() {}),
                            child: const Text(
                              "Resend",
                              style: TextStyle(
                                color: Color(0xFFFFA62B),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )))),
              ]),

              //--------------------------Buttons-------------------------//
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 60, left: 200),
                      child: SizedBox(
                          width: 140,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              )))),
                  Padding(
                      padding: const EdgeInsets.only(top: 60, left: 20),
                      child: Container(
                          width: 140,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordSecurity()));
                              },
                              // ignore: sort_child_properties_last
                              child: Row(children: const <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 40),
                                    child: Center(
                                        child: Text(
                                      "Next",
                                      style: TextStyle(
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

class SecurityShowDialog extends StatefulWidget {
  const SecurityShowDialog({super.key});

  @override
  State<SecurityShowDialog> createState() => _SecurityShowDialog();
}

class _SecurityShowDialog extends State<SecurityShowDialog> {
  _SecurityShowDialog() {
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
                height: 550,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(left: 0, top: 20),
                        child: Text(
                          "Security Option",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          '''Before you can set a new security question, you’ll have to 
answer your current one correctly.''',
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 10, right: 0, bottom: 0),
                        child: Text(
                          "Question",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 350,
                              height: 38,
                              margin: const EdgeInsets.only(left: 0, top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black38, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const <BoxShadow>[]),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                value: _selectedValue,
                                items: questionItems.map((e) {
                                  return DropdownMenuItem(
                                      value: e,
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(e)));
                                }).toList(),
                                icon: const Icon(Icons.arrow_drop_down_circle,
                                    color: Color(0xFFFFA62B)),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedValue = newValue as String;
                                  });
                                },
                                isExpanded: true,
                              ))),
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 0, bottom: 0),
                              child: Text(
                                "Answer",
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
                                  height: 38,
                                  child: TextFormField(
                                    controller: answerController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                  ))),
                        ]),

                    //-------------------radio button strats here
                    Padding(
                        padding: const EdgeInsets.only(top: 50, left: 0),
                        child: Row(children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 20, left: 0),
                              child: Text(
                                  '''I understand my account will be locked if I am unable to 
 answer this question''',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16))),
                          const SizedBox(
                            width: 10,
                          )
                        ])),
                    Padding(
                        padding: const EdgeInsets.only(top: 20, left: 0),
                        child: Row(children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                          const Text("Keep me logged in on this device",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          const SizedBox(
                            width: 10,
                          )
                        ])),
                    //-------------------------end of radio button

                    Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 60, left: 200),
                            child: SizedBox(
                                width: 140,
                                height: 35,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    // ignore: sort_child_properties_last
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFD9D9D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    )))),
                        Padding(
                            padding: const EdgeInsets.only(top: 60, left: 20),
                            child: Container(
                                width: 140,
                                height: 35,
                                child: ElevatedButton(
                                    onPressed: () {
                                      // User user = User();
                                      // user.answerData = answerController.text;
                                      // user.dropDownData =
                                      // _selectedValue as String;
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PasswordSecurity()));
                                      //  Details(user: user)));
                                    },
                                    // ignore: sort_child_properties_last
                                    child: Row(children: const <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(left: 40),
                                          child: Center(
                                              child: Text(
                                            "Save",
                                            style: TextStyle(
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
                      ],
                    ),
                  ],
                ))));
  }

  User newMethod(User user) => user;
}
