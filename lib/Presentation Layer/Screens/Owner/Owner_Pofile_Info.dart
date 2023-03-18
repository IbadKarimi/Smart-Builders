import 'package:flutter/material.dart';

import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import '../Professionals/ProCommonPages/Pro_Profile_Ready.dart';
import 'Owner_Desire_Building.dart';
import 'Owner_Manage_Accepted_Offer.dart';
import 'Owner_Manage_Applied_Contracts.dart';
import 'Owner_Mange_Offers.dart';
import 'Owner_Select_Title_ServiceProvider.dart';
import 'Owner_Submitted_Proposals.dart';


const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
Widget EditButton() {
  return GestureDetector(
      onTap: () {},
      child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("PreviewProfilePic/edit.png")))));
}

class OwnerViewProfile extends StatefulWidget {
  const OwnerViewProfile({super.key});

  @override
  State<OwnerViewProfile> createState() => _OwnerViewProfile();
}

class _OwnerViewProfile extends State<OwnerViewProfile> {
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
                    OwnerCoverProfile(),
                    OwnerAddProposal(),
                    OwnerOffers(),
                    OwnerTrackContract(),
                    Footer()
                  ],
                ))));
  }
}

class OwnerViewProfileInterface extends StatefulWidget {
  const OwnerViewProfileInterface({super.key});

  @override
  State<OwnerViewProfileInterface> createState() =>
      _OwnerViewProfileInterface();
}

class _OwnerViewProfileInterface extends State<OwnerViewProfileInterface> {
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
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

class OwnerCoverProfile extends StatefulWidget {
  const OwnerCoverProfile({super.key});

  @override
  State<OwnerCoverProfile> createState() => _OwnerCoverProfile();
}

class _OwnerCoverProfile extends State<OwnerCoverProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 900,
        height: 450,
        margin: const EdgeInsets.only(top: 50, bottom: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: strokeColor)), // all the boxes are here like skill
        child: Stack(children: <Widget>[
          Container(
              width: 900,
              height: 200,
              margin: const EdgeInsets.only(top: 0, left: 0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("HomeImages/ConstructionHouse.jpg")))),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ShowDialog();
                    });
              },
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 860),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
          Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 140, left: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "TestomonialClientsImages/T-Clients.jpg")))),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ShowProfileDialog();
                    });
              },
              child: Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.only(top: 200, left: 140),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: strokeColor,
                        width: 0.3,
                      ),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("Logo/plus.png"))))),
          Container(
              height: 200,
              width: 350,
              margin: EdgeInsets.only(left: 0, top: 230, right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(left: 50, top: 20, right: 80),
                      child: Text("Ibad Karimi",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700))),
                  const Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Text("Owner",
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),
                  const Padding(
                      padding: EdgeInsets.only(
                        left: 50,
                        top: 10,
                      ),
                      child: Text("Smart Builders PVT LTD",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400))),
                  const Padding(
                      padding: EdgeInsets.only(top: 0, left: 50),
                      child: Text("Lahore ,Punjab ,Pakistan",
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),
                  Row(children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                        child: Text(
                          "About",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const OverViewDialog();
                              });
                        },
                        child: Container(
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: strokeColor, width: 1),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Image.asset(
                                  "PreviewProfilePic/edit.png",
                                  width: 10,
                                  height: 10,
                                )))),
                  ])
                ],
              )),
          const Padding(
              padding: EdgeInsets.only(top: 385, left: 50, bottom: 0),
              child: Text(
                "To build something requires vision and the willingness to adapt to what is already there.",
                style: TextStyle(
                  color: TextlightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ]));
  }
}

class OwnerAddProposal extends StatefulWidget {
  const OwnerAddProposal({super.key});

  @override
  State<OwnerAddProposal> createState() => _OwnerAddProposal();
}

class _OwnerAddProposal extends State<OwnerAddProposal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 370,
      margin: const EdgeInsets.only(top: 50, bottom: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: strokeColor)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        const Padding(
            padding: EdgeInsets.only(left: 50, top: 20),
            child: Text(
              "Proposals",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 60,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddTitleServiceProvider()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text(
                              "Submit Proposals",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "(0)",
                              style: TextStyle(
                                  color: Color(0xFFFF9900), fontSize: 16),
                            )),
                      ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OwnerSubmittedProposals()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Center(
                              child: Text(
                                "Submitted Proposals",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "(1)",
                              style: TextStyle(
                                  color: Color(0xFFFF9900), fontSize: 16),
                            )),
                      ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
      ]),
    );
  }
}

class OwnerOffers extends StatefulWidget {
  const OwnerOffers({super.key});

  @override
  State<OwnerOffers> createState() => _OwnerOffers();
}

class _OwnerOffers extends State<OwnerOffers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 400,
      margin: const EdgeInsets.only(top: 50, bottom: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: strokeColor)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(left: 50, top: 20),
                child: Text(
                  "Manage Offers",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )),
            Center(
              child: Container(
                  margin: const EdgeInsets.only(
                    top: 60,
                  ),
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OwnerManageOffers()));
                      },
                      // ignore: sort_child_properties_last
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "Offers",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "(1)",
                                  style: TextStyle(
                                      color: Color(0xFFFF9900), fontSize: 14),
                                )),
                          ]),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF363B42)))),
            ),
            Center(
              child: Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                  ),
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const OwnerManageAcceptedOffers()));
                      },
                      // ignore: sort_child_properties_last
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  "Accepter Offers",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "(0)",
                                  style: TextStyle(
                                      color: Color(0xFFFF9900), fontSize: 14),
                                )),
                          ]),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF363B42)))),
            ),
          ]),
    );
  }
}

class OwnerTrackContract extends StatefulWidget {
  const OwnerTrackContract({super.key});

  @override
  State<OwnerTrackContract> createState() => _OwnerTrackContract();
}

class _OwnerTrackContract extends State<OwnerTrackContract> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 470,
      margin: const EdgeInsets.only(top: 50, bottom: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: strokeColor)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        const Padding(
            padding: EdgeInsets.only(left: 50, top: 20),
            child: Text(
              "Track Contract",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 60,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DesireBuilding()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          "Contract in Progress",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "(0)",
                          style:
                              TextStyle(color: Color(0xFFFF9900), fontSize: 14),
                        )),
                  ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const OwnerManageAppliedContract()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Text(
                          "Contract Applied",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "(0)",
                          style:
                              TextStyle(color: Color(0xFFFF9900), fontSize: 14),
                        )),
                  ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DesireBuilding()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          "Contract Completed",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "(0)",
                          style:
                              TextStyle(color: Color(0xFFFF9900), fontSize: 14),
                        )),
                  ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
      ]),
    );
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

class ShowProfileDialog extends StatefulWidget {
  const ShowProfileDialog({super.key});

  @override
  State<ShowProfileDialog> createState() => _ShowProfileDialog();
}

class _ShowProfileDialog extends State<ShowProfileDialog> {
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
                    "Edit Profile Photo",
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

class PortFolioDialog extends StatefulWidget {
  const PortFolioDialog({super.key});

  @override
  State<PortFolioDialog> createState() => _PortFolioDialog();
}

class _PortFolioDialog extends State<PortFolioDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
            width: 650,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, bottom: 0),
                  child: Text(
                    "Add Portfolio",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
                  child: Text(
                    "Project Title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                    top: 0,
                    left: 10,
                  ),
                  child: SizedBox(
                      width: 250,
                      height: 32,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                      ))),
              const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Text(
                    "Project Description",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Container(
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: strokeColor, width: 1)),
                  margin: EdgeInsets.only(top: 0, left: 10, bottom: 10),
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        new TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ])),

              //column
              Container(
                  margin: const EdgeInsets.only(
                    top: 0,
                    left: 10,
                  ),
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFF363B42),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(children: <Widget>[
                    Center(
                        child: Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(top: 0, right: 0),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("logo/Plus.png"),
                                  fit: BoxFit.contain),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 140, left: 20),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                child: Text(
                                  "Drag and Drop",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                child: Text(
                                  "or Browser File",
                                  style: TextStyle(
                                    color: Color(0xFFFFA62B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ))
                  ])),

              Container(
                  margin: EdgeInsets.only(top: 20, left: 10, bottom: 0),
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
                              "Images (.jpg, .gif, .png, up to 10 MB, no more than 4000 px in any dimension",
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
                                  "Document (.pdf, up to 10 MB)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        )),

                    //place image edit
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
