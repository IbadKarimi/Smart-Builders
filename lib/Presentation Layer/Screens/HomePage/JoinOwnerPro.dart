import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../Owner/Owner_SignUp.dart';
import '../Owner/Owner_login.dart';
import '../Professionals/ProCommonPages/Pro_Add_Title.dart';
import '../Professionals/ProCommonPages/Pro_Sign_Up.dart';
import 'footer.dart';
import 'header.dart';

String? role;
class JoinOwnerPro extends StatefulWidget {
  const JoinOwnerPro({super.key});

  @override
  State<JoinOwnerPro> createState() => _JoinOwnerPro();
}

class _JoinOwnerPro extends State<JoinOwnerPro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Boxes(),
                    JoinOwnerProInterface(),
                    Footer(),
                  ],
                ))));
  }
}

class JoinOwnerProInterface extends StatefulWidget {
  const JoinOwnerProInterface({super.key});

  @override
  State<JoinOwnerProInterface> createState() => _JoinOwnerProInterface();
}

class _JoinOwnerProInterface extends State<JoinOwnerProInterface> {
  @override
  Widget build(BuildContext context) {
    const checkbox = false;
    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 120),
        width: 700,
        height: 600,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "Join as Owner or Professionals",
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      role="owner";
                    });
                  },
                  child: HoverContainer(
                      margin: const EdgeInsets.only(top: 100, left: 140),
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
                            margin: const EdgeInsets.only(top: 15, left: 145),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Center(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 50, left: 30),
                                  child: Row(
                                    children: const <Widget>[
                                      Text(
                                        "I'm a",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Owner, ",
                                          style: TextStyle(
                                            color: const Color(0xFFffa62b),
                                            fontSize: 16,
                                          )),
                                      Text(
                                        "hiring",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ))),
                          const Text(
                            "Professionals for projects",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {

                    setState(() {
                      role="professionals";
                    });
                  },
                  child: HoverContainer(
                      margin: const EdgeInsets.only(top: 100, left: 40),
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
                            margin: const EdgeInsets.only(top: 15, left: 145),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Center(
                              child: Padding(
                                  padding: EdgeInsets.only(top: 50, left: 30),
                                  child: Row(
                                    children: const <Widget>[
                                      Text(
                                        "I'm a",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Professional, ",
                                          style: TextStyle(
                                            color: const Color(0xFFffa62b),
                                            fontSize: 16,
                                          )),
                                    ],
                                  ))),
                          const Text(
                            "looking for work",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: SizedBox(
                    width: 180,
                    height: 35,
                    child: ElevatedButton(
                        onPressed: () {
                          if(role=="owner"){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  OwnerSignUp("owner")));
                          }
                          if(role=="professionals"){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  ProSignUp("professionals")));
                          }

                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Create an Account",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9900),
                        )))),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 260),
                child: Row(
                  children: <Widget>[
                    const Text(
                      "Already have an Account ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  Login()));
                        },
                        child: const Text("Login ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFffa62b),
                              fontSize: 14,
                            ))),
                  ],
                )),
          ],
        ));
  }
}
