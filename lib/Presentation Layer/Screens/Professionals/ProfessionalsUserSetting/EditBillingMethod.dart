import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/OwnerUserSetting/UserSetting.dart';
import '../../Owner/Owner_Desire_Building.dart';
import 'BilingMethod.dart';
import 'Notification.dart';
import 'PasswordSecurity.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class EditBillingMethod extends StatefulWidget {
  const EditBillingMethod({super.key});

  @override
  State<EditBillingMethod> createState() => _EditBillingMethod();
}

class _EditBillingMethod extends State<EditBillingMethod> {
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
                          child: EditBillingMethodInterface(),
                        ),
                        Footer(),
                      ],
                    )))));
  }
}

class EditBillingMethodInterface extends StatefulWidget {
  const EditBillingMethodInterface({super.key});

  @override
  State<EditBillingMethodInterface> createState() =>
      _EditBillingMethodInterface();
}

class _EditBillingMethodInterface extends State<EditBillingMethodInterface> {
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
                  margin: const EdgeInsets.only(top: 70, left: 0),
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
                margin: EdgeInsets.only(top: 70, left: 10.w),
              ),
              //straight line __________________________________________________
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 70.h, left: 35),
                        child: Text(
                          "Billing & Payment",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Container(
                      width: 600.w,
                      margin:
                          EdgeInsets.only(left: 30.w, top: 10.h, bottom: 70),
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
                                  "Add Billing Methods",
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
                                "Account Number",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth < 800 ? 12 : 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 10, left: 30),
                              child: SizedBox(
                                  width: 550,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.security),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        )),
                                  ))),
                          Padding(
                              padding: EdgeInsets.only(left: 30, top: 20),
                              child: Text(
                                "Account Title",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth < 800 ? 12 : 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 10, left: 30),
                              child: SizedBox(
                                  width: 550,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                  ))),
                          Padding(
                              padding: EdgeInsets.only(left: 30, top: 20),
                              child: Text(
                                "Billing Address",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth < 800 ? 12 : 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 30, bottom: 0),
                              child: Text(
                                "Country",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Container(
                              width: 550,
                              height: 35,
                              margin: const EdgeInsets.only(left: 30, top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black38, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: <BoxShadow>[]),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                value: UtcTime,
                                items: utcTimeItems.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Pakistan",
                                        style: TextStyle(
                                            color: Color(0xFF3D424A),
                                            fontSize: 12),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    UtcTime = newValue!;
                                  });
                                },
                                isExpanded: true,
                              ))),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 30, bottom: 10),
                                      child: Text(
                                        "City",
                                        style: TextStyle(
                                          color: Color(0xFF3D424A),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, right: 0),
                                      child: SizedBox(
                                          width: 270,
                                          height: 35,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            )),
                                          ))),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 10, bottom: 10),
                                      child: Text(
                                        "State/Province",
                                        style: TextStyle(
                                          color: Color(0xFF3D424A),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 0),
                                      child: SizedBox(
                                          width: 270,
                                          height: 32,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            )),
                                          ))),
                                ],
                              ),
                            ],
                          ),
                          //end of row
                          Padding(
                              padding: EdgeInsets.only(left: 30, top: 20),
                              child: Text(
                                "Zip/Postal Code",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth < 800 ? 12 : 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 10, left: 30),
                              child: SizedBox(
                                  width: 550,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                  ))),
                          Padding(
                              padding: EdgeInsets.only(left: 30, top: 20),
                              child: Text(
                                "Street Address",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth < 800 ? 12 : 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 10, left: 30),
                              child: SizedBox(
                                  width: 550,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                  ))),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 280, bottom: 50),
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
                                            style:
                                                TextStyle(color: Colors.black),
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
                                      top: 30, left: 20, bottom: 50),
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
                                                    EdgeInsets.only(left: 40),
                                                child: Center(
                                                    child: Center(
                                                        child: Text(
                                                  "Save",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                )))),
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
                        ],
                      ),
                    )
                  ]))
            ]));
  }
}
//______________________-Account Info Container Ends Here
//---------------------------------------------------------------------------------------------------------------Location next container starts here
