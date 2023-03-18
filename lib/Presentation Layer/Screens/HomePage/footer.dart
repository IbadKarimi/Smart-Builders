// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _Footer();
}

class _Footer extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        scrollDirection: ScreenWidth < 1400 ? Axis.horizontal : Axis.vertical,
        child: Column(children: <Widget>[
          Container(
              height: 600,
              width: 1550,
              color: const Color(0xFF363B42),
              child: Row(
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 70, right: 160),
                          child: Text("Smart Builder",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20))),
                      Padding(
                          padding: EdgeInsets.only(top: 40, left: 0),
                          child: Text('''
                           A small river named Duden flows by their place and supplies it
                           with the necessary regelialia.
                           ''',
                              style: TextStyle(
                                  color: Color(0xFFFF9900),
                                  fontWeight: FontWeight.w600))),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 70, right: 20),
                          child: HoverContainer(
                              hoverColor: Colors.amber,
                              // ignore: prefer_const_constructors
                              child: Text("Services",
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20)))),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 50),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "FooterImages/Contractor.jpg")),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 35, left: 10),
                                  child: Text("Contractor",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)))),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 80),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "FooterImages/SubContractor.jpg")),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 35, left: 10),
                                  child: Text("Sub-Contractor",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)))),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 80),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "FooterImages/CostEstimation.jpg")),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 35, left: 10),
                                  child: Text("Cost Estimation",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)))),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 90),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "FooterImages/MaterialSourcing.jpg")),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 35, left: 10),
                                  child: Text("Material Sourcing",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)))),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 85),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "FooterImages/Preconstruction.jpg")),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 35, left: 10),
                                  child: Text("Pre-Construction",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)))),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 80),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "FooterImages/ProjectTracking.jpg")),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                  padding: EdgeInsets.only(top: 0, left: 10),
                                  child: Text("Project Tracking",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  Column(
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.only(top: 70, left: 40),
                          child: Text("Quick Links",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20))),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 0),
                          child: GestureDetector(
                              onTap: () {},
                              child: const Text("> Home",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)))),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 0),
                          child: GestureDetector(
                              onTap: () {},
                              child: const Text("> About",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)))),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 0),
                          child: GestureDetector(
                              onTap: () {},
                              child: const Text("> Service",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)))),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 0),
                          child: GestureDetector(
                              onTap: () {},
                              child: const Text("> Contact",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)))),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 0),
                          child: GestureDetector(
                              onTap: () {},
                              child: const Text("> Project",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)))),
                    ],
                  ),
                  Column(children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 70, left: 80),
                        child: Text("Have a Question ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20))),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 40),
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image:
                                  AssetImage("FooterQuestionLogo/Location.png"),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: const Padding(
                                padding: EdgeInsets.only(top: 15, left: 15),
                                child: Text("i8 Islamabad",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14)))),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 20, left: 50),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image:
                                  AssetImage("FooterQuestionLogo/Contact.png"),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: const Padding(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: Text("03425949630",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14)))),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 20, left: 125),
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("FooterQuestionLogo/Mail.png"),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: const Padding(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: Text("smartbuilder@gmail.com",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14)))),
                      ],
                    ),
                  ]),
                ],
              )),
          SingleChildScrollView(
              scrollDirection:
                  ScreenWidth < 1400 ? Axis.horizontal : Axis.vertical,
              child: Container(
                  width: 1550,
                  height: 80,
                  color: const Color(0xFF3D424A),
                  child: const Center(
                      child: Text("Copyright @ 2022 All rights reserved",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600))))),
        ]));
  }
}
