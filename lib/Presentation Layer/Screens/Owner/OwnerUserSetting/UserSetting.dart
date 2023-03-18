import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Professionals/ProfessionalsUserSetting/AccountInfoEdit.dart';
import '../../Professionals/ProfessionalsUserSetting/BilingMethod.dart';
import '../../Professionals/ProfessionalsUserSetting/Notification.dart';
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

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSetting();
}

class _UserSetting extends State<UserSetting> {
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
                  children: <Widget>[Boxes(), UserSettingInterface(), Footer()],
                ))));
  }
}

class UserSettingInterface extends StatefulWidget {
  const UserSettingInterface({super.key});

  @override
  State<UserSettingInterface> createState() => _UserSettingInterface();
}

class _UserSettingInterface extends State<UserSettingInterface> {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: 900,
        height: 1550,
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
                          builder: (context) => const PasswordSecurity()));
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
                height: 350,
                margin: const EdgeInsets.only(left: 30, top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: strokeColor)),
                child: Column(
                  children: [
                    Row(children: <Widget>[
                      const Padding(
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
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AccountInfoEdit()));
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 20, left: 430),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: strokeColor, width: 1),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 3, left: 3, right: 3, top: 3),
                                  child: Image.asset(
                                    "PreviewProfilePic/edit.png",
                                    width: 15,
                                    height: 15,
                                  )))),
                    ]),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 480, bottom: 0),
                        child: Text(
                          "User Id",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 395, bottom: 0),
                        child: Text(
                          "Muhammad Abdullah 123",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 490, bottom: 0),
                        child: Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 395, bottom: 0),
                        child: Text(
                          "Muhammad Abdullah Gul",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 490, bottom: 0),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 415, bottom: 0),
                        child: Text(
                          "a*******@gmail.com",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    GestureDetector(
                      onDoubleTap: () {},
                      child: HoverContainer(
                        width: 140,
                        height: 32,
                        margin: EdgeInsets.only(top: 50, left: 440, bottom: 0),
                        hoverDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFFFA62B)),
                        child: const Padding(
                            padding:
                                EdgeInsets.only(top: 6, left: 8, bottom: 0),
                            child: Text(
                              "Close My Account",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 600,
                height: 350,
                margin: const EdgeInsets.only(left: 30, top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: strokeColor)),
                child: Column(
                  children: [
                    Row(children: <Widget>[
                      const Padding(
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
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AccountInfoEdit()));
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 20, left: 430),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: strokeColor, width: 1),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 3, left: 3, right: 3, top: 3),
                                  child: Image.asset(
                                    "PreviewProfilePic/edit.png",
                                    width: 15,
                                    height: 15,
                                  )))),
                    ]),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 460, bottom: 0),
                        child: Text(
                          "Time Zone",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 370, bottom: 0),
                        child: Text(
                          "UTC+05:00 Islamabad, Karachi",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 480, bottom: 0),
                        child: Text(
                          "Address",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 415, bottom: 0),
                        child: Text(
                          '''
jail road birdwood 13A
Lahore, PB 53720
Pakistan
''',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 10, right: 490, bottom: 0),
                        child: Text(
                          "Phone",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 460, bottom: 0),
                        child: Text(
                          "03008323643",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ],
                ),
              ),
              //next one after ;ocation_____________________________________________

              Container(
                width: 600,
                height: 650,
                margin: const EdgeInsets.only(left: 30, top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: strokeColor)),
                child: Column(
                  children: [
                    Row(children: <Widget>[
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
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AccountInfoEdit()));
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 20, left: 400),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: strokeColor, width: 1),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 3, left: 3, right: 3, top: 3),
                                  child: Image.asset(
                                    "PreviewProfilePic/edit.png",
                                    width: 15,
                                    height: 15,
                                  )))),
                    ]),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 500, bottom: 0),
                        child: Text(
                          "Title",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 470, bottom: 0),
                        child: Text(
                          "Contractor",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 490, bottom: 0),
                        child: Text(
                          "Skills",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 320, bottom: 0),
                        child: Text(
                          "Building and Engineering Knowledge",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 450, bottom: 0),
                        child: Text(
                          "Education",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 415, bottom: 0),
                        child: Text(
                          "BS Civil Engineering",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 440, bottom: 0),
                        child: Text(
                          "Experience",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 480, bottom: 0),
                        child: Text(
                          "10 Years",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 400, bottom: 0),
                        child: Text(
                          "Company Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 436, bottom: 0),
                        child: Text(
                          "Smart Builders",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 440, bottom: 0),
                        child: Text(
                          "CNINC No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 430, bottom: 0),
                        child: Text(
                          "37************1",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 450, bottom: 0),
                        child: Text(
                          "NTN No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 440, bottom: 0),
                        child: Text(
                          "1**********2",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 430, bottom: 0),
                        child: Text(
                          "License No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 415, bottom: 0),
                        child: Text(
                          "23**************2",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ],
                ),
              ),
              //_____________________________________________________________________nect
            ])),
          ],
        ));
  }
}
