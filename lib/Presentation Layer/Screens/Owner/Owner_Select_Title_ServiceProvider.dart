import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Select_Contractor_Location.dart';
import 'package:smart_builder_web/models/OwnerSubmitProposalsModel.dart';

import '../HomePage/HiringProfessionals/Architect.dart';
import '../HomePage/HiringProfessionals/CivilEngineer.dart';
import '../HomePage/HiringProfessionals/Contractors.dart';
import '../HomePage/HiringProfessionals/SubContractors.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_View_Profile.dart';
import 'Owner_Proposals_Service_Providers.dart';
String? currentUserEmail;
String? firstName;
String? lastName;
String? city;
String? country;
String? profilePhotoUrl;
class SelectServiceProviderTitle extends StatefulWidget {
  String email;
  String firstName,lastName,city,country,profilePhotoUrl;
  SelectServiceProviderTitle(this.email,this.firstName,this.lastName,this.city,this.country,this.profilePhotoUrl);

  @override
  State<SelectServiceProviderTitle> createState() => _SelectServiceProviderTitle();
}

class _SelectServiceProviderTitle extends State<SelectServiceProviderTitle> {
  @override
  Widget build(BuildContext context) {
    firstName=widget.firstName;
    lastName=widget.lastName;
    city=widget.city;
    country=widget.country;
    profilePhotoUrl=widget.profilePhotoUrl;
    setState(() {
      currentUserEmail=widget.email;
    });
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Boxes(),
                  SelectServiceProviderTitleInterface(),
                  Footer(),
                ],
              ),
            )));
  }
}

class SelectServiceProviderTitleInterface extends StatefulWidget {
  const SelectServiceProviderTitleInterface({super.key});

  @override
  State<SelectServiceProviderTitleInterface> createState() =>
      _SelectServiceProviderTitleInterface();
}

class _SelectServiceProviderTitleInterface extends State<SelectServiceProviderTitleInterface> {
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
                  "Select a service provider which you want ",
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "It is your choice where you send the proposal",
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
                                      OwnerViewProfile(currentUserEmail.toString())));
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
                                        SelectContractorLocation(currentUserEmail.toString(),selectedOption.toString(), firstName.toString(), lastName.toString(), city.toString(),
                                            country.toString(), profilePhotoUrl.toString())));}



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
