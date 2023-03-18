// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import 'Pro_Add_Education.dart';
import 'Pro_Add_Skill.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguage();
}

class _SelectLanguage extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: const <Widget>[
                    Boxes(),
                    SelectLanguageInterface(),
                    Footer(),
                  ],
                ))));
  }
}

class SelectLanguageInterface extends StatefulWidget {
  const SelectLanguageInterface({super.key});

  @override
  State<SelectLanguageInterface> createState() => _SelectLanguageInterface();
}

class _SelectLanguageInterface extends State<SelectLanguageInterface> {
  @override
  Widget build(BuildContext context) {
    int? _value = 1;
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
                padding: EdgeInsets.only(top: 40, right: 00),
                child: Center(
                    child: Text(
                  "Tell us which language you speak",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ))),
            const Padding(
                padding: EdgeInsets.only(top: 40, left: 50),
                child: Text(
                  '''
               Client are often interested to know which language you speak 
                  ''',
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 16,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 0, left: 105),
                child: Row(children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  Text("English"),
                  SizedBox(
                    width: 10,
                  )
                ])),
            Padding(
                padding: EdgeInsets.only(top: 0, left: 105),
                child: Row(children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  Text("Urdu"),
                ])),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 300, left: 50),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddEducations()));
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
                    padding: const EdgeInsets.only(top: 300, left: 250),
                    child: Container(
                        width: 220,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddSkill()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Center(
                                      child: Text(
                                    "Next,",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Add your skill",
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
