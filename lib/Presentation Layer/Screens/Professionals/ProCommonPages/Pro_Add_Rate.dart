import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import 'Pro_Add_Services.dart';
import 'Pro_Personal_Info.dart';

class AddRate extends StatefulWidget {
  const AddRate({super.key});

  @override
  State<AddRate> createState() => _AddRate();
}

class _AddRate extends State<AddRate> {
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
                  AddRateInterface(),
                  Footer(),
                ],
              ),
            )));
  }
}

class AddRateInterface extends StatefulWidget {
  const AddRateInterface({super.key});

  @override
  State<AddRateInterface> createState() => _AddRateInterface();
}

class _AddRateInterface extends State<AddRateInterface> {
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
            Center(
              child: const Padding(
                  padding: EdgeInsets.only(top: 40, right: 0),
                  child: Text(
                    "Now, let's set your rate by per-square foot ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 40, left: 50),
                child: Text(
                  '''
Client will see rate on your profile and in search results once you publish your profile. . 
you can adjust your rate  every time you submit a proposal.
                  ''',
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 16,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, left: 50, bottom: 10),
                child: Text(
                  "Rate Per Square Foot",
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
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 230, left: 50),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddService()));
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
                    padding: const EdgeInsets.only(top: 230, left: 250),
                    child: Container(
                        width: 220,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ContractorProfile()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Next,",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Add your profile detail",
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
