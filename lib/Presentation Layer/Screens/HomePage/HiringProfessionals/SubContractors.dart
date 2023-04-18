import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../Owner/Owner_Desire_Building.dart';
import '../../Owner/Owner_Proposala_Service_Providers.dart';
import '../footer.dart';
import '../header.dart';


class SubContractorsMain extends StatefulWidget {
  const SubContractorsMain({super.key});

  @override
  State<SubContractorsMain> createState() => _SubContractorsMain();
}

class _SubContractorsMain extends State<SubContractorsMain> {
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
                  SubContractors(),
                  TopRatedSubContractors(),
                  SearchSubContractors(),
                  Footer(),
                ],
              ),
            )));
  }
}

class SubContractors extends StatefulWidget {
  const SubContractors({super.key});

  @override
  State<SubContractors> createState() => _SubContractors();
}

class _SubContractors extends State<SubContractors> {
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
                              "Subcontractors",
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
Hiring the right subcontractors, and having an effective and 
efficient stable of subcontractors to have on your side, can be the
difference between a successful project with a healthy profit
margin.''',
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
                            "HiringWorkersImages/HiringSubContractors.jpg"),
                        fit: BoxFit.cover)),
              ),
            )
          ],
        )
      ],
    );
  }
}

class TopRatedSubContractors extends StatefulWidget {
  const TopRatedSubContractors({super.key});

  @override
  State<TopRatedSubContractors> createState() => _TopRatedSubContractors();
}

class _TopRatedSubContractors extends State<TopRatedSubContractors> {
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
                "Subcontractors",
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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

class SearchSubContractors extends StatefulWidget {
  const SearchSubContractors({super.key});

  @override
  State<SearchSubContractors> createState() => _SearchSubContractors();
}

class _SearchSubContractors extends State<SearchSubContractors> {
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
              child: getAllSubContractor(),
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
                                    "Search Subcontractor"), //------------------correct this
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

class getAllSubContractor extends StatefulWidget {
  @override
  State<getAllSubContractor> createState() => _getAllSubContractorState();
}

class _getAllSubContractorState extends State<getAllSubContractor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1600,
          margin: const EdgeInsets.only(top: 60),
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFFD9D9D9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 60, left: 110, bottom: 30),
                  child: Text(
                    "Electrician",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
              Row(
                children: [
                  //---------------------------------------------first profile--------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                          padding: const EdgeInsets.only(top: 160, left: 0),
                          child: Center(
                            child: Container(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                    onPressed: () {
                                   /*   Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                              const ProposalServiceProvider()));*/
                                    },
                                    // ignore: sort_child_properties_last
                                    child: Row(children: const <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                  //-----------------------------2nd Profile-----------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                  //-------------------------------------------3rd Profile------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                  //----------------------------------------------------4th profilre------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
              ),
              //----------------------------------------------Plumber--------------------------------------//
              const Padding(
                  padding: EdgeInsets.only(top: 60, left: 110, bottom: 30),
                  child: Text(
                    "Plumber",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
              Row(
                children: [
                  //---------------------------------------------first profile--------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                  //-----------------------------2nd Profile-----------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                  //-------------------------------------------3rd Profile------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                  //----------------------------------------------------4th profilre------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
              ),
              //------------------------------------------Mechinincal-------------------------//
              const Padding(
                  padding: EdgeInsets.only(top: 60, left: 110, bottom: 30),
                  child: Text(
                    "Mechanical",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
              Row(
                children: [
                  //---------------------------------------------first profile--------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                  //-----------------------------2nd Profile-----------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                  //-------------------------------------------3rd Profile------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
                  //----------------------------------------------------4th profilre------------------------------//
                  HoverContainer(
                    width: 300,
                    height: 300,
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
                          child: Text("Electrician",
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
                                          padding: EdgeInsets.only(left: 10),
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
                                            "Subcontractor",
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
              )
              //-----------------------------------end of mechinical------------------------//
            ],
          ),
        )
      ],
    );
  }
}
