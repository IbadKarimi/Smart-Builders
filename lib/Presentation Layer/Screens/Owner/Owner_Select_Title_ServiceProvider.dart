import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../HomePage/HiringProfessionals/Architect.dart';
import '../HomePage/HiringProfessionals/CivilEngineer.dart';
import '../HomePage/HiringProfessionals/Contractors.dart';
import '../HomePage/HiringProfessionals/SubContractors.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Pofile_Info.dart';

class AddTitleServiceProvider extends StatefulWidget {
  const AddTitleServiceProvider({super.key});

  @override
  State<AddTitleServiceProvider> createState() => _AddTitleServiceProvider();
}

class _AddTitleServiceProvider extends State<AddTitleServiceProvider> {
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
                  AddTitleServiceProviderInterface(),
                  Footer(),
                ],
              ),
            )));
  }
}

class AddTitleServiceProviderInterface extends StatefulWidget {
  const AddTitleServiceProviderInterface({super.key});

  @override
  State<AddTitleServiceProviderInterface> createState() =>
      _AddTitleServiceProviderInterface();
}

class _AddTitleServiceProviderInterface
    extends State<AddTitleServiceProviderInterface> {
  @override
  bool isOpen = false;
  String selectedOption = "Select Option";
  List<String> options = [
    "Contractor",
    'Subcontractor',
    'Civil Engineer',
    'Architect',
  ];
  Widget build(BuildContext context) {
    // List of items in our dropdown menu

    const checkbox = false;
    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 120),
        width: 700,
        height: 600,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "Add a title to tell the people what you do",
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "It is the very  first thing client see, so describe your experties",
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 16,
                  ),
                )),
            Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    GestureDetector(
                        onTap: () {
                          isOpen = !isOpen;
                          setState(() {});
                        },
                        child: Container(
                          width: 440,
                          height: 35,
                          margin: const EdgeInsets.only(left: 5, top: 0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black38, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(selectedOption),
                                Icon(
                                    isOpen
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        )),
                    if (isOpen)
                      Container(
                        width: 440,
                        margin: isOpen == true
                            ? EdgeInsets.only(left: 5)
                            : EdgeInsets.only(bottom: 500),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: ListView(
                            primary: true,
                            shrinkWrap: true,
                            children: options
                                .map((e) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            isOpen = false;
                                            selectedOption = e;

                                            setState(() {});
                                          },
                                          child: HoverContainer(
                                              height: 35,
                                              hoverDecoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xFFFFA62B),
                                                    width: 1),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Text(e),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                    ))
                                .toList()),
                      ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 100, left: 320),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      OwnerViewProfile("")));
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
                    padding: const EdgeInsets.only(top: 100, left: 20),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              if (selectedOption == "Contractor") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ContractorsMain()));
                              }
                              if (selectedOption == "Subcontractor") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const SubContractorsMain()));
                              }
                              if (selectedOption == "Civil Engineer") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const CivilEngineersMain()));
                              }
                              if (selectedOption == "Architect") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ArchitectMain()));
                              }
                            },
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "Next",
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFA62B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            )))),
              ],
            ),
          ],
        ));
  }
}
