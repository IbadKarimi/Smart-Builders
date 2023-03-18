// ignore_for_file: sized_box_for_whitespace

import "package:flutter/material.dart";

import "../Owner/OwnerUserSetting/UserSetting.dart";
import "../Owner/Owner_Desire_Building.dart";
import "../Professionals/ProCommonPages/Pro_Porfile_Page.dart";
import "Chat/ChatScreen.dart";
import "JoinOwnerPro.dart";
import "home_page.dart";
import "onhover.dart";

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class Boxes extends StatefulWidget {
  const Boxes({super.key});

  @override
  State<Boxes> createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        scrollDirection: screenWidth < 1200 ? Axis.horizontal : Axis.vertical,
        child: Column(children: <Widget>[
          Container(
              height: 130,
              color: const Color(0xFF343a40),
              child: Column(children: <Widget>[
                Container(
                    color: const Color(0xFF343a40),
                    height: 50.0,
                    child: Row(
                      children: const <Widget>[
                        SizedBox(
                          width: 220,
                        ),
                        Text(
                          "Call :",
                          style: TextStyle(
                              color: Color(0xFFFFA62B),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "03008323643",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 550,
                        ),
                        Text(
                          "Email Address :",
                          style: TextStyle(
                              color: Color(0xFFFFA62B),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "smartbuilder@info",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                Container(
                  color: const Color(0xFF212529),
                  height: 80.0,
                  child: Column(children: const <Widget>[
                    NavBar(),
                  ]),
                ),
              ])),
        ]));
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      return const DesktopNavBar();
    });
  }
}

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        scrollDirection: screenWidth < 1200 ? Axis.horizontal : Axis.vertical,
        child: Row(
          children: [
            Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(top: 10, left: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("Logo/smartBuilderLogo.png")),
                )),
            //place logo here

            const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "SMART BUILDERS",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color(0xFFFFA62B),
                  ),
                )),
            const SizedBox(width: 100),
            const HoverText(), //all navigation home about services------------------------------------------------------------------------------------
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Container(
                  width: 180,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                  ),
                )),

            const Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: Text("LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            const SizedBox(width: 10),
            GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const JoinOwnerPro()));
                }),
                child: const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text("SIGN UP",
                        style: TextStyle(
                          color: Color(0xFFFFA62B),
                          fontWeight: FontWeight.w500,
                        )))),
            GestureDetector(
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Chat()));
              }),
              child: const Padding(
                padding: EdgeInsets.only(top: 30, left: 60),
                child: Text("Messages",
                    style: TextStyle(
                      color: Color(0xFFFFA62B),
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(top: 20, left: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFA62B),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black, width: 1),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("Logo/notification.png")),
                    ))),

            //_______________________________________________Clients click pop up menu item

            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                            padding: const EdgeInsets.only(
                                left: 1070, bottom: 200, right: 0),
                            child: AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                content: Container(
                                    width: 120,
                                    height: 300,
                                    child: Column(children: <Widget>[
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ViewProfile()));
                                          },
                                          child: Container(
                                              width: 60,
                                              height: 60,
                                              margin: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "TestomonialClientsImages/T-Clients.jpg")),
                                              ))),
                                      const Padding(
                                          padding: EdgeInsets.only(
                                              left: 0, top: 0, right: 0),
                                          child: Text("Muhammad Abdullah Gul",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text("Contractor",
                                              style: TextStyle(
                                                  color: TextlightGrey,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 40),
                                              child: SizedBox(
                                                  width: 70,
                                                  height: 35,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      // ignore: sort_child_properties_last
                                                      child: const Text(
                                                        "Online",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFD9D9D9),
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                      )))),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 0),
                                              child: Container(
                                                  width: 70,
                                                  height: 36,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const DesireBuilding()));
                                                      },
                                                      // ignore: sort_child_properties_last
                                                      child:
                                                          Row(children: const <
                                                              Widget>[
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 0),
                                                            child: Center(
                                                                child: Text(
                                                              "Invisible",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10),
                                                            ))),
                                                      ]),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              shape:
                                                                  const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10)),
                                                              ),
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFF363B42))))),
                                        ],
                                      ),
                                      // ----------------------My Profile----------------------//
                                      Row(children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ViewProfile()));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, left: 8),
                                              child: Icon(
                                                Icons.person,
                                                color: Colors.grey.shade700,
                                              ),
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ViewProfile()));
                                            },
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20,
                                                    left: 17,
                                                    bottom: 0),
                                                child: Text(
                                                  "My Profile",
                                                  style: TextStyle(
                                                    color: strokeColor,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ))),
                                      ]),
                                      Row(children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const UserSetting()));
                                            },
                                            child: Container(
                                                width: 20,
                                                height: 20,
                                                margin: const EdgeInsets.only(
                                                    top: 20, left: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    image: const DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "Logo/Setting.png"))))),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const UserSetting()));
                                            },
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20,
                                                    left: 20,
                                                    bottom: 0),
                                                child: Text(
                                                  "Setting",
                                                  style: TextStyle(
                                                    color: strokeColor,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ))),
                                      ]),
                                      Row(children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const PortFolioDialog();
                                                  });
                                            },
                                            child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const HomePage()));
                                                },
                                                child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20, left: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                "Logo/logout.png")))))),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePage()));
                                            },
                                            child: const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 20,
                                                    bottom: 0),
                                                child: Text(
                                                  "LogoOut",
                                                  style: TextStyle(
                                                    color: strokeColor,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ))),
                                      ]),
                                    ]))));
                      });
                },
                //ennd of gesture detector--------------------------------------------------------
                child: Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFA62B),
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    ))), //_______________________________________________________________________________________pop up menu click_____________
          ],
        ));
  }
}

class ParalleogramCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(240, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class Paralleogram extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(40, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(90, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class SmartBuilderLogo extends StatelessWidget {
  const SmartBuilderLogo({super.key});
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("HomeImages/HP1Pic.jpeg");
    Image image = Image(
        image: assetImage,
        color: const Color.fromRGBO(110, 110, 110, 0.8),
        colorBlendMode: BlendMode.modulate);
    return image;
  }
}
