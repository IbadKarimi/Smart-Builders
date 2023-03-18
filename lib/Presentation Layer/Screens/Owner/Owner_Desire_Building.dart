import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Hire_Arcitect.dart';


class DesireBuilding extends StatefulWidget {
  const DesireBuilding({super.key});

  @override
  State<DesireBuilding> createState() => _DesireBuilding();
}

class _DesireBuilding extends State<DesireBuilding> {
  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    const Boxes(),
                    const DesireInterface(),
                    const Footer(),
                  ],
                ))));
  }
}

class DesireInterface extends StatefulWidget {
  const DesireInterface({super.key});

  @override
  State<DesireInterface> createState() => _DesireInterface();
}

class _DesireInterface extends State<DesireInterface> {
  @override
  Widget build(BuildContext context) {
    final _checkbox = false;
    return Container(
        margin: const EdgeInsets.only(top: 120, bottom: 120),
        width: 700,
        height: 600, //main box
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "Welcome to SMART BUILDER,tell us what you desire to build.",
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 20,
                  ),
                )),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: HoverContainer(
                      margin: const EdgeInsets.only(top: 100, left: 160),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xFF363B42),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      hoverDecoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 160),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(top: 60, left: 20),
                                  child: Text("Residential ",
                                      style: TextStyle(
                                        color: Color(0xFFffa62b),
                                        fontSize: 18,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(
                                    top: 60,
                                  ),
                                  child: Text(
                                    "Building",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: HoverContainer(
                      margin: const EdgeInsets.only(top: 100, left: 20),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xFF363B42),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      hoverDecoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 160),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(top: 60, left: 20),
                                  child: Text("Commercial ",
                                      style: TextStyle(
                                        color: Color(0xFFffa62b),
                                        fontSize: 18,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 60, left: 0),
                                  child: Text(
                                    "Building",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 60),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: _checkbox,
                      onChanged: (value) {
                        setState(() {
                          // _checkbox = false;
                        });
                      },
                    ),
                    const Text(
                      'Are you agree with your selection',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 70, left: 520),
                child: SizedBox(
                    width: 120,
                    height: 38,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HireArchitect()));
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: const Color(0xFFffa62b),
                        )))),
          ],
        ));
  }
}
