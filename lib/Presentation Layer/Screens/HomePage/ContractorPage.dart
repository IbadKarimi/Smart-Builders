import 'package:flutter/material.dart';

import '../Owner/Owner_Desire_Building.dart';
import 'footer.dart';
import 'header.dart';


class ContractorView extends StatefulWidget {
  const ContractorView({super.key});

  @override
  State<ContractorView> createState() => _ContractorView();
}

class _ContractorView extends State<ContractorView> {
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
                  children: <Widget>[
                    Boxes(),
                    ContractorViewInterface(),
                    Footer()
                  ],
                ))));
  }
}

class ContractorViewInterface extends StatefulWidget {
  const ContractorViewInterface({super.key});

  @override
  State<ContractorViewInterface> createState() => _ContractorViewInterface();
}

class _ContractorViewInterface extends State<ContractorViewInterface> {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      Stack(
        children: <Widget>[
          ContractorPic(),
          Padding(
              padding: EdgeInsets.only(top: 180, left: 50, bottom: 25),
              child: Text("Contractors",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ))),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                    margin: EdgeInsets.only(top: 200, left: 50),
                    child: Text("Manage your entire",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ))),
                Container(
                    margin: EdgeInsets.only(left: 50, bottom: 0),
                    child: Text("project—from the palm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          height: 0.9,
                        ))),
                Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Text("of your hand.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 50),
                    child: Text('''
Stay on schedule and on budget when you connect
everyone and everything on Smart Builder's Construction
Management Platform.
 ''',
                        style: TextStyle(
                          color: Color(0xFFFFA62B),
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ))),
              ]),
        ],
      ),
      //_________________________contractor profile starts here___________________________________________________
      Padding(
          padding: EdgeInsets.only(top: 250),
          child: Row(children: <Widget>[
            SizedBox(
              width: 180,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
            SizedBox(width: 60),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
          ])),
      //____________________________________________________________________________________________________

      Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(children: <Widget>[
            SizedBox(
              width: 180,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
            SizedBox(width: 60),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
          ])),
      //______________________________________________________________________
      Padding(
          padding: EdgeInsets.only(top: 20, bottom: 50),
          child: Row(children: <Widget>[
            SizedBox(
              width: 180,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(
                      top: 160,
                      left: 50,
                    ),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
            SizedBox(width: 60),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Contractor",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text("Smart builders PVT LTD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 100, left: 110),
                    child: Text("Lahore, Punjab, Pakistan",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 50),
                    child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Center(
                                      child: Text(
                                    "Hire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Center(
                                      child: Text(
                                    "Contractor",
                                    style: TextStyle(
                                        color: Color(0xFFFFA62B), fontSize: 12),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ]),
            ),
          ])),
    ]);
  }
}

class ContractorPic extends StatelessWidget {
  const ContractorPic({super.key});
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("HomeImages/ContractorsMain.jpeg");
    Image image = Image(
        width: MediaQuery.of(context).size.width,
        height: 700,
        image: assetImage,
        fit: BoxFit.cover,
        color: const Color.fromRGBO(110, 110, 110, 0.8),
        colorBlendMode: BlendMode.modulate);
    return image;
  }
}
