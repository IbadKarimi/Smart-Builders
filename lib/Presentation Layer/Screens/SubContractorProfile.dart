import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import 'HomePage/footer.dart';
import 'HomePage/header.dart';
import 'Owner/Owner_Desire_Building.dart';

class SubContractorProfile extends StatefulWidget {
  const SubContractorProfile({super.key});

  @override
  State<SubContractorProfile> createState() => _SubContractorProfile();
}

class _SubContractorProfile extends State<SubContractorProfile> {
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
                    SubContractorProfileInterface(),
                    Footer(),
                  ],
                ))));
  }
}

class SubContractorProfileInterface extends StatefulWidget {
  const SubContractorProfileInterface({super.key});

  @override
  State<SubContractorProfileInterface> createState() =>
      _SubContractorProfileInterface();
}

class _SubContractorProfileInterface
    extends State<SubContractorProfileInterface> {
  var dropdownvalue;
  @override
  Widget build(BuildContext context) {
    String Country = 'Country';

    // List of items in our dropdown menu
    var countryItems = [
      'Country',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    const checkbox = false;
    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 40),
        width: 900,
        height: 1000,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "A few last details, then you can check and publish your profile ",
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 80),
                child: Text(
                  '''
                  A professional photo helps you to build trust with your clients. To keep things safe   
                  and simple, they ‘ll pay  you through us- which is why we need your persona.
                  ''',
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 14,
                  ),
                )),
            Row(
              children: <Widget>[
                Container(
                    height: 600,
                    margin: EdgeInsets.only(left: 50, bottom: 100),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 0, bottom: 0),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: const Color(0xFF3D424A),
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage("Logo/Avatar.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10, right: 0),
                            child: Container(
                                width: 120,
                                height: 26,
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
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Text(
                                            "+",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 2),
                                          child: Text(
                                            "Upload Photo",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                    ]),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        backgroundColor: Color(0xFFFFA62B))))),
                        Container(
                          width: 80,
                          height: 80,
                          margin: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                              color: const Color(0xFF3D424A),
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage("Logo/Avatar.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10, left: 0),
                            child: Container(
                                width: 150,
                                height: 26,
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
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Text(
                                            "+",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Text(
                                            "Upload CNIC Photo",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                    ]),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        backgroundColor: Color(0xFFFFA62B))))),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 100, bottom: 400),
                  height: 300,
                  width: 1,
                  color: Colors.grey,
                ),
                //fields container firstname/lastname
                Container(
                    height: 700,
                    margin: EdgeInsets.only(left: 20, bottom: 00),
                    child: Column(
                      children: <Widget>[
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 0, right: 440, bottom: 10),
                            child: Text(
                              "First Name",
                              style: TextStyle(
                                color: Color(0xFF3D424A),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //last name
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 20, right: 440, bottom: 10),
                            child: Text(
                              "Last Name",
                              style: TextStyle(
                                color: Color(0xFF3D424A),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 20, right: 450, bottom: 10),
                            child: Text(
                              "Country",
                              style: TextStyle(
                                color: Color(0xFF3D424A),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Container(
                            width: 250,
                            height: 32,
                            margin: const EdgeInsets.only(left: 0, right: 260),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black38, width: 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: <BoxShadow>[]),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                              value: Country,
                              items: countryItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Pakistan",
                                      style: TextStyle(
                                          color: Color(0xFF3D424A),
                                          fontSize: 12),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  Country = newValue!;
                                });
                              },
                              isExpanded: true,
                            ))),
                        //city and Zip cpde
                        Container(
                            width: 450,
                            height: 100,
                            margin: EdgeInsets.only(right: 60),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, left: 0, bottom: 10),
                                    child: Column(
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 20,
                                                right: 150,
                                                bottom: 10),
                                            child: Text(
                                              "City",
                                              style: TextStyle(
                                                color: Color(0xFF3D424A),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 0, right: 0),
                                            child: SizedBox(
                                                width: 180,
                                                height: 32,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  )),
                                                ))),
                                      ],
                                    )),
                                SizedBox(
                                  width: 30,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, left: 0, bottom: 10),
                                    child: Column(
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 80, bottom: 10),
                                            child: Text(
                                              "ZIP/Postal Code",
                                              style: TextStyle(
                                                color: Color(0xFF3D424A),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(right: 0),
                                            width: 180,
                                            height: 32,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              )),
                                            )),
                                      ],
                                    )),
                              ],
                            )),
                        //Street Address
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 0, right: 420, bottom: 10),
                            child: Text(
                              "Street Address",
                              style: TextStyle(
                                color: Color(0xFF3D424A),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 0, right: 110),
                            child: SizedBox(
                                width: 400,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //Phone no
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 20, right: 440, bottom: 10),
                            child: Text(
                              "Phone No",
                              style: TextStyle(
                                color: Color(0xFF3D424A),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //Cnic
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 20, right: 410, bottom: 10),
                            child: Text(
                              "Enter CNIC NO",
                              style: TextStyle(
                                color: Color(0xFF3D424A),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //ntn no
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 20, right: 410, bottom: 10),
                            child: Text(
                              "Enter NTN NO",
                              style: TextStyle(
                                color: Color(0xFF3D424A),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //checkBox
                        Padding(
                            padding: const EdgeInsets.only(top: 10, right: 160),
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
                                  'if you’re a tax payer enter your NTN number,if not click the check box  ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                      ],
                    )),
                //end of the fields
              ],
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(),
              child: Container(
                  margin: const EdgeInsets.only(bottom: 0, left: 40),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(bottom: 0, left: 40),
                          child: SizedBox(
                              width: 140,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
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
                          padding: const EdgeInsets.only(bottom: 0, left: 390),
                          child: Container(
                              width: 220,
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
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: Text(
                                          "Check Your,",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Profile",
                                          style: TextStyle(
                                              color: Color(0xFFFF9900),
                                              fontSize: 12),
                                        )),
                                  ]),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      backgroundColor:
                                          const Color(0xFF363B42))))),
                    ],
                  )),
            )
          ],
        ));
  }
}
