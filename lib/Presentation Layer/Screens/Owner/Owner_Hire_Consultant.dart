// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Cost_Estimatiom.dart';

class HireConsultant extends StatefulWidget {
  const HireConsultant({super.key});

  @override
  State<HireConsultant> createState() => _HireConsultant();
}

class _HireConsultant extends State<HireConsultant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                child: Column(
              children: const <Widget>[
                Boxes(),
                HireConsultantInterface(),
                Footer(),
              ],
            ))));
  }
}

class HireConsultantInterface extends StatefulWidget {
  const HireConsultantInterface({super.key});

  @override
  State<HireConsultantInterface> createState() => _HireConsultantInterface();
}

class _HireConsultantInterface extends State<HireConsultantInterface> {
  @override
  Widget build(BuildContext context) {
    const checkbox = false;
    return Container(
      margin: const EdgeInsets.only(top: 120, bottom: 120),
      width: 800,
      height: 800,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF999999))),
      child: Column(children: <Widget>[
        const Padding(
            padding: EdgeInsets.only(top: 80, right: 0),
            child: Text(
              "Now approve plan for land title",
              style: TextStyle(
                color: Color(0xFF3D424A),
                fontSize: 24,
              ),
            )),
        Center(
            child: GestureDetector(
          onTap: () {},
          child: HoverContainer(
              margin: const EdgeInsets.only(top: 160, left: 0),
              width: 250,
              height: 250,
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 170),
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 80, left: 50),
                          child: Row(
                            children: const <Widget>[
                              Text("Hire ",
                                  style: TextStyle(
                                    color: const Color(0xFFffa62b),
                                    fontSize: 24,
                                  )),
                              Text(
                                "Consultant",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          )))
                ],
              )),
        )),
        Padding(
            padding: const EdgeInsets.only(top: 40, left: 60),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: checkbox,
                  onChanged: (value) {
                    setState(() {
                      // _checkbox = false;
                    });
                  },
                ),
                const Text(
                  'If plan is approved  click on checkbox and proceed to continue',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(top: 70, left: 520),
            child: SizedBox(
                width: 100,
                height: 38,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CostEstimation()));
                    },
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFffa62b),
                    )))),
      ]),
    );
  }
}
