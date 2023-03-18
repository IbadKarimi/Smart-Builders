import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../Admin/AdminProfile.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Professionals/ProfessionalsUserSetting/BilingMethod.dart';
import '../../Professionals/ProfessionalsUserSetting/UserSetting.dart';
import '../Owner_Desire_Building.dart';
import 'Notification.dart';
import 'PasswordSecurity.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
Widget EditButton() {
  return GestureDetector(
      onTap: () {},
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("PreviewProfilePic/edit.png")))));
}

class AccountInfoEdit extends StatefulWidget {
  const AccountInfoEdit({super.key});

  @override
  State<AccountInfoEdit> createState() => _AccountInfoEdit();
}

class _AccountInfoEdit extends State<AccountInfoEdit> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: screenWidth > 1500 ? Axis.vertical : Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Boxes(),
                    SingleChildScrollView(
                      scrollDirection:
                          screenWidth < 1300 ? Axis.horizontal : Axis.vertical,
                      child: AccountInfoEditInterface(),
                    ),
                    Footer(),
                  ],
                ))));
  }
}

class AccountInfoEditInterface extends StatefulWidget {
  const AccountInfoEditInterface({super.key});

  @override
  State<AccountInfoEditInterface> createState() => _AccountInfoEditInterface();
}

class _AccountInfoEditInterface extends State<AccountInfoEditInterface> {
  @override
  Widget build(BuildContext context) {
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
        width: 900,
        margin: const EdgeInsets.only(top: 80, bottom: 80),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: strokeColor)), // all the boxes are here like skill
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 60, left: 0),
                width: 200,
                height: 300,
                child: Column(children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(top: 0, left: 0, bottom: 0),
                      child: Text(
                        "User Setting",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserSetting()));
                    },
                    child: HoverContainer(
                      width: 140,
                      height: 32,
                      margin: EdgeInsets.only(top: 8, left: 40, bottom: 0),
                      hoverDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFFA62B)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFFA62B)),
                      child: const Padding(
                          padding: EdgeInsets.only(top: 6, left: 3, bottom: 0),
                          child: Text(
                            "Account Info",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
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
                      width: 140,
                      height: 32,
                      margin: EdgeInsets.only(top: 8, left: 40, bottom: 0),
                      hoverDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFFA62B)),
                      child: const Padding(
                          padding: EdgeInsets.only(top: 6, left: 3, bottom: 0),
                          child: Text(
                            "Biling & Payment",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PasswordSecurity()));
                    },
                    child: HoverContainer(
                      width: 140,
                      height: 32,
                      margin: EdgeInsets.only(top: 8, left: 40, bottom: 0),
                      hoverDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFFA62B)),
                      child: const Padding(
                          padding: EdgeInsets.only(top: 6, left: 3, bottom: 0),
                          child: Text(
                            "Password & Security",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
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
                      width: 140,
                      height: 32,
                      margin: EdgeInsets.only(top: 8, left: 40, bottom: 0),
                      hoverDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFFA62B)),
                      child: const Padding(
                          padding: EdgeInsets.only(top: 6, left: 3, bottom: 0),
                          child: Text(
                            "Notification Setting",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ),
                ])),
            //____________________________________________________________User Setting Button
            Container(
              width: 1,
              height: 300,
              color: TextlightGrey,
              margin: const EdgeInsets.only(top: 60, left: 10),
            ),
            Container(
                child: Column(children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 60, right: 460, bottom: 0),
                  child: Text(
                    "Account Info",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Container(
                width: 600,
                height: 380,
                margin: const EdgeInsets.only(left: 30, top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: strokeColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: const <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 30, bottom: 0),
                          child: Text(
                            "Account",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ]),
                    const Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, bottom: 10),
                        child: Text(
                          "First Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 0, left: 30),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                            ))),
                    //last name
                    const Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, bottom: 10),
                        child: Text(
                          "Last Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, left: 30),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                            ))),
                    const Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, bottom: 10),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, left: 30),
                        child: SizedBox(
                            width: 250,
                            height: 32,
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
                                top: 30, left: 30, bottom: 30),
                            child: SizedBox(
                                width: 140,
                                height: 35,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    // ignore: sort_child_properties_last
                                    child: const Text(
                                      "Update",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFFFA62B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    )))),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 20, bottom: 30),
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
                                            "Cancel",
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
                  ],
                ),
              ),
              //______________________-Account Info Container Ends Here
              //---------------------------------------------------------------------------------------------------------------Location next container starts here
              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 30, top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: strokeColor)),
                child: Column(
                  children: [
                    Row(children: const <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 30, bottom: 0),
                          child: Text(
                            "Location",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ]),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 480, bottom: 0),
                        child: Text(
                          "Time Zone",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Container(
                        width: 550,
                        height: 32,
                        margin: const EdgeInsets.only(left: 0, top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38, width: 1),
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
                                  "UTC+05:00 Islamabad, Karachi",
                                  style: TextStyle(
                                      color: Color(0xFF3D424A), fontSize: 12),
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
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 10, right: 490, bottom: 0),
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
                        height: 32,
                        margin: const EdgeInsets.only(left: 0, top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38, width: 1),
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
                                      color: Color(0xFF3D424A), fontSize: 12),
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
                    //----------------------------------city /state province
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, right: 210, bottom: 10),
                                child: Text(
                                  "City",
                                  style: TextStyle(
                                    color: Color(0xFF3D424A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 25, right: 0),
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
                        Column(
                          children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, right: 160, bottom: 10),
                                child: Text(
                                  "State/Province",
                                  style: TextStyle(
                                    color: Color(0xFF3D424A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 10, right: 0),
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
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 440, bottom: 10),
                        child: Text(
                          "Zip/Postal Code",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: SizedBox(
                            width: 550,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                            ))),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 480, bottom: 0),
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Container(
                        width: 550,
                        height: 32,
                        margin: const EdgeInsets.only(left: 0, top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: <BoxShadow>[]),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                          value: UtcTime,
                          items: utcTimeItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(children: <Widget>[
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const OverViewDialog();
                                            });
                                      },
                                      child: Container(
                                        width: 38,
                                        height: 38,
                                        margin:
                                            EdgeInsets.only(top: 0, left: 0),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "Logo/Pakistan.png",
                                                ),
                                                fit: BoxFit.cover)),
                                      )),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    height: 38,
                                    width: 0.5,
                                    color: TextlightGrey,
                                  ),
                                  const Text(
                                    "+92         Enter Number",
                                    style: TextStyle(
                                        color: Color(0xFF3D424A), fontSize: 12),
                                  ),
                                ]),
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
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 30, right: 430, bottom: 30),
                        child: SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                // ignore: sort_child_properties_last
                                child: const Text(
                                  "Update",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFFA62B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                )))),
                  ],
                ),
              ),
              //Other details________________________________________________________________________________________________________________________________________________

              Container(
                width: 600,
                margin: const EdgeInsets.only(left: 30, top: 10, bottom: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: strokeColor)),
                child: Column(
                  children: [
                    Row(children: const <Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 30, bottom: 0),
                          child: Text(
                            "Other Details",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ]),
                    //-------------------Column
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 500, bottom: 10),
                        child: Text(
                          "Title",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Container(
                        width: 250,
                        height: 32,
                        margin: const EdgeInsets.only(right: 280, top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: strokeColor, width: 1),
                            borderRadius: BorderRadius.circular(0),
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
                                  "Title",
                                  style: TextStyle(
                                      color: Color(0xFF3D424A), fontSize: 12),
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
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 500, bottom: 10),
                        child: Text(
                          "Skills",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, right: 280),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              )),
                            ))),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 475, bottom: 10),
                        child: Text(
                          "Education",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, right: 280),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              )),
                            ))),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 470, bottom: 10),
                        child: Text(
                          "Experience",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, right: 280),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              )),
                            ))),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 440, bottom: 10),
                        child: Text(
                          "Company Name",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, right: 280),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              )),
                            ))),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 480, bottom: 10),
                        child: Text(
                          "CNIC NO",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, right: 280),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              )),
                            ))),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 480, bottom: 10),
                        child: Text(
                          "NTN NO",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, right: 280),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              )),
                            ))),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 470, bottom: 10),
                        child: Text(
                          "License No",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 0, right: 280),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              )),
                            ))),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 470, bottom: 10),
                        child: Text(
                          "Permit No",
                          style: TextStyle(
                            color: Color(0xFF3D424A),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(top: 0, right: 280, bottom: 30),
                        child: SizedBox(
                            width: 250,
                            height: 32,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              )),
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 0, right: 400, bottom: 40),
                        child: SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                // ignore: sort_child_properties_last
                                child: const Text(
                                  "Update",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFFA62B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                )))),
                  ],
                ),
              ),
              //_____________________________________________________________________nect
            ])),
          ],
        ));
  }
}
