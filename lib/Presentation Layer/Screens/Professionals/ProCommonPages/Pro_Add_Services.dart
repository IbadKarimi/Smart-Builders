import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import 'Pro_Add_Rate.dart';
import 'Pro_Add_Skill.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddService();
}

class _AddService extends State<AddService> {
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
                  AddServiceInterface(),
                  Footer(),
                ],
              ),
            )));
  }
}

class AddServiceInterface extends StatefulWidget {
  const AddServiceInterface({super.key});

  @override
  State<AddServiceInterface> createState() => _AddServiceInterface();
}

class _AddServiceInterface extends State<AddServiceInterface> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Center(
                  child: Text(
                    "Tell us What are the main services you offer?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, left: 50),
                child: Text(
                  '''Choose  at least  one  service that best describes the type of work you do. 
This help us match you with clients who needs your unique expertise.    .
                  ''',
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 16,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 25, left: 50, bottom: 10),
                child: Text(
                  "Search for a Service you offer",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 0, left: 50),
                child: SizedBox(
                    width: 400,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                    ))),
            const Padding(
                padding: EdgeInsets.only(top: 10, left: 50, bottom: 10),
                child: Text(
                  "Suggested Services",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 200, left: 50),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddSkill()));
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
                    padding: const EdgeInsets.only(top: 200, left: 250),
                    child: Container(
                        width: 220,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddRate()));
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
                                    "Add your Rate Sq Ft",
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
