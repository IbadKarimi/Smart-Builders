import 'package:flutter/material.dart';

import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Ready_Profile.dart';


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

class OwnerPreviewProfile extends StatefulWidget {
  const OwnerPreviewProfile({super.key});

  @override
  State<OwnerPreviewProfile> createState() => _OwnerPreviewProfile();
}

class _OwnerPreviewProfile extends State<OwnerPreviewProfile> {
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
                  children: const <Widget>[
                    Boxes(),
                    OwnerPreviewProfileInterface(),
                    Footer()
                  ],
                ))));
  }
}

class OwnerPreviewProfileInterface extends StatefulWidget {
  const OwnerPreviewProfileInterface({super.key});

  @override
  State<OwnerPreviewProfileInterface> createState() =>
      _OwnerPreviewProfileInterface();
}

class _OwnerPreviewProfileInterface
    extends State<OwnerPreviewProfileInterface> {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: 900,
        height: 800,
        margin: const EdgeInsets.only(top: 80, bottom: 80),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: strokeColor)), // all the boxes are here like skill
        child: Column(children: <Widget>[
          SubmitProfile(),
          Profile(),
          Padding(
              padding: const EdgeInsets.only(top: 60, left: 600),
              child: Container(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OwnerNiceWork()));
                      },
                      // ignore: sort_child_properties_last
                      child: Row(children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                  color: Color(0xFFFF9900), fontSize: 12),
                            )),
                      ]),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          backgroundColor: const Color(0xFF363B42))))),
        ]));
  }
}

class SubmitProfile extends StatefulWidget {
  const SubmitProfile({super.key});

  @override
  State<SubmitProfile> createState() => _SubmitProfileState();
}

class _SubmitProfileState extends State<SubmitProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 50),
          width: 800,
          height: 270,
          decoration:
              BoxDecoration(border: Border.all(color: const Color(0xFF999999))),
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                width: 800,
                decoration: const BoxDecoration(
                  color: lightGrey,
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: strokeColor),
                  ),
                ),
                child: const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, bottom: 0),
                    child: Text(
                      "Preview Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
              Row(
                children: <Widget>[getWelcome(), getWelcomeImage()],
              ),
            ],
          )),
    );
  }

  Widget getWelcome() {
    return Container(
        child: Column(
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.only(top: 20, right: 270, bottom: 0),
            child: Text(
              "Looking good, Muhammad!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )),
        const Padding(
            padding: EdgeInsets.only(top: 40, left: 40, bottom: 0),
            child: Text(
              "Make any edits you want, then submit your profile. You can make more changes when its live",
              style: TextStyle(
                color: TextlightGrey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )),
        //button
        Padding(
            padding: const EdgeInsets.only(top: 40, right: 350),
            child: Container(
                width: 130,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OwnerNiceWork()));
                    },
                    // ignore: sort_child_properties_last
                    child: Row(children: const <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Profile",
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
    ));
  }

  Widget getWelcomeImage() {
    return Container(
      margin: EdgeInsets.only(left: 50, top: 10),
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("PreviewProfilePic/Welcome.png"))),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      getProfileData(),
      getLocationLanguage(),
    ]);
  }

  Widget getProfileData() {
    return Container(
        width: 550,
        height: 300,
        margin: const EdgeInsets.only(top: 30, left: 50),
        decoration: BoxDecoration(border: Border.all(color: strokeColor)),
        child: Expanded(
            child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.only(top: 0, left: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")))),
              Container(
                  height: 120,
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: 90, bottom: 0),
                          child: Text(
                            "Muhammad Abdullah Gul",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 18,
                              height: 18,
                              margin: const EdgeInsets.only(top: 5, right: 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: const DecorationImage(
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          "PreviewProfilePic/placeholder.png")))),
                          const Padding(
                              padding: EdgeInsets.only(right: 205, top: 5),
                              child: Text("Lahore, PB",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600))),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(right: 170, top: 5),
                          child: Text("9:17 Pm Local Time",
                              style: TextStyle(
                                  color: TextlightGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))),

                      //about
                    ],
                  )),
            ]),
            //column
            Container(
                width: 120,
                height: 30,
                margin: EdgeInsets.only(right: 340, top: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: strokeColor, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                            margin: EdgeInsets.only(top: 0, left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 3, left: 3, right: 3, top: 3),
                                child: Image.asset(
                                  "PreviewProfilePic/edit.png",
                                  width: 15,
                                  height: 15,
                                )))),
                    const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text("Edit Profile",
                            style: TextStyle(
                                color: TextlightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600))),
                  ],
                )),
            Row(children: [
              const Padding(
                  padding: EdgeInsets.only(left: 50, top: 20, right: 80),
                  child: Text("Contractor",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600))),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: strokeColor, width: 1),
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
            //about
            Row(children: [
              const Padding(
                  padding: EdgeInsets.only(right: 20, top: 5, left: 50),
                  child: Text("About",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700))),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: strokeColor, width: 1),
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
          ],
        )));
  }

  Widget getLocationLanguage() {
    return Container(
        margin: const EdgeInsets.only(left: 0, bottom: 70),
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 0.5,
              color: strokeColor,
              margin: const EdgeInsets.only(left: 30, bottom: 20),
            ),
            const Padding(
                padding: EdgeInsets.only(right: 100, bottom: 0),
                child: Text(
                  "Location",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
            const Padding(
                padding: EdgeInsets.only(right: 102, top: 10),
                child: Text(
                  "Lahore, PB",
                  style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
            const Padding(
                padding: EdgeInsets.only(right: 115, bottom: 30),
                child: Text(
                  "Pakistan",
                  style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
            Container(
              width: 200,
              height: 0.5,
              color: strokeColor,
              margin: const EdgeInsets.only(left: 30),
            ),
            const Padding(
                padding: EdgeInsets.only(right: 90, top: 20),
                child: Text(
                  "Language",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
            const Padding(
                padding: EdgeInsets.only(right: 130, top: 10),
                child: Text(
                  "Urdu",
                  style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
            const Padding(
                padding: EdgeInsets.only(right: 85),
                child: Text(
                  "English Basic ",
                  style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ));
  }
}
