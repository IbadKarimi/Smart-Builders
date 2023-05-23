import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../../../BuisnessLogic Layer/Api.dart';
import '../../../../models/ProWorkExperience.dart';
import '../../../../models/ProfessionalsProfileModel.dart';
import '../../Owner/Owner_Desire_Building.dart';
import '../../Owner/Owner_Proposals_Service_Providers.dart';
import '../../Professionals/ProCommonPages/Pro_View_Profile.dart';
import '../footer.dart';
import '../header.dart';

String? email;
String? proId;
String? firstName;
String? lastName;
String? title;
String? city;
String? country;
String ? experience;
String? profilePhoto;


class ContractorsMain extends StatefulWidget {

  const ContractorsMain({super.key});

  @override
  State<ContractorsMain> createState() => _ContractorsMain();
}

class _ContractorsMain extends State<ContractorsMain> {

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
                  Contractors(),
                  TopRatedContractors(),
                  SearchContractors(),
                  Footer(),
                ],
              ),
            )));
  }
}

class Contractors extends StatefulWidget {
  const Contractors({super.key});

  @override
  State<Contractors> createState() => _Contractors();
}

class _Contractors extends State<Contractors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  height: 500,
                  color: Colors.black,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 30, left: 60, bottom: 0),
                            child: Text(
                              "Contractors",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 30, left: 60, bottom: 0),
                            child: Text(
                              '''
Hiring the right contractors, Manage your entire project-from the 
palm of your hand.''',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 30, left: 60, bottom: 0),
                            child: Text(
                              "“Stay on schedule and on budget when you ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                        //---------------Row dual color text------------------//,
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 0, left: 65, bottom: 0),
                                child: Text(
                                  "connect everyone and everything on",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 0, left: 5, bottom: 0),
                                child: Text(
                                  "Smart",
                                  style: TextStyle(
                                    color: Color(0xFFFFA62B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ],
                        ),
                        //----------------------Dual text Row end--------------------------//
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 0, left: 65, bottom: 0),
                            child: Text(
                              "Builder's Construction Management Platform.”",
                              style: TextStyle(
                                color: Color(0xFFFFA62B),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                      ]),
                )),
            //------------------------------------------------------//

            Expanded(
              flex: 1,
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "HiringWorkersImages/HiringContractors.jpeg"),
                        fit: BoxFit.cover)),
              ),
            )
          ],
        )
      ],
    );
  }
}

class TopRatedContractors extends StatefulWidget {
  const TopRatedContractors({super.key});

  @override
  State<TopRatedContractors> createState() => _TopRatedContractors();
}

class _TopRatedContractors extends State<TopRatedContractors> {
  @override
  bool onChange = false;
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 40, left: 65, bottom: 0),
              child: Text(
                "Top Rated",
                style: TextStyle(
                  color: Color(0xFFFFA62B),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 65, bottom: 0),
              child: Text(
                "Contractors",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )),
          //----------------Grey Box--------------//
          Container(
              height: 600,
              margin: const EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFD9D9D9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //----------------Top Rated first profile starts--------------//
                  HoverContainer(
                    width: 300,
                    height: 500,
                    margin: const EdgeInsets.only(left: 110),
                    hoverDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFA62B),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF888787),
                        width: 1,
                      ),
                    ),
                    child: Stack(children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 30, left: 30),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "TestomonialClientsImages/T-Clients.jpg")),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 50, left: 140),
                          child: Text("Muhammad Asif",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700))),
                      const Padding(
                          padding: EdgeInsets.only(top: 70, left: 140),
                          child: Text("Contractors",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))),
                      const Padding(
                          padding: EdgeInsets.only(top: 90, left: 140),
                          child: Text("Work Experience: 10 year ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      const Padding(
                          padding: EdgeInsets.only(top: 110, left: 140),
                          child: Text("Islamabad, Pakistan",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      Padding(
                          padding: const EdgeInsets.only(top: 270, left: 0),
                          child: Center(
                            child: Container(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
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
                                                color: Colors.white,
                                                fontSize: 12),
                                          ))),
                                      Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Center(
                                              child: Text(
                                            "Contractor",
                                            style: TextStyle(
                                                color: Color(0xFFFFA62B),
                                                fontSize: 12),
                                          ))),
                                    ]),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF363B42)))),
                          )),
                    ]),
                  ),
                  //------------------2nd pr0file ends----------------------//
                  HoverContainer(
                    width: 300,
                    height: 500,
                    margin: const EdgeInsets.only(left: 40),
                    hoverDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFA62B),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF888787),
                        width: 1,
                      ),
                    ),
                    child: Stack(children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 30, left: 30),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "TestomonialClientsImages/T-Clients.jpg")),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 50, left: 140),
                          child: Text("Muhammad Asif",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700))),
                      const Padding(
                          padding: EdgeInsets.only(top: 70, left: 140),
                          child: Text("Contractors",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))),
                      const Padding(
                          padding: EdgeInsets.only(top: 90, left: 140),
                          child: Text("Work Experience: 10 year ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      const Padding(
                          padding: EdgeInsets.only(top: 110, left: 140),
                          child: Text("Islamabad, Pakistan",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      Padding(
                          padding: const EdgeInsets.only(top: 270, left: 0),
                          child: Center(
                            child: Container(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
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
                                                color: Colors.white,
                                                fontSize: 12),
                                          ))),
                                      Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Center(
                                              child: Text(
                                            "Contractor",
                                            style: TextStyle(
                                                color: Color(0xFFFFA62B),
                                                fontSize: 12),
                                          ))),
                                    ]),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF363B42)))),
                          )),
                    ]),
                  ),
                  //---------------------------3rd Profile---------------------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 500,
                    margin: const EdgeInsets.only(left: 40),
                    hoverDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFA62B),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF888787),
                        width: 1,
                      ),
                    ),
                    child: Stack(children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 30, left: 30),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "TestomonialClientsImages/T-Clients.jpg")),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 50, left: 140),
                          child: Text("Muhammad Asif",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700))),
                      const Padding(
                          padding: EdgeInsets.only(top: 70, left: 140),
                          child: Text("Contractors",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))),
                      const Padding(
                          padding: EdgeInsets.only(top: 90, left: 140),
                          child: Text("Work Experience: 10 year ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      const Padding(
                          padding: EdgeInsets.only(top: 110, left: 140),
                          child: Text("Islamabad, Pakistan",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      Padding(
                          padding: const EdgeInsets.only(top: 270, left: 0),
                          child: Center(
                            child: Container(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
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
                                                color: Colors.white,
                                                fontSize: 12),
                                          ))),
                                      Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Center(
                                              child: Text(
                                            "Contractor",
                                            style: TextStyle(
                                                color: Color(0xFFFFA62B),
                                                fontSize: 12),
                                          ))),
                                    ]),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF363B42)))),
                          )),
                    ]),
                  ),
                  //---------------------------------------4th Container--------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 500,
                    margin: const EdgeInsets.only(left: 40),
                    hoverDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFA62B),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF888787),
                        width: 1,
                      ),
                    ),
                    child: Stack(children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 30, left: 30),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "TestomonialClientsImages/T-Clients.jpg")),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 50, left: 140),
                          child: Text("Muhammad Asif",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700))),
                      const Padding(
                          padding: EdgeInsets.only(top: 70, left: 140),
                          child: Text("Contractors",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))),
                      const Padding(
                          padding: EdgeInsets.only(top: 90, left: 140),
                          child: Text("Work Experience: 10 year ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      const Padding(
                          padding: EdgeInsets.only(top: 110, left: 140),
                          child: Text("Islamabad, Pakistan",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                      Padding(
                          padding: const EdgeInsets.only(top: 270, left: 0),
                          child: Center(
                            child: Container(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
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
                                                color: Colors.white,
                                                fontSize: 12),
                                          ))),
                                      Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Center(
                                              child: Text(
                                            "Contractor",
                                            style: TextStyle(
                                                color: Color(0xFFFFA62B),
                                                fontSize: 12),
                                          ))),
                                    ]),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF363B42)))),
                          )),
                    ]),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class SearchContractors extends StatefulWidget {
  const SearchContractors({super.key});

  @override
  State<SearchContractors> createState() => _SearchContractors();
}

class _SearchContractors extends State<SearchContractors> {
  @override
  bool isOpenCity = false;
  String selectedOptionCity = "City";
  List<String> cityArrayList = [
    "Islamabad",
    'Rawalpindi',
    'Karachi',
    'Lahore',
  ];
  //---------------Roles----------------------------//
  bool isOpenRoles = false;
  String selectedOptionRoles = "Roles";
  List<String> rolesArrayList = [
    "All Roles",
    "Electrician",
    'Plumber',
    'Mechanical',
    'Carpenter',
    'Iron Worker',
    'Steel Worker',
  ];
  //----------------------------------------------//
  bool onChange = false;
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: getAllContractor(),
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 60, left: 120),
                        child: Container(
                            width: 350,
                            height: 35,
                            decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9),
                                border: Border.all(
                                  color: const Color(0xFFD9D9D9),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: const TextField(
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                label: Text(
                                    "Search Contractor"), //------------------correct this
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ))),
                    const Padding(
                        padding: EdgeInsets.only(top: 62, left: 370),
                        child: Center(
                            child: Text(
                          "Select location :",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ))),
                    //-------------------------------------City Drop Down------------------------------//

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          GestureDetector(
                              onTap: () {
                                isOpenCity = !isOpenCity;
                                setState(() {});
                              },
                              child: Container(
                                width: 150,
                                height: 35,
                                margin:
                                    const EdgeInsets.only(left: 30, top: 45),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black38, width: 1),
                                    borderRadius: BorderRadius.circular(0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(selectedOptionCity),
                                      Icon(
                                          isOpenCity
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down,
                                          color: Colors.black),
                                    ],
                                  ),
                                ),
                              )),
                          if (isOpenCity)
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black38, width: 1),
                                  borderRadius: BorderRadius.circular(0)),
                              margin: const EdgeInsets.only(left: 30),
                              child: ListView(
                                  primary: true,
                                  shrinkWrap: true,
                                  children: cityArrayList
                                      .map((e) => Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  isOpenCity = false;
                                                  selectedOptionCity = e;
                                                  setState(() {});
                                                },
                                                child: HoverContainer(
                                                    height: 35,
                                                    hoverDecoration:
                                                        BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xFFFFA62B),
                                                          width: 1),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
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
                    //------------------------------------------------City Drop Down Ends Here------------------------------------//
                    const Padding(
                        padding: EdgeInsets.only(top: 62, left: 30),
                        child: Center(
                            child: Text(
                          "Filter By :",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ))),
                    //-------------------------------------City Drop Down------------------------------//

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          GestureDetector(
                              onTap: () {
                                isOpenRoles = !isOpenRoles;
                                setState(() {});
                              },
                              child: Container(
                                width: 150,
                                height: 35,
                                margin:
                                    const EdgeInsets.only(left: 30, top: 45),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black38, width: 1),
                                    borderRadius: BorderRadius.circular(0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(selectedOptionRoles),
                                      Icon(
                                          isOpenRoles
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down,
                                          color: Colors.black),
                                    ],
                                  ),
                                ),
                              )),
                          if (isOpenRoles)
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black38, width: 1),
                                  borderRadius: BorderRadius.circular(0)),
                              margin: const EdgeInsets.only(left: 30),
                              child: ListView(
                                  primary: true,
                                  shrinkWrap: true,
                                  children: rolesArrayList
                                      .map((e) => Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  isOpenRoles = false;
                                                  selectedOptionRoles = e;
                                                  setState(() {});
                                                },
                                                child: HoverContainer(
                                                    height: 35,
                                                    hoverDecoration:
                                                        BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xFFFFA62B),
                                                          width: 1),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
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
                    //--------------------------------------------------Roles Drop Down End Here-----------------------//
                  ],
                ),
                //----------------getAllSUbContractors---------------------------//
              ],
            ),
          ],
        ));
  }
}
String? _experience;
class getAllContractor extends StatefulWidget {
  @override
  State<getAllContractor> createState() => _getAllContractorState();
}

class _getAllContractorState extends State<getAllContractor> {
  ApiService apiService = new ApiService();
  List<ProfessionalsProfileModel> _getProProfileData=[];
  List<ProWorkExperienceModel> _getProWorkExperience=[];
  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getProProfile().then((value){
      setState(() {
        _getProProfileData.addAll(value);
        for(int index=0;index<_getProProfileData.length;index++) {
          proId=_getProProfileData[index].id.toString();
          //  companyName=_getOwnerProfileData[index].companyName.toString();
          firstName=_getProProfileData[index].firstName.toString();
          lastName=_getProProfileData[index].lastName.toString();
          title=_getProProfileData[index].title.toString();
          city=_getProProfileData[index].city.toString();
          email=_getProProfileData[index].email.toString();
          // phoneNo=_getOwnerProfileData[index].phoneNo.toString();
          //  timeNowCreated=_getOwnerProfileData[index].timeNow.toString();
          country=_getProProfileData[index].country.toString();
          profilePhoto=_getProProfileData[index].uploadPhoto.toString();

          print("--------------------------------------------------------------");
          print("Id is :" + _getProProfileData[index].id.toString());
          // print("About is :" + ownerAbout.toString());
          print("First Name is :" + _getProProfileData[index].firstName.toString());
          print("Last Name is  :" + _getProProfileData[index].lastName.toString());
          print("Email is      :" + _getProProfileData[index].email.toString());
          print("Profession    :" + _getProProfileData[index].companyName.toString());
          print("Country       :" +_getProProfileData[index].country.toString());
          print("City          :" + _getProProfileData[index].city.toString());
          print("Street Address:" + _getProProfileData[index].streetAddress.toString());
          print("Phone no is   :" + _getProProfileData[index].phoneNo.toString());
          print("CNIC no is    :" + _getProProfileData[index].cnicNo.toString());
          print("Ntn  no is    :" + _getProProfileData[index].ntnNo.toString());
          print("Profile photo"+_getProProfileData[index].uploadPhoto.toString());
          //    print("Cover photo"+coverPhotoUrl.toString());
          print("--------------------------------------------------------------");


        }//set data we get
        //set data we get
      });
    });
    apiService.getProWorkExperience().then((value){
      setState(() {
        _getProWorkExperience.addAll(value);

        for(int i=0;i<_getProWorkExperience.length;i++){

        _getProWorkExperience[i].id.toString();
        _experience=_getProWorkExperience[i].experience.toString();


          print( _getProWorkExperience[i].experience.toString());




        }});
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(

          width:1600,
          margin: const EdgeInsets.only(top: 60),

          color: const Color(0xFFD9D9D9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 60, left: 110, bottom: 30),
                  child: Text(
                    "Contractors",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),


              //-----------------------------------Second Row Container------------------------//
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    //---------------------------------------------first profile--------------------------------//
                    Container(
                        width:1300,
                         height:MediaQuery.of(context).size.width,

                        margin: const EdgeInsets.only(left: 110),

                        child:GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 20,
                          ),
                          itemCount:_getProProfileData.length,
                          itemBuilder: (context, index) {

                            return HoverContainer(
                              width: 300,
                              height: 1000,
                              margin: const EdgeInsets.only(left: 0),
                              hoverDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFFFEBCC)//Color(0xFFFFA62B),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFF888787),
                                  width: 1,
                                ),
                              ),
                              child: Stack(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:30,left:30),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child:profilePhoto!=""? Image.network(
                                        _getProProfileData[index].uploadPhoto.toString(),
                                        height: 100.0,
                                        width: 100.0,
                                        scale: 2,
                                        fit: BoxFit.cover,
                                      ):Container(width:142,height: 142,decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          borderRadius: BorderRadius.circular((10),)),
                                      )
                                  ),
                                ),
                                Padding(
                               padding: EdgeInsets.only(top: 50, left: 140),
                               child: Text(_getProProfileData[index].firstName.toString()+" "+_getProProfileData[index].lastName.toString(),
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 14,
                                       fontWeight: FontWeight.w700))),
                         Padding(
                               padding: EdgeInsets.only(top: 70, left: 140),
                               child: Text(_getProProfileData[index].title.toString(),
                                   style: TextStyle(
                                       color: Colors.grey,
                                       fontSize: 12,
                                       fontWeight: FontWeight.w500))),
                    /*  Padding(
                               padding: EdgeInsets.only(top: 90, left: 140),
                               child:Text("Work Experience:  "+_experience.toString(),
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 12,
                                       fontWeight: FontWeight.w500))),*/

                         Padding(
                               padding: EdgeInsets.only(top: 85, left: 140),
                               child: Text(_getProProfileData[index].city.toString()+" , "+_getProProfileData[index].country.toString(),
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 13,
                                       fontWeight: FontWeight.w600))),
                            GestureDetector(
                            onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProViewProfile(_getProProfileData[index].email.toString())),
                            );
                            },
                            child:Padding(
                                    padding: EdgeInsets.only(top: 105, left: 140),
                                    child: Text("View my profile",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700)))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 160, left: 0),
                                    child: Center(
                                      child: Container(
                                          width: 150,
                                          height: 40,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
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
                                                              color: Colors.white,
                                                              fontSize: 12),
                                                        ))),
                                                Padding(
                                                    padding: EdgeInsets.only(left: 5),
                                                    child: Center(
                                                        child: Text(
                                                          "Contractor",
                                                          style: TextStyle(
                                                              color: Color(0xFFFFA62B),
                                                              fontSize: 12),
                                                        ))),
                                              ]),
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(5.0),
                                                  ),
                                                  backgroundColor:
                                                  const Color(0xFF363B42)))),
                                    )),
                              ]),
                            );
                          },
                        )
                    ),


                    //-----------------------------2nd Profile-----------------------------------//


                    //-----------------------------------end of mechinical------------------------//
                  ],
                ),
              ),
            ],
          ),
        ),
      ],);


  }
}
