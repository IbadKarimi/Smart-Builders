// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Hire_Consultant.dart';


class CostEstimation extends StatefulWidget {
  const CostEstimation({super.key});

  @override
  State<CostEstimation> createState() => _CostEstimation();
}

class _CostEstimation extends State<CostEstimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                child: Column(
              children: const <Widget>[
                Boxes(),
                HireArchitectInterface(),
                Footer(),
              ],
            ))));
  }
}

class HireArchitectInterface extends StatefulWidget {
  const HireArchitectInterface({super.key});

  @override
  State<HireArchitectInterface> createState() => _HireArchitectInterface();
}

class _HireArchitectInterface extends State<HireArchitectInterface> {
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
              "Now Estimate the cost of your project",
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
                              Text("Cost ",
                                  style: TextStyle(
                                    color: const Color(0xFFffa62b),
                                    fontSize: 24,
                                  )),
                              Text(
                                "Estimation",
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
                  'If cost is estimated then click the checkbox and proceed to continue',
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
                          builder: (context) => const HireConsultant()));
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
