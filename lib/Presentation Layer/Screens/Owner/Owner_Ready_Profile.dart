import 'package:flutter/material.dart';

import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Pofile_Info.dart';

final lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class OwnerNiceWork extends StatefulWidget {
  const OwnerNiceWork({super.key});

  @override
  State<OwnerNiceWork> createState() => _OwnerNiceWork();
}

class _OwnerNiceWork extends State<OwnerNiceWork> {
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
                    OwnerNiceWorkInterface(),
                    Footer()
                  ],
                ))));
  }
}

class OwnerNiceWorkInterface extends StatefulWidget {
  const OwnerNiceWorkInterface({super.key});

  @override
  State<OwnerNiceWorkInterface> createState() => _OwnerNiceWorkInterface();
}

class _OwnerNiceWorkInterface extends State<OwnerNiceWorkInterface> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 900,
      height: 800,
      margin: const EdgeInsets.only(top: 80, bottom: 80),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: strokeColor)),
      child: Container(
          child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 100),
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("Logo/NiceWork.png")),
              )),
          //text
          Wrap(
            children: const [
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 30),
                  child: Text("Nice Work,",
                      style: TextStyle(
                        color: strokeColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ))),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 30),
                  child: Text(
                    "Muhammad",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          ),
          const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Abdullah Gul!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Your Profile Ready",
                style: TextStyle(
                  color: Color(0xFFffa62b),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Wrap(
            children: const [
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 30),
                  child: Text(
                      "Congratulations! With thousands to choose from, It’s time to start ",
                      style: TextStyle(
                        color: strokeColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ))),
              Padding(
                  padding: EdgeInsets.only(left: 50, top: 0),
                  child: Text(
                    "bidding on roles that are the prefect fit for your skills.",
                    style: TextStyle(
                      color: strokeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ],
          ),
          Center(
              child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  width: 220,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OwnerViewProfile()));
                      },
                      // ignore: sort_child_properties_last
                      child: Row(children: const <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              "View,",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "My Profile",
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
      )), // all the boxes are here like skill
    );
  }
}