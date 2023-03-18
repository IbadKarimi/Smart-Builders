import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Professionals/ProfessionalsUserSetting/EditBillingMethod.dart';
import '../../Professionals/ProfessionalsUserSetting/UserSetting.dart';
import 'AccountInfoEdit.dart';
import 'Notification.dart';
import 'PasswordSecurity.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class BillingMethod extends StatefulWidget {
  const BillingMethod({super.key});

  @override
  State<BillingMethod> createState() => _BillingMethod();
}

class _BillingMethod extends State<BillingMethod> {
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
                          child: BillingMethodInterface(),
                        ),
                        Footer(),
                      ],
                    )))));
  }
}

class BillingMethodInterface extends StatefulWidget {
  const BillingMethodInterface({super.key});

  @override
  State<BillingMethodInterface> createState() => _BillingMethodInterface();
}

class _BillingMethodInterface extends State<BillingMethodInterface> {
  @override
  Widget build(BuildContext context) {
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
                          "Billing Method",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: 600.w,
                      height: 380.h,
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
                                  "Billing Method",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth < 800 ? 12 : 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ]),
                          const Padding(
                              padding: EdgeInsets.only(left: 30, top: 50),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "You have not set up any billing methods yet.",
                                    style: TextStyle(
                                      color: Color(0xFF3D424A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ))),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const EditBillingMethod()));
                              },
                              child: HoverContainer(
                                  width: 290,
                                  height: 38,
                                  margin: EdgeInsets.only(top: 50),
                                  hoverDecoration: BoxDecoration(
                                    color: Color(0xFF373C44),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFFFA62B), width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  // ignore: prefer_const_constructors
                                  child: Center(
                                    // ignore: prefer_const_constructors
                                    child: Text("Add a New Billing Method",
                                        style: TextStyle(
                                            color: Color(0xFFFFA62B))),
                                  ))),
                        ],
                      ),
                    )
                  ]))
            ]));
  }
}
//______________________-Account Info Container Ends Here
//---------------------------------------------------------------------------------------------------------------Location next container starts here
