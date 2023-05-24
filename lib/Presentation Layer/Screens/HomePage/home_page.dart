// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../../BuisnessLogic Layer/Api.dart';
import '../../../models/ProWorkExperience.dart';
import '../../../models/ProfessionalsProfileModel.dart';
import '../../../models/ProjectPortfolioModel.dart';
import '../Owner/Owner_Desire_Building.dart';
import '../Professionals/ProCommonPages/Pro_View_Profile.dart';
import 'Blogs/Blog.dart';

import 'CostEsitmationCalculator/calculator.dart';
import 'HiringProfessionals/Architect.dart';
import 'HiringProfessionals/CivilEngineer.dart';
import 'HiringProfessionals/Contractors.dart';
import 'HiringProfessionals/SubContractors.dart';
import 'JoinOwnerPro.dart';
import 'MaterialRateList/MaterialRateList.dart';
import 'MaterialStores/MaterialStoresImages/MaterialStores.dart';
import 'SBProjectPortfolio/Projects.dart';
import 'footer.dart';
import 'header.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection:
                screenWidth < 1300 ? Axis.horizontal : Axis.vertical,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(children:  <Widget>[
                  Boxes(), //header
                  FirstContainer(),
                 // SecondContainer(),
                  ThirdContainer(),
                  FourthContainer(),
                  FivethContainer(),
                  ProjctPortFolioView(),
                  SevenContainer(),
                  EightContainer(),
                  NineContainer(),
                  Footer(),
                ]))));
  }
}

class FirstContainer extends StatelessWidget {
  const FirstContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: const <Widget>[
      HomePagePic(),
      Rectangle(),
      TextHeading(),
    ]);
  }
}

class SecondContainer extends StatefulWidget {
  const SecondContainer({super.key});

  @override
  State<SecondContainer> createState() => _SecondContainer();
}

class _SecondContainer extends State<SecondContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(

        //main container

        height: 500,
        color: const Color(0xFFF7F8FA),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Container(
                  //text container with button
                  color: const Color(0xFFF7F8FA),
                  width: 700,
                  height: 500,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 100, top: 100),
                    child: BuildDream(),
                  ),
                ),
                Padding(
                  //picture container
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                      width: 500,
                      height: 400,
                      color: const Color(0xFFF7F8FA),
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: BuildDreamPic(),
                      )),
                )
              ],
            )));
  }
}

class ThirdContainer extends StatefulWidget {
  const ThirdContainer({super.key});

  @override
  State<ThirdContainer> createState() => _ThirdContainer();
}

class _ThirdContainer extends State<ThirdContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //main
          height: 250,
          width: 1550,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("HomeImages/HP3Pic.jpg"),
                  opacity: 70,
                  fit: BoxFit.fitWidth)),
          child: Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: Text(
                    "Products that Simplify Work from Start to Close Out",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ))),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          children: <Widget>[
            /* GestureDetector(
              onTap: () {},
              //hoverColor: Color(0xFF3D424A),
              child: Container(
                  margin: EdgeInsets.only(left: 210), //first container
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFD9D9D9), width: 2)),
                  child: Column(children: <Widget>[
                    Stack(children: <Widget>[
                      Center(
                          child: Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFFffa62b),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      )),
                      Padding(
                          padding: EdgeInsets.only(top: 50, left: 0),
                          child: Center(
                              child: Image.asset(
                            "HomeImages/planing.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ))),
                      Padding(
                          padding: EdgeInsets.only(top: 140, left: 0),
                          child: Center(
                            child: Text("Planning",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF888787),
                                )),
                          ))
                    ])
                  ])),
            ),*/
            SizedBox(
              width: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CostEstimationCalculator()));
              },
              //hoverColor: Color(0xFF3D424A),
              child: Container(
                  margin: EdgeInsets.only(left: 430),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFD9D9D9), width: 2)),
                  child: Column(children: <Widget>[
                    Stack(children: <Widget>[
                      Center(
                          child: Container(
                        //2nd
                        margin: EdgeInsets.only(top: 30, left: 0),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFFffa62b),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      )),
                      Padding(
                          padding: EdgeInsets.only(top: 50, left: 0),
                          child: Center(
                              child: Image.asset(
                            "HomeImages/CostEstimation.png",
                            width: 50,
                            height: 50,
                          ))),
                      Padding(
                          padding: EdgeInsets.only(top: 140, left: 0),
                          child: Center(
                            child: Text("Cost Estimation",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF888787),
                                )),
                          ))
                    ])
                  ])),
            ),
            SizedBox(
              width: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaterialStores()));
              },
              //hoverColor: Color(0xFF3D424A),
              child: Container(
                  margin: EdgeInsets.only(left: 30), //2nd
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFD9D9D9), width: 2)),
                  child: Column(children: <Widget>[
                    Stack(children: <Widget>[
                      Center(
                          child: Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFFffa62b),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      )),
                      Padding(
                          padding: EdgeInsets.only(top: 50, left: 0),
                          child: Center(
                              child: Image.asset(
                            "HomeImages/MaterialSourcing.png",
                            width: 50,
                            height: 50,
                          ))),
                      Padding(
                          padding: EdgeInsets.only(top: 140, left: 0),
                          child: Center(
                            child: Text("Material Stores Near By",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF888787),
                                )),
                          ))
                    ])
                  ])),
            ),
            SizedBox(
              width: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaterialRateList()));
              },
              //hoverColor: Color(0xFF3D424A),
              child: Container(
                  margin: EdgeInsets.only(left: 30), //2nd
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFD9D9D9), width: 2)),
                  child: Column(children: <Widget>[
                    Stack(children: <Widget>[
                      Center(
                          child: Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFFffa62b),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      )),
                      Padding(
                          padding: EdgeInsets.only(top: 50, left: 0),
                          child: Center(
                              child: Image.asset(
                            "HomeImages/MaterialSourcing.png",
                            width: 50,
                            height: 50,
                          ))),
                      Padding(
                          padding: EdgeInsets.only(top: 140, left: 0),
                          child: Center(
                            child: Text("Material Rate List",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF888787),
                                )),
                          ))
                    ])
                  ])),
            ),
            /*GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },

              //hoverColor: Color(0xFF3D424A),
              child: Container(
                  margin: EdgeInsets.only(left: 30), // 4th
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFD9D9D9), width: 2)),
                  child: Column(children: <Widget>[
                    Stack(children: <Widget>[
                      Center(
                          child: Container(
                        margin: EdgeInsets.only(top: 30, left: 0),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFFffa62b),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      )),
                      Padding(
                          padding: EdgeInsets.only(top: 50, left: 10),
                          child: Center(
                              child: Image.asset(
                            "HomeImages/ProjectTracking.png",
                            width: 50,
                            height: 50,
                          ))),
                      Padding(
                          padding: EdgeInsets.only(top: 140, left: 20),
                          child: Center(
                            child: Text("Project Tracking",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF888787),
                                )),
                          ))
                    ])
                  ])),
            ),*/
          ],
        ),
        SizedBox(
          height: 150,
        ),
      ],
    );
  }
}

class FourthContainer extends StatefulWidget {
  const FourthContainer({super.key});

  @override
  State<FourthContainer> createState() => _FourthContainer();
}

class _FourthContainer extends State<FourthContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 1550,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF888787),
                    BlendMode.modulate,
                  ),
                  image: AssetImage(
                    "HomeImages/ServiceProvider.jpeg",
                  ))),
          child: Stack(children: <Widget>[
            ClipPath(
                clipper: ParalleogramCliper(),
                child: Container(
                  height: 250,
                  width: 650,
                  color: Color(0xFFffa62b),
                )),
            Padding(
              padding: EdgeInsets.only(top: 70, left: 40),
              child: Text("YOU MAY HIRE US FOR CONSTRUCTION & RENOVATION",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 120, left: 40),
              child: Text("WE  ARE A GREAT SERVICES PROVIDER",
                  style: TextStyle(
                      color: const Color(0xFF343a40),
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            /* Padding(
                padding: const EdgeInsets.only(top: 90, left: 880),
                child: SizedBox(
                    width: 220,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () {},
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "BID WITH PROFESSIONALS",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFffa62b),
                        )))),*/
          ]),
        ),
        Padding(
            //
            padding: EdgeInsets.only(top: 50),
            child: Text("Hire service provider",
                style: TextStyle(
                    // color: const Color(0xFF343a40),
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600))),
        SizedBox(
          height: 50,
        ),
        Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 60, left: 180),
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("HomeImages/ServiceProvider1.jpg")))),
            Column(children: <Widget>[
              Container(
                  child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ContractorsMain()));
                },
                //hoverColor: Color(0xFF3D424A),
                child: Container(
                    margin:
                        EdgeInsets.only(left: 160, top: 50), //first container
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color(0xFF3D424A),
                    ),
                    child: Column(children: <Widget>[
                      Stack(children: <Widget>[
                        Center(
                            child: Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFFffa62b),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        )),
                        Padding(
                            padding: EdgeInsets.only(top: 40, left: 0),
                            child: Center(
                                child: Image.asset(
                              "HomeImages/Contractor.png",
                              width: 60,
                              height: 60,
                            ))),
                        Padding(
                            padding: EdgeInsets.only(top: 140, left: 0),
                            child: Center(
                              child: Text("Contractor",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  )),
                            ))
                      ])
                    ])),
              )),
              //----------------------------------Civil Engineer ----------------------------------
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CivilEngineersMain()));
                },
                //hoverColor: Color(0xFF3D424A),
                child: Container(
                    margin:
                        EdgeInsets.only(left: 160, top: 40), //first container
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color(0xFF888787),
                        border: Border.all(
                            color: const Color(0xFF888787), width: 2)),
                    child: Column(children: <Widget>[
                      Stack(children: <Widget>[
                        Center(
                            child: Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        )),
                        Padding(
                            padding: EdgeInsets.only(top: 40, left: 0),
                            child: Center(
                                child: Image.asset(
                              "HomeImages/CivilEngineer.png",
                              width: 60,
                              height: 60,
                            ))),
                        Padding(
                          padding: EdgeInsets.only(top: 140, left: 0),
                          child: Center(
                              child: Text("Civil Engineer",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ))),
                        )
                      ])
                    ])),
              ),
            ]),
            //------------------------------------------end column--------------------------------
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              //---------------------------------Sub Contractor-----------------------------------//
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SubContractorsMain()));
                },
                //hoverColor: Color(0xFF3D424A),
                child: Container(
                    margin:
                        EdgeInsets.only(left: 20, top: 50), //first container
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                            color: const Color(0xFFD9D9D9), width: 2)),
                    child: Column(children: <Widget>[
                      Stack(children: <Widget>[
                        Center(
                            child: Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFFffa62b),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        )),
                        Padding(
                            padding: EdgeInsets.only(top: 40, left: 0),
                            child: Center(
                                child: Image.asset(
                              "HomeImages/Sub-Contractor.png",
                              width: 60,
                              height: 60,
                            ))),
                        Padding(
                          padding: EdgeInsets.only(top: 140, left: 0),
                          child: Center(
                              child: Text("Sub-Contractor",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF888787),
                                  ))),
                        )
                      ])
                    ])),
              ),
              //--------------------------------------------Arcitect------------------------//
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ArchitectMain()));
                },
                //hoverColor: Color(0xFF3D424A),
                child: Container(
                    margin:
                        EdgeInsets.only(left: 20, top: 40), //first container
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color(0xFFffa62b),
                        border: Border.all(
                            color: const Color(0xFFD9D9D9), width: 2)),
                    child: Column(children: <Widget>[
                      Stack(children: <Widget>[
                        Center(
                            child: Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        )),
                        Padding(
                            padding: EdgeInsets.only(top: 40, left: 0),
                            child: Center(
                                child: Image.asset(
                              "HomeImages/Architect.png",
                              width: 60,
                              height: 60,
                            ))),
                        Padding(
                            padding: EdgeInsets.only(top: 140, left: 0),
                            child: Center(
                              child: Text("Architect",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF3D424A),
                                  )),
                            ))
                      ])
                    ])),
              ),
            ]),
          ],
        ),
      ],
    );
  }
}

class HomePagePic extends StatelessWidget {
  const HomePagePic({super.key});
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("HomeImages/HP1Pic.jpeg");
    Image image = Image(
        image: assetImage,
        color: const Color.fromRGBO(110, 110, 110, 0.8),
        fit: BoxFit.contain,
        colorBlendMode: BlendMode.modulate);
    return image;
  }
}

class ProductSimplifyPic extends StatelessWidget {
  const ProductSimplifyPic({super.key});
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("HomeImages/HP3Pic.jpg");
    Image image = Image(
        image: assetImage,
        colorBlendMode: BlendMode.modulate,
        fit: BoxFit.fitWidth);
    return image;
  }
}

class BuildDreamPic extends StatelessWidget {
  const BuildDreamPic({super.key});
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("HomeImages/BuildDream.jpeg");
    Image image = Image(
      image: assetImage,
      fit: BoxFit.contain,
      width: 200,
      height: 200,
    );
    return image;
  }
}

class Rectangle extends StatelessWidget {
  const Rectangle({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.only(top: 500),
          child: Container(
            alignment: Alignment.center,
            width: 500,
            height: 250,
            decoration: BoxDecoration(
                border: Border.all(
              width: 8,
              color: const Color.fromRGBO(250, 250, 250, 0.2),
            )),
          )),
    );
  }
}

class TextHeading extends StatelessWidget {
  const TextHeading({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 325, top: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 20), //2022
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 300, top: 0), //2022
                        child: Text(
                          "____",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                      "Since 2022",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "____",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const <Widget>[
                    Text("WE WILL BE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 58,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 6,
                        )),
                    SizedBox(width: 15),
                    Text("HAPPY",
                        style: TextStyle(
                          color: Color(0xFFffa62b),
                          fontSize: 58,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 6,
                        )),
                    SizedBox(width: 15),
                    Text("TO TAKE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 58,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 6)),
                  ],
                )),
            const Padding(
                padding: EdgeInsets.only(left: 100),
                child: Text("CARE OF YOUR WORK",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 58,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 6))),
            //Buttons and Contact Us and request a quote
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 20, left: 270),
                    child: SizedBox(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "CONTACT US",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFA62B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            )))),
                Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Container(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const DesireBuilding()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Center(
                                      child: Text(
                                    "Request A Quote",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ))),
                            ]),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                backgroundColor: const Color(0xFF363B42))))),
              ],
            ),
          ],
        ));
  }
}

class BuildDream extends StatefulWidget {
  const BuildDream({super.key});

  @override
  State<BuildDream> createState() => _BuildDreamState();
}

class _BuildDreamState extends State<BuildDream> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: 0, top: 0),
          child: Container(
            margin: EdgeInsets.only(left: 50, top: 0),
            //color: Color(0xFFF7F8FA),
            color: const Color(0xFFF7F8FA),
            height: 300,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Text("Build your dream home",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                        ))),
                const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Welcome to smart builder here you can manage ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                        ))),
                const Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text(
                        "the planing for construction project before the actual ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                        ))),
                Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Row(children: const <Widget>[
                      Text("construction  begins ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                          )),
                      Text("by hiring professionals ",
                          style: TextStyle(
                            color: Color(0xFFffa62b),
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                          )),
                    ])),
                Padding(
                    padding: const EdgeInsets.only(top: 30, right: 380),
                    child: SizedBox(
                        width: 120,
                        height: 38,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const JoinOwnerPro()));
                            },
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "Start now",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: const Color(0xFFffa62b),
                            )))),
              ],
            ),
          )),
      // ignore: sized_box_for_whitespace
    ]));
  }
}

class ParalleogramCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(550, 0); //change vertical direction of form first cordinate

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class FivethContainer extends StatefulWidget {
  const FivethContainer({super.key});

  @override
  State<FivethContainer> createState() => _FivethContainer();
}

class _FivethContainer extends State<FivethContainer> {
  @override
  Widget build(BuildContext context) {
    final projectCount = "3000";
    final happyClientCount = "300";
    final engineerCount = "200";
    final staffCount = "500";
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      margin: EdgeInsets.only(top: 100),
      width: screenWidth,
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("HomeImages/ConstructionHouse.jpg"),
          fit: BoxFit.fitWidth,
          opacity: 50,
          colorFilter: const ColorFilter.mode(
            Color(0xFF888787),
            BlendMode.modulate,
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 300, left: 0),
              child: Center(
                  child: Text("Consulting Success",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 36.0,
                      )))),
          Padding(
              padding: EdgeInsets.only(top: 200, left: 160),
              child: Row(children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    //hoverColor: Color(0xFF3D424A),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 50), //first container
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9900),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(children: <Widget>[
                            Stack(children: <Widget>[
                              Center(
                                  child: Container(
                                margin: EdgeInsets.only(top: 20, left: 0),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "HomeImages/CompleteProjects.png"),
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              )),
                              Padding(
                                padding: EdgeInsets.only(top: 55, left: 25),
                              ),
                              Center(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 120, left: 0),
                                child: Text(projectCount,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white.withOpacity(1),
                                      fontWeight: FontWeight.w500,
                                    )),
                              )),
                              Center(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 150, left: 0),
                                child: Text("Complete Projects",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ))
                            ])
                          ])),
                    )),
                SizedBox(width: 110),
                GestureDetector(
                    onTap: () {},
                    //hoverColor: Color(0xFF3D424A),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 50), //first container
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9900),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(children: <Widget>[
                            Stack(children: <Widget>[
                              Center(
                                  child: Container(
                                margin: EdgeInsets.only(top: 20, left: 0),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "HomeImages/HappyClient.png"),
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              )),
                              Padding(
                                padding: EdgeInsets.only(top: 55, left: 25),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 120, left: 0),
                                child: Center(
                                    child: Text(happyClientCount,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white.withOpacity(1),
                                          fontWeight: FontWeight.w500,
                                        ))),
                              ),
                              Center(
                                child: Padding(
                                    padding: EdgeInsets.only(top: 150, left: 0),
                                    child: Text("Happy Clients",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ))),
                              )
                            ])
                          ])),
                    )),
                SizedBox(width: 110),
                GestureDetector(
                    onTap: () {},
                    //hoverColor: Color(0xFF3D424A),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 50), //first container
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9900),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(children: <Widget>[
                            Stack(children: <Widget>[
                              Center(
                                  child: Container(
                                margin: EdgeInsets.only(top: 20, left: 30),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage("HomeImages/Engineers.png"),
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              )),
                              Padding(
                                padding: EdgeInsets.only(top: 55, left: 25),
                              ),
                              Center(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 120, left: 0),
                                child: Text(engineerCount,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white.withOpacity(1),
                                      fontWeight: FontWeight.w500,
                                    )),
                              )),
                              Center(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 150, left: 0),
                                      child: Center(
                                        child: Text("Engineer",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      )))
                            ])
                          ])),
                    )),
                SizedBox(width: 110),
                GestureDetector(
                    onTap: () {},
                    //hoverColor: Color(0xFF3D424A),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 50), //first container
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9900),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(children: <Widget>[
                            Stack(children: <Widget>[
                              Center(
                                  child: Container(
                                margin: EdgeInsets.only(top: 20, left: 0),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("HomeImages/Staff.png"),
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              )),
                              Padding(
                                padding: EdgeInsets.only(top: 55, left: 25),
                              ),
                              Center(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 120, left: 0),
                                child: Text(staffCount,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white.withOpacity(1),
                                      fontWeight: FontWeight.w500,
                                    )),
                              )),
                              Center(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 150, left: 0),
                                child: Text("Staff",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ))
                            ])
                          ])),
                    )),
              ]))
        ],
      ),
    );
  }
}
String? profilePhoto;
class ProjctPortFolioView extends StatefulWidget {
  @override
  State<ProjctPortFolioView> createState() => _ProjctPortFolioView();
}

class _ProjctPortFolioView extends State<ProjctPortFolioView> {
  ApiService apiService = new ApiService();
  List<ProjectPortfolioModel> _getProProfileData=[];

  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getProjectPortfolio().then((value){
      setState(() {
        _getProProfileData.addAll(value);

        //set data we get
      });
    });



    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(


          width:MediaQuery.of(context).size.width,


          margin: const EdgeInsets.only(top: 60),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Padding(
                    padding: EdgeInsets.only(top: 60, left: 0, bottom: 0),
                    child: Text(
                      "Project",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    )),
              ),
              Center(
                child: const Padding(
                    padding: EdgeInsets.only(top: 10, left: 0, bottom: 30),
                    child: Text(
                      "Portfolio",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )),
              ),


              //-----------------------------------Second Row Container------------------------//
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(

                    height:500,

                    margin: const EdgeInsets.only(left: 90,right:90),

                    child:GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 20,

                      ),
                      itemCount:_getProProfileData.length,
                      itemBuilder: (context, index) {

                        return GestureDetector(

                          onTap: (){
                        Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => ProjectPortfolio()));

                          },
                          child: HoverContainer(
                            width: 250,

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
                            child: Image.network( _getProProfileData[index].housePhoto.toString()),
                          ),
                        );
                      },
                    )
                ),
              ),
            ],
          ),
        ),
      ],);


  }
}

class SevenContainer extends StatefulWidget {
  const SevenContainer({super.key});

  @override
  State<SevenContainer> createState() => _SevenContainer();
}

class _SevenContainer extends State<SevenContainer> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth,
        child: Column(children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text("Testimonial",
                style: TextStyle(
                    color: Color(0xFFFF9900),
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
          Center(
              child: Text("Happy Clients",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600))),
          SizedBox(
            height: 50,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 180,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFF3D424A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Junior Lecturer",
                        style: TextStyle(
                            color: Color(0xFFFF9900),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 130, left: 10),
                    child: Text(
                        "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. ",
                        maxLines: 5,
                        style: TextStyle(
                            color: Color(0xFFFF9900),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
              ]),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFF3D424A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Junior Lecturer",
                        style: TextStyle(
                            color: Color(0xFFFF9900),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 130, left: 10),
                    child: Text(
                        "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. ",
                        maxLines: 5,
                        style: TextStyle(
                            color: Color(0xFFFF9900),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
              ]),
            ),
            SizedBox(
              width: 60,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFF3D424A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Junior Lecturer",
                        style: TextStyle(
                            color: Color(0xFFFF9900),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 130, left: 10),
                    child: Text(
                        "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. ",
                        maxLines: 5,
                        style: TextStyle(
                            color: Color(0xFFFF9900),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
              ]),
            ),
            SizedBox(width: 60),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFF3D424A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF888787),
                  width: 1,
                ),
              ),
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "TestomonialClientsImages/T-Clients.jpg")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 110),
                    child: Text("Muhammad Asif",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700))),
                Padding(
                    padding: EdgeInsets.only(top: 60, left: 110),
                    child: Text("Junior Lecturer",
                        style: TextStyle(
                            color: Color(0xFFFF9900),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: EdgeInsets.only(top: 130, left: 10),
                    child: Text(
                        "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. ",
                        maxLines: 5,
                        style: TextStyle(
                            color: Color(0xFFFF9900),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
              ]),
            ),
          ]),
        ]));
  }
}

class EightContainer extends StatefulWidget {
  const EightContainer({super.key});

  @override
  State<EightContainer> createState() => _EightContainer();
}

class _EightContainer extends State<EightContainer> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth,
        child: Column(children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text("Our Blogs",
                style: TextStyle(
                    color: Color(0xFFFF9900),
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
          Center(
              child: Text("Recent Blogs",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600))),
          SizedBox(
            height: 50,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 180,
            ),
            GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Blogs()));
                }),
                child: Container(
                  width: 250,
                  height: 450,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFF3D424A),
                      )),
                  child: Column(children: <Widget>[
                    Container(
                        height: 210,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("RecentBlogImages/1.jpg")),
                        )),
                    SizedBox(height: 20),
                    Row(children: <Widget>[
                      SizedBox(width: 20),
                      Image.asset("RecentBlogImages/admin.png",
                          width: 10, height: 10),
                      SizedBox(width: 5),
                      Text(
                        "Admin",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("RecentBlogImages/comments.png",
                          width: 10, height: 10),
                      SizedBox(width: 5),
                      Text(
                        "Comments",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "Biggest Construction in Islamabad ,Pakistan",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF888787),
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  ]),
                )),
            SizedBox(
              width: 60,
            ),
            GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Blogs()));
                }),
                child: Container(
                  width: 250,
                  height: 450,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFF3D424A),
                      )),
                  child: Column(children: <Widget>[
                    Container(
                        height: 210,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("RecentBlogImages/1.jpg")),
                        )),
                    SizedBox(height: 20),
                    Row(children: <Widget>[
                      SizedBox(width: 20),
                      Image.asset("RecentBlogImages/admin.png",
                          width: 10, height: 10),
                      SizedBox(width: 5),
                      Text(
                        "Admin",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("RecentBlogImages/comments.png",
                          width: 10, height: 10),
                      SizedBox(width: 5),
                      Text(
                        "Comments",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "Biggest Construction in Islamabad ,Pakistan",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF888787),
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  ]),
                )),
            SizedBox(
              width: 60,
            ),
            GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Blogs()));
                }),
                child: Container(
                  width: 250,
                  height: 450,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFF3D424A),
                      )),
                  child: Column(children: <Widget>[
                    Container(
                        height: 210,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("RecentBlogImages/1.jpg")),
                        )),
                    SizedBox(height: 20),
                    Row(children: <Widget>[
                      SizedBox(width: 20),
                      Image.asset("RecentBlogImages/admin.png",
                          width: 10, height: 10),
                      SizedBox(width: 5),
                      Text(
                        "Admin",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("RecentBlogImages/comments.png",
                          width: 10, height: 10),
                      SizedBox(width: 5),
                      Text(
                        "Comments",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "Biggest Construction in Islamabad ,Pakistan",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF888787),
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  ]),
                )),
            SizedBox(
              width: 60,
            ),
            GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Blogs()));
                }),
                child: Container(
                  width: 250,
                  height: 450,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFF3D424A),
                      )),
                  child: Column(children: <Widget>[
                    Container(
                        height: 210,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("RecentBlogImages/1.jpg")),
                        )),
                    SizedBox(height: 20),
                    Row(children: <Widget>[
                      SizedBox(width: 20),
                      Image.asset("RecentBlogImages/admin.png",
                          width: 10, height: 10),
                      SizedBox(width: 5),
                      Text(
                        "Admin",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("RecentBlogImages/comments.png",
                          width: 10, height: 10),
                      SizedBox(width: 5),
                      Text(
                        "Comments",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "Biggest Construction in Islamabad ,Pakistan",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF888787),
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  ]),
                )),
            SizedBox(
              width: 60,
            ),
          ]),
        ]));
  }
}

class NineContainer extends StatefulWidget {
  const NineContainer({super.key});

  @override
  State<NineContainer> createState() => _NineContainer();
}

class _NineContainer extends State<NineContainer> {
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Construction Services';

    // List of items in our dropdown menu
    var items = [
      'Construction Services',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(top: 50),
        width: screenWidth,
        height: 800,
        decoration: BoxDecoration(
            image: DecorationImage(
          opacity: 120,
          fit: BoxFit.cover,
          image: AssetImage("DropMessageImages/1.jpg"),
        )),
        child: Row(
          //form start
          children: <Widget>[
            SizedBox(width: 100),
            Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 80, left: 80),
                    width: 500,
                    height: 600,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 280, top: 50),
                            child: Text(
                              "Drop A MESSAGE",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFFFF9900),
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(right: 265, top: 10),
                            child: Text(
                              "REQUEST A QUOTE",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Row(
                          children: const <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 30, top: 30, bottom: 10),
                                child: Text(
                                  "YOUR FULL NAME",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 115, top: 30, bottom: 10),
                                child: Text(
                                  "EMAIL ADDRESS",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                                width: 220,
                                height: 38,
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: "Name",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                width: 220,
                                height: 38,
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: "Email Address",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                right: 360, top: 30, bottom: 10),
                            child: Text(
                              "SELECT TEXT",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(right: 0),
                            width: 450,
                            height: 38,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black38, width: 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: <BoxShadow>[]),
                            child: Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: DropdownButtonFormField(
                                  value: dropdownvalue,

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ))),
                        Padding(
                            padding: EdgeInsets.only(
                                right: 370, top: 30, bottom: 10),
                            child: Text(
                              "MESSAGE",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Container(
                          width: 450,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, right: 300),
                            child: SizedBox(
                                width: 150,
                                height: 38,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    // ignore: sort_child_properties_last
                                    child: const Text(
                                      "Send Message",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFffa62b),
                                        shadowColor: Colors.grey,
                                        elevation: 5)))),
                      ], //form end
                    )),
              ],
            ),
            Column(children: const <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 50, top: 160),
                  child: Text(
                    "Frequently Ask Question",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFFFF9900),
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 90, top: 10),
                  child: Text(
                    '''
                       Something from us ?
                       You Want to ask
                       ''',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 50, top: 0),
                  child: Text(
                    '''
                    A small  river named Duden flows by their 
                    place and supplies it with the necessary
                    regelialia A small  river named Duden flows
                    by their place and supplies it with the
                    necessary regelialia..
                     ''',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF3D424A),
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ]),
          ],
        ));
  }
}
