import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';
import '../../WorkExperience.dart';
import 'Pro_Add_Education.dart';
import 'Pro_Profile_Ready.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
Widget EditButton() {
  return GestureDetector(
      onTap: () {},
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("PreviewProfilePic/edit.png")))));
}

class ProfessionalsPreviewProfile extends StatefulWidget {
  const ProfessionalsPreviewProfile({super.key});

  @override
  State<ProfessionalsPreviewProfile> createState() => _ProfessionalsPreviewProfile();
}

class _ProfessionalsPreviewProfile extends State<ProfessionalsPreviewProfile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Boxes(),
                    ProfessionalsPreviewProfileInterface(),
                    Footer()
                  ],
                ))));
  }
}

class ProfessionalsPreviewProfileInterface extends StatefulWidget {
  const ProfessionalsPreviewProfileInterface({super.key});

  @override
  State<ProfessionalsPreviewProfileInterface> createState() => _ProfessionalsPreviewProfileInterface();
}

class _ProfessionalsPreviewProfileInterface extends State<ProfessionalsPreviewProfileInterface> {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: 900,
        height: 1550,
        margin: const EdgeInsets.only(top: 80, bottom: 80),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: strokeColor)), // all the boxes are here like skill
        child: Column(children: <Widget>[
          SubmitProfile(),
          Profile(),
          Skill(),
          WorkExperience(),
          EducationHistory(),
          Padding(
              padding: const EdgeInsets.only(top: 60, left: 600),
              child: Container(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NiceWork()));
                      },
                      // ignore: sort_child_properties_last
                      child: Row(children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Submit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                  color: Color(0xFFFF9900), fontSize: 12),
                            )),
                      ]),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          backgroundColor: const Color(0xFF363B42))))),
        ]));
  }
}

class Skill extends StatefulWidget {
  const Skill({super.key});

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50, right: 250),
        width: 550,
        height: 200,
        decoration:
            BoxDecoration(border: Border.all(color: const Color(0xFF999999))),
        child: Column(children: <Widget>[
          Container(
            height: 60,
            width: 800,
            decoration: const BoxDecoration(
              color: lightGrey,
              border: Border(
                bottom: BorderSide(width: 1.0, color: strokeColor),
              ),
            ),
            child: Row(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, bottom: 0),
                    child: Text(
                      "Skill",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SkillShowDialog();
                          });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 20, left: 400),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: strokeColor, width: 1),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 3, left: 3, right: 3, top: 3),
                            child: Image.asset(
                              "PreviewProfilePic/edit.png",
                              width: 15,
                              height: 15,
                            )))),
              ],
            ),
          )
        ]));
  }
}

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperience();
}

class _WorkExperience extends State<WorkExperience> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50, right: 250),
        width: 550,
        height: 200,
        decoration:
            BoxDecoration(border: Border.all(color: const Color(0xFF999999))),
        child: Column(children: <Widget>[
          Container(
            height: 60,
            width: 800,
            decoration: const BoxDecoration(
              color: lightGrey,
              border: Border(
                bottom: BorderSide(width: 1.0, color: strokeColor),
              ),
            ),
            child: Row(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, bottom: 0),
                    child: Text(
                      "Work Experience",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return showAddExperinceAlertDialog(); //---------calling the class here
                          });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 20, left: 320),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: strokeColor, width: 1),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 3, left: 3, right: 3, top: 3),
                            child: Image.asset(
                              "PreviewProfilePic/edit.png",
                              width: 15,
                              height: 15,
                            )))),
              ],
            ),
          )
        ]));
  }
}

class EducationHistory extends StatefulWidget {
  const EducationHistory({super.key});

  @override
  State<EducationHistory> createState() => _EducationHistory();
}

class _EducationHistory extends State<EducationHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50, right: 250),
        width: 550,
        height: 200,
        decoration:
            BoxDecoration(border: Border.all(color: const Color(0xFF999999))),
        child: Column(children: <Widget>[
          Container(
            height: 60,
            width: 800,
            decoration: const BoxDecoration(
              color: lightGrey,
              border: Border(
                bottom: BorderSide(width: 1.0, color: strokeColor),
              ),
            ),
            child: Row(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, bottom: 0),
                    child: Text(
                      "Education History",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddEducationAlertDialog();
                          });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 20, left: 330),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: strokeColor, width: 1),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 3, left: 3, right: 3, top: 3),
                            child: Image.asset(
                              "PreviewProfilePic/edit.png",
                              width: 15,
                              height: 15,
                            )))),
              ],
            ),
          )
        ]));
  }
}

class SubmitProfile extends StatefulWidget {
  const SubmitProfile({super.key});

  @override
  State<SubmitProfile> createState() => _SubmitProfileState();
}

class _SubmitProfileState extends State<SubmitProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 50),
          width: 800,
          height: 270,
          decoration:
              BoxDecoration(border: Border.all(color: const Color(0xFF999999))),
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                width: 800,
                decoration: const BoxDecoration(
                  color: lightGrey,
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: strokeColor),
                  ),
                ),
                child: const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, bottom: 0),
                    child: Text(
                      "Preview Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
              Row(
                children: <Widget>[getWelcome(), getWelcomeImage()],
              ),
            ],
          )),
    );
  }

  Widget getWelcome() {
    return Container(
        child: Column(
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.only(top: 20, right: 270, bottom: 0),
            child: Text(
              "Looking good, Muhammad!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )),
        const Padding(
            padding: EdgeInsets.only(top: 40, left: 40, bottom: 0),
            child: Text(
              "Make any edits you want, then submit your profile. You can make more changes when its live",
              style: TextStyle(
                color: TextlightGrey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )),
        //button
        Padding(
            padding: const EdgeInsets.only(top: 40, right: 350),
            child: Container(
                width: 130,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NiceWork()));
                    },
                    // ignore: sort_child_properties_last
                    child: Row(children: const <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Profile",
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
    ));
  }

  Widget getWelcomeImage() {
    return Container(
      margin: EdgeInsets.only(left: 50, top: 10),
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("PreviewProfilePic/Welcome.png"))),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      getProfileData(),
      getLocationLanguage(),
    ]);
  }

  Widget getProfileData() {
    return Container(
        width: 550,
        height: 300,
        margin: const EdgeInsets.only(top: 30, left: 50),
        decoration: BoxDecoration(border: Border.all(color: strokeColor)),
        child: Expanded(
            child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.only(top: 0, left: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")))),
              Container(
                  height: 120,
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: 90, bottom: 0),
                          child: Text(
                            "Muhammad Abdullah Gul",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 18,
                              height: 18,
                              margin: const EdgeInsets.only(top: 5, right: 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: const DecorationImage(
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          "PreviewProfilePic/placeholder.png")))),
                          const Padding(
                              padding: EdgeInsets.only(right: 205, top: 5),
                              child: Text("Lahore, PB",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600))),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(right: 170, top: 5),
                          child: Text("9:17 Pm Local Time",
                              style: TextStyle(
                                  color: TextlightGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))),

                      //about
                    ],
                  )),
            ]),
            //column
            Container(
                width: 120,
                height: 30,
                margin: EdgeInsets.only(right: 340, top: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: strokeColor, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ShowDialog();
                              });
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 0, left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 3, left: 3, right: 3, top: 3),
                                child: Image.asset(
                                  "PreviewProfilePic/edit.png",
                                  width: 15,
                                  height: 15,
                                )))),
                    const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text("Edit Profile",
                            style: TextStyle(
                                color: TextlightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600))),
                  ],
                )),
            Row(children: [
              const Padding(
                  padding: EdgeInsets.only(left: 50, top: 20, right: 80),
                  child: Text("Contractor",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600))),
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ContractorShowDialog();
                        });
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: strokeColor, width: 1),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 3, left: 3, right: 3, top: 3),
                          child: Image.asset(
                            "PreviewProfilePic/edit.png",
                            width: 15,
                            height: 15,
                          )))),
            ]),
            //about
            Row(children: [
              const Padding(
                  padding: EdgeInsets.only(right: 20, top: 5, left: 50),
                  child: Text("About",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700))),
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return OverViewDialog();
                        });
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: strokeColor, width: 1),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 3, left: 3, right: 3, top: 3),
                          child: Image.asset(
                            "PreviewProfilePic/edit.png",
                            width: 15,
                            height: 15,
                          )))),
            ]),
          ],
        )));
  }

  Widget getLocationLanguage() {
    return Container(
        margin: const EdgeInsets.only(left: 0, bottom: 70),
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 0.5,
              color: strokeColor,
              margin: const EdgeInsets.only(left: 30, bottom: 20),
            ),
            const Padding(
                padding: EdgeInsets.only(right: 100, bottom: 0),
                child: Text(
                  "Location",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
            const Padding(
                padding: EdgeInsets.only(right: 102, top: 10),
                child: Text(
                  "Lahore, PB",
                  style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
            const Padding(
                padding: EdgeInsets.only(right: 115, bottom: 30),
                child: Text(
                  "Pakistan",
                  style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
            Container(
              width: 200,
              height: 0.5,
              color: strokeColor,
              margin: const EdgeInsets.only(left: 30),
            ),
            const Padding(
                padding: EdgeInsets.only(right: 90, top: 20),
                child: Text(
                  "Language",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
            const Padding(
                padding: EdgeInsets.only(right: 130, top: 10),
                child: Text(
                  "Urdu",
                  style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
            const Padding(
                padding: EdgeInsets.only(right: 85),
                child: Text(
                  "English Basic ",
                  style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ));
  }
}

class ContractorShowDialog extends StatefulWidget {
  const ContractorShowDialog({super.key});

  @override
  State<ContractorShowDialog> createState() => _ContractorShowDialog();
}

class _ContractorShowDialog extends State<ContractorShowDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
          width: 700,
          height: 800,
          child: AddTitleServiceProviderInterface(),
        ));
  }
}

class SkillShowDialog extends StatefulWidget {
  const SkillShowDialog({super.key});

  @override
  State<SkillShowDialog> createState() => _SkillShowDialog();
}

class _SkillShowDialog extends State<SkillShowDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
          width: 700,
          height: 800,
          child: AddYourSkill(),
        ));
  }
}

class ShowDialog extends StatefulWidget {
  const ShowDialog({super.key});

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
            width: 650,
            height: 800,
            child: Column(children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 20, right: 440, bottom: 0),
                  child: Text(
                    "Edit Photo Cover",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              //place image edit
              Container(
                  width: 500,
                  height: 250,
                  margin: const EdgeInsets.only(top: 60, left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: strokeColor,
                      width: 1,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        offset: Offset(2.0, 4.0),
                        blurRadius: 6.0,
                        //blurStyle: BlurStyle.outer
                      ),
                    ],
                  )),
              //column
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 460),
                  child: Container(
                      width: 140,
                      height: 38,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DesireBuilding()));
                          },
                          // ignore: sort_child_properties_last
                          child: Row(children: const <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Center(
                                    child: Text(
                                  "Select Image",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ))),
                          ]),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Color(0xFFFFA62B))))),
              const Padding(
                  padding: EdgeInsets.only(top: 20, right: 460, bottom: 0),
                  child: Text(
                    "Your Photo Should",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 40, bottom: 0),
                  child: Column(children: [
                    Row(
                      children: <Widget>[
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const Padding(
                            padding:
                                EdgeInsets.only(left: 5, right: 0, bottom: 0),
                            child: Text(
                              "Be a close-up of your face",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const Padding(
                            padding:
                                EdgeInsets.only(left: 5, right: 0, bottom: 0),
                            child: Text(
                              "Show your face clearly-no sunglasses!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const Padding(
                            padding:
                                EdgeInsets.only(left: 5, right: 0, bottom: 0),
                            child: Text(
                              "Be clear and crisp",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const Padding(
                            padding:
                                EdgeInsets.only(left: 5, right: 0, bottom: 0),
                            child: Text(
                              "Have a neutral background",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                  ])),
              Padding(
                  padding: const EdgeInsets.only(top: 60, left: 10),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 320),
                          child: SizedBox(
                              width: 140,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  // ignore: sort_child_properties_last
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  )))),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 0),
                          child: Container(
                              width: 140,
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
                                        padding: EdgeInsets.only(left: 40),
                                        child: Center(
                                            child: Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ))),
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
            ])));
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
        margin: const EdgeInsets.only(top: 0, bottom: 0),
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
                    padding: const EdgeInsets.only(top: 170, left: 40),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
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
                    padding: const EdgeInsets.only(top: 170, left: 340),
                    child: Container(
                        width: 140,
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
                                  padding: EdgeInsets.only(left: 30),
                                  child: Center(
                                      child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
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

class AddYourSkill extends StatefulWidget {
  const AddYourSkill({super.key});

  @override
  State<AddYourSkill> createState() => _AddYourSkill();
}

class _AddYourSkill extends State<AddYourSkill> {
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
        margin: const EdgeInsets.only(top: 0, bottom: 0),
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
                    "Tell us What work are you here to do?",
                    style: TextStyle(
                      color: Color(0xFF3D424A),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Center(
                  child: Text(
                    '''
Your skills show clients what you can offer, and help us  choose which jobs
to recommend  to you. So, Start typing  to pick more, its up to you.    ''',
                    style: TextStyle(
                      color: Color(0xFF3D424A),
                      fontSize: 16,
                    ),
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, left: 50, bottom: 10),
                child: Text(
                  "Your Skill",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 0, left: 50),
                child: SizedBox(
                    width: 540,
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
                    padding: const EdgeInsets.only(top: 370, left: 40),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
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
                    padding: const EdgeInsets.only(top: 370, left: 340),
                    child: Container(
                        width: 140,
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
                                  padding: EdgeInsets.only(left: 30),
                                  child: Center(
                                      child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
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

class OverViewDialog extends StatefulWidget {
  const OverViewDialog({super.key});

  @override
  State<OverViewDialog> createState() => _OverViewDialog();
}

class _OverViewDialog extends State<OverViewDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
            width: 650,
            height: 600,
            child: Column(children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 20, right: 540, bottom: 0),
                  child: Text(
                    "Overview",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              //place image edit

              //column
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 0, bottom: 0),
                  child: Text(
                    "Use this space to show clients you have the skills and experience they're looking for.",
                    style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )),

              Container(
                  margin: EdgeInsets.only(top: 10, left: 40, bottom: 0),
                  child: Column(children: [
                    Row(
                      children: <Widget>[
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const Padding(
                            padding:
                                EdgeInsets.only(left: 5, right: 0, bottom: 0),
                            child: Text(
                              "Describe your strengths and skills",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 0, bottom: 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 0, bottom: 0),
                                child: Text(
                                  "Highlight projects, accomplishments and education",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 0, bottom: 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 0, bottom: 0),
                                child: Text(
                                  "Keep it short and make sure it's error-free",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20, right: 550, bottom: 0),
                        child: Text(
                          "About",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    //place image edit
                    Container(
                        height: 200,
                        width: 600,
                        decoration: BoxDecoration(
                            border: Border.all(color: strokeColor, width: 1)),
                        margin:
                            EdgeInsets.only(top: 20, right: 100, bottom: 10),
                        child: ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: <Widget>[
                              new TextField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ])),
                  ])),
              Padding(
                  padding: const EdgeInsets.only(top: 60, left: 10),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 320),
                          child: SizedBox(
                              width: 140,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  // ignore: sort_child_properties_last
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFD9D9D9),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  )))),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 0),
                          child: Container(
                              width: 140,
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
                                        padding: EdgeInsets.only(left: 40),
                                        child: Center(
                                            child: Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ))),
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
            ])));
  }
}
