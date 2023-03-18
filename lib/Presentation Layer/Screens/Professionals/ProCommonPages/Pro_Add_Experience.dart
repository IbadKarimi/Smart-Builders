import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({super.key});

  @override
  State<AddExperience> createState() => _AddExperience();
}

class _AddExperience extends State<AddExperience> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.white,
              child: Column(
                children: const <Widget>[
                  Boxes(),
                  AddExperienceInterface(),
                  Footer(),
                ],
              ),
            )));
  }
}

class AddExperienceInterface extends StatefulWidget {
  const AddExperienceInterface({super.key});

  @override
  State<AddExperienceInterface> createState() => _AddExperienceInterface();
}

class _AddExperienceInterface extends State<AddExperienceInterface> {
  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Construction Services';

    // List of items in our dropdown menu
    var items = [
      'Construction Services',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
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
                  "Tell us What work are you here to do?",
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 80),
                child: Text(
                  '''
                  Your skills show clients what you can offer, and help us  choose which jobs
                  to recommend  to you. So, Start typing  to pick more, its up to you.
                  ''',
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 16,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 450, bottom: 10),
                child: Text(
                  "Your Skill",
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 0, left: 10),
                child: SizedBox(
                    width: 540,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                    ))),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 230, left: 30),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            )))),
                Padding(
                    padding: const EdgeInsets.only(top: 230, left: 290),
                    child: Container(
                        width: 220,
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
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Next,",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Add your experience",
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
            ),
          ],
        ));
  }
}
