import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';
import 'Pro_Add_Title.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: ScreenWidth,
              color: Colors.white,
              child: Column(children: const <Widget>[
                Boxes(),
                SignUpInterface(),
                Footer(),
              ]),
            )));
  }
}

class SignUpInterface extends StatefulWidget {
  const SignUpInterface({super.key});

  @override
  State<SignUpInterface> createState() => _SignUpInterface();
}

class _SignUpInterface extends State<SignUpInterface> {
  //------------------------------------------------//

  bool isOpenCountry = false;
  String selectedOptionCountry = "Pakistan";
  List<String> optionsCountry = ["Pakistan", 'China', 'Srilanka', 'India'];

  //------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    String country = "Pakistan";
    const checkbox = false;
    var countryItems = [
      'Pakistan',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 120),
        width: 700,
        height: 680,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "Sign up to find work you Do ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            //place google button here
            Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Container(
                    width: 570,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Color(0xFF3D424A), width: 1)),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DesireBuilding()));
                        },
                        // ignore: sort_child_properties_last
                        child: Row(children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                  image: AssetImage("GoogleLogo/Google.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(left: 130),
                              child: Text(
                                "Continue with Google",
                                style: TextStyle(
                                    color: Color(0xFF3D424A), fontSize: 14),
                              )),
                        ]),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: Colors.white)))),
            //line or
            const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "_____________________________________or______________________________________",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )),
            //Row
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 100),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 0, right: 0),
                        child: SizedBox(
                            width: 240,
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                  label: const Text("First Name",
                                      style: TextStyle(fontSize: 14)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 0, right: 0),
                        child: SizedBox(
                            width: 250,
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                  label: const Text("Last Name",
                                      style: TextStyle(fontSize: 14)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                            ))),
                  ],
                )),
            //Entrer work email address
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: SizedBox(
                    width: 510,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text("Work Email Address",
                              style: TextStyle(fontSize: 14)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ))),
            //Password
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: SizedBox(
                    width: 510,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                          label:
                              Text("Password", style: TextStyle(fontSize: 14)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ))),
            //drop down

            Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 60, left: 100),
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
                          'Send me emails with tips on how to find professional that fits my needs ',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                //checkbox 2
                Padding(
                    padding: const EdgeInsets.only(top: 80, left: 100),
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
                        const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              '''
Yes, I understand and agree to the Smart Builders Terms of Service,including
the User Agreement and Privacy Policy
                              ''',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            )),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 160, left: 70),
                    child: Container(
                        width: 570,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddTitle()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: <Widget>[
                              const Padding(
                                  padding: EdgeInsets.only(left: 190),
                                  child: Text(
                                    "Create my Account",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xFFFF9900))))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          isOpenCountry = !isOpenCountry;
                          setState(() {});
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: 510,
                            height: 35,
                            margin: const EdgeInsets.only(
                                left: 100, top: 10, right: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black38, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedOptionCountry),
                                  Icon(
                                      isOpenCountry
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        )),
                    if (isOpenCountry)
                      Container(
                        width: 510,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black38, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        margin: const EdgeInsets.only(left: 100),
                        child: ListView(
                            scrollDirection: Axis.vertical,
                            primary: true,
                            shrinkWrap: true,
                            children: optionsCountry //--------------------list
                                .map((e) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            isOpenCountry = false;
                                            selectedOptionCountry = e;
                                            setState(() {});
                                          },
                                          child: HoverContainer(
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
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
              ],
            ),
            //Check Box

            //Buuton Create

            Padding(
                padding: const EdgeInsets.only(top: 20, left: 260),
                child: Row(
                  children: <Widget>[
                    const Text(
                      "Already have an Account ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Text("Login ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFffa62b),
                              fontSize: 14,
                            ))),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 240),
                child: Row(
                  children: <Widget>[
                    const Text(
                      "here to hire professionals ?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Text("join as owner ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFffa62b),
                              fontSize: 14,
                            ))),
                  ],
                )),
          ],
        ));
  }
}
