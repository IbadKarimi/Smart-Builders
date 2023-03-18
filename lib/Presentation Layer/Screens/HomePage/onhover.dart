import 'package:flutter/material.dart';

import 'Blogs/Blog.dart';
import 'CostEstimationCalculator.dart';
import 'HiringProfessionals/Architect.dart';
import 'HiringProfessionals/CivilEngineer.dart';
import 'HiringProfessionals/Contractors.dart';
import 'HiringProfessionals/SubContractors.dart';
import 'MaterialRateList/MaterialRateList.dart';
import 'MaterialStores/MaterialStoresImages/MaterialStores.dart';
import 'SBProjectPortfolio/Projects.dart';
import 'home_page.dart';

class HoverText extends StatefulWidget {
  const HoverText({super.key});

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool isHover = false;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: ((event) => setState(() {
            isHover = true;
          })),
      onExit: ((event) => setState(() {
            isHover = false;
          })),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                child: const Text("Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ),
              const SizedBox(
                width: 45,
              ),
              const Text("About",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
              const SizedBox(
                width: 45,
              ),

              //----------------------------------------------------------------Services------------------------//
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                            padding: const EdgeInsets.only(
                                left: 0, bottom: 200, right: 00),
                            child: AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0.0))),
                                content: Container(
                                    width: 400,
                                    height: 300,
                                    child: Row(
                                      //---------Row------------//
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text(
                                                    "Services Providers",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFFA62B),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const ContractorsMain()));
                                                  },
                                                  child: const Text(
                                                      "Contractor",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const SubContractorsMain()));
                                                  },
                                                  child: const Text(
                                                      "Subcontractor",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const CivilEngineersMain()));
                                                  },
                                                  child: const Text(
                                                      "Civil Engineers",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const ArchitectMain()));
                                                  },
                                                  child: const Text("Architect",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text(
                                                    "Project Tracking",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFFA62B),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 10),
                                                child: const Text(
                                                    "Payment & Milesstones",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),

                                              // ----------------------My Profile----------------------//
                                            ]),
                                        //--------------------------------------Second Column-------------------//
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: const Text(
                                                      "MATERIAL SOURCING",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFA62B),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, left: 10),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const MaterialRateList()));
                                                    },
                                                    child: const Text(
                                                        "Material Rate List",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, left: 10),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const MaterialStores()));
                                                    },
                                                    child: const Text(
                                                        "Material Stores Near By",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ),
                                                ),

                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: const Text(
                                                      "PRE-CONSTRUCTION",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFFFA62B),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, left: 10),
                                                  child: const Text(
                                                      "Project Planning",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const CostEstimationCalculator()));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              left: 10),
                                                      child: const Text(
                                                          "Cost Estimation Calculator",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, left: 10),
                                                  child: const Text(
                                                      "Biding & Contract",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),

                                                // ----------------------My Profile----------------------//
                                              ]),
                                        ),
                                        //-------------------------------------Second Column---------------------//
                                      ],
                                    ))));
                      });
                },
                //ennd of gesture detector--------------------------------------------------------
                child: const Text("Services",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ),
              //------------------------------------------------------------------//
              const SizedBox(
                width: 45,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProjectPortfolio()));
                  },
                  child: const Text("Projects",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ))),
              const SizedBox(
                width: 45,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Blogs()));
                  },
                  child: const Text("Blogs",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ))),
              const SizedBox(
                width: 45,
              ),
              const Text("Contact",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showPopUpMenu(Offset globalPosition) async {
    double left = globalPosition.dx;
    double top = globalPosition.dy;
    await showMenu(
      color: Colors.white,
      //add your color
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem(
          value: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 40),
            child: Row(
              children: [
                Icon(Icons.mail_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Menu 1",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 40),
            child: Row(
              children: [
                Icon(Icons.vpn_key),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Menu 2",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              Icon(Icons.power_settings_new_sharp),
              SizedBox(
                width: 10,
              ),
              Text(
                "Menu 3",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      print(value);
      if (value == 1) {
        //do your task here for menu 1
      }
      if (value == 2) {
        //do your task here for menu 2
      }
      if (value == 3) {
        //do your task here for menu 3
      }
    });
  }
}

class Services extends StatefulWidget {
  @override
  _Services createState() => _Services();
}

class _Services extends State<Services> {
  GlobalKey menuKey = GlobalKey();

  showMenus(BuildContext context) async {
    final render = menuKey.currentContext!.findRenderObject() as RenderBox;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          render.localToGlobal(Offset.zero).dx,
          render.localToGlobal(Offset.zero).dy + 35,
          double.infinity,
          double.infinity),
      items: [
        PopupMenuItem(
            value: 1,
            child: Row(
              children: [
                Container(
                  width: 300,
                  height: 300,
                )
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: menuKey,
      constraints: BoxConstraints(
        minWidth: 30,
        minHeight: 20,
      ),
      child: MouseRegion(
        onHover: (event) => Container(
          width: 300,
          height: 300,
        ),
        child: Text('Services',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            )),
      ),
    );
  }
}
