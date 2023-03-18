import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../footer.dart';
import '../header.dart';
import '../home_page.dart';

class ProjectPortfolio extends StatefulWidget {
  const ProjectPortfolio({super.key});

  @override
  State<ProjectPortfolio> createState() => _ProjectPortfolio();
}

class _ProjectPortfolio extends State<ProjectPortfolio> {
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
                  ProjectPortfolioFirstPage(),
                  ProjectPortFolioSecondPage(),
                  CustomSlider(),
                  Footer(),
                ],
              ),
            )));
  }
}

class ProjectPortfolioFirstPage extends StatefulWidget {
  @override
  State<ProjectPortfolioFirstPage> createState() =>
      _ProjectPortfolioFirstPageState();
}

class _ProjectPortfolioFirstPageState extends State<ProjectPortfolioFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 650,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "lib/Presentation Layer/Screens/HomePage/SBProjectPortfolio/ProjectPortfolioImages/PP1.jpg"),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 260, left: 700),
          child: Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                      child: GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          }),
                          child: Text(
                            "Home",
                            style: TextStyle(
                              color: Color(0xFFFFA62B),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                      child: Text(
                        ">",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                      child: GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ProjectPortfolio()));
                          }),
                          child: Text(
                            "Projects",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                      child: Text(
                        ">",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        //--------------------------------------//

        Padding(
            padding: EdgeInsets.only(top: 260, left: 640, bottom: 0),
            child: Text(
              "Projects",
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w600,
              ),
            )),
        //--------------------------------------------//

        //---------------Row dual color text------------------//,
        Padding(
          padding: const EdgeInsets.only(top: 340, left: 550),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 30, left: 0, bottom: 0),
                  child: Text(
                    "“Stay on schedule and on budget when you ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 0, bottom: 0),
                      child: Text(
                        "connect everyone and everything on",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                      child: Text(
                        "Smart",
                        style: TextStyle(
                          color: Color(0xFFFFA62B),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 0, left: 0, bottom: 0),
                  child: Text(
                    "Builder's Construction Management Platform.”",
                    style: TextStyle(
                      color: Color(0xFFFFA62B),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectPortFolioSecondPage extends StatefulWidget {
  @override
  State<ProjectPortFolioSecondPage> createState() =>
      _ProjectPortFolioSecondPageState();
}

class _ProjectPortFolioSecondPageState
    extends State<ProjectPortFolioSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 40, left: 5, bottom: 0),
              child: Text(
                "Portfolio",
                style: TextStyle(
                  color: Color(0xFFFFA62B),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 65, bottom: 0),
              child: Text(
                "Projects Successfully Completed on Our Platform",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              )),
          //----------------------Grey Box------------------------//
          Container(
            margin: EdgeInsets.only(top: 60),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFD9D9D9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  //---------------- first Project Portfolio starts--------------//
                  HoverContainer(
                    width: 400,
                    height: 650,
                    margin: const EdgeInsets.only(left: 140, top: 80),
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
                    child: Column(
                      children: [
                        Stack(children: <Widget>[
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))),
                          const Padding(
                              padding: EdgeInsets.only(top: 75, left: 140),
                              child: Text("Owner",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))),
                          const Padding(
                              padding: EdgeInsets.only(top: 99, left: 140),
                              child: Text("Self Employe at ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))),
                          const Padding(
                              padding: EdgeInsets.only(top: 125, left: 140),
                              child: Text("Islamabad , Capital , Pakistan",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))),
                        ]),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 40, left: 5, bottom: 0),
                            child: Text(
                              "1 Canal Banglo Project ",
                              style: TextStyle(
                                color: Color(0xFFFFA62B),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 15, left: 0),
                            child: Text("F11, Street 8, Islamabad, Pakistan",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                        //------------------------------------------//
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 65, bottom: 0),
                                child: Text(
                                  "Construct By :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 5, bottom: 0),
                                child: Text(
                                  "Muhammad Abdullah Gul",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ],
                        ),
                        //------------------------Picture Box-----------------//
                        Container(
                          width: 250,
                          height: 200,
                          margin: EdgeInsets.only(top: 80),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("ProjectImages/8.jpg"),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //--------------------------------------------End Project Portfolio Profile--------------------------------//
                  //---------------- first Project Portfolio starts--------------//
                  HoverContainer(
                    width: 400,
                    height: 650,
                    margin: const EdgeInsets.only(left: 30, top: 80),
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
                    child: Column(
                      children: [
                        Stack(children: <Widget>[
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))),
                          const Padding(
                              padding: EdgeInsets.only(top: 75, left: 140),
                              child: Text("Owner",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))),
                          const Padding(
                              padding: EdgeInsets.only(top: 99, left: 140),
                              child: Text("Self Employe at ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))),
                          const Padding(
                              padding: EdgeInsets.only(top: 125, left: 140),
                              child: Text("Islamabad , Capital , Pakistan",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))),
                        ]),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 40, left: 5, bottom: 0),
                            child: Text(
                              "1 Canal Banglo Project ",
                              style: TextStyle(
                                color: Color(0xFFFFA62B),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 15, left: 0),
                            child: Text("F11, Street 8, Islamabad, Pakistan",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                        //------------------------------------------//
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 65, bottom: 0),
                                child: Text(
                                  "Construct By :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 5, bottom: 0),
                                child: Text(
                                  "Muhammad Abdullah Gul",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ],
                        ),
                        //------------------------Picture Box-----------------//
                        Container(
                          width: 250,
                          height: 200,
                          margin: EdgeInsets.only(top: 80),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("ProjectImages/8.jpg"),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //--------------------------------------------End Project Portfolio Profile--------------------------------//
                  //---------------- first Project Portfolio starts--------------//
                  HoverContainer(
                    width: 400,
                    height: 650,
                    margin: const EdgeInsets.only(left: 30, top: 80),
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
                    child: Column(
                      children: [
                        Stack(children: <Widget>[
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))),
                          const Padding(
                              padding: EdgeInsets.only(top: 75, left: 140),
                              child: Text("Owner",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))),
                          const Padding(
                              padding: EdgeInsets.only(top: 99, left: 140),
                              child: Text("Self Employe at ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))),
                          const Padding(
                              padding: EdgeInsets.only(top: 125, left: 140),
                              child: Text("Islamabad , Capital , Pakistan",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))),
                        ]),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 40, left: 5, bottom: 0),
                            child: Text(
                              "1 Canal Banglo Project ",
                              style: TextStyle(
                                color: Color(0xFFFFA62B),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 15, left: 0),
                            child: Text("F11, Street 8, Islamabad, Pakistan",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                        //------------------------------------------//
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 65, bottom: 0),
                                child: Text(
                                  "Construct By :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 5, bottom: 0),
                                child: Text(
                                  "Muhammad Abdullah Gul",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ],
                        ),
                        //------------------------Picture Box-----------------//
                        Container(
                          width: 250,
                          height: 200,
                          margin: EdgeInsets.only(top: 80),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("ProjectImages/8.jpg"),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //--------------------------------------------End Project Portfolio Profile--------------------------------//
                ]),
                //-----------------Second Row----------------------------//
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //---------------- first Project Portfolio starts--------------//
                        HoverContainer(
                          width: 400,
                          height: 650,
                          margin: const EdgeInsets.only(left: 140, top: 80),
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
                          child: Column(
                            children: [
                              Stack(children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 30, left: 30),
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
                                    padding:
                                        EdgeInsets.only(top: 50, left: 140),
                                    child: Text("Muhammad Asif",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 75, left: 140),
                                    child: Text("Owner",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 99, left: 140),
                                    child: Text("Self Employe at ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 125, left: 140),
                                    child: Text(
                                        "Islamabad , Capital , Pakistan",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))),
                              ]),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 40, left: 5, bottom: 0),
                                  child: Text(
                                    "1 Canal Banglo Project ",
                                    style: TextStyle(
                                      color: Color(0xFFFFA62B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                              const Padding(
                                  padding: EdgeInsets.only(top: 15, left: 0),
                                  child: Text(
                                      "F11, Street 8, Islamabad, Pakistan",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400))),
                              //------------------------------------------//
                              Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 65, bottom: 0),
                                      child: Text(
                                        "Construct By :",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 5, bottom: 0),
                                      child: Text(
                                        "Muhammad Abdullah Gul",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                              //------------------------Picture Box-----------------//
                              Container(
                                width: 250,
                                height: 200,
                                margin: EdgeInsets.only(top: 80),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("ProjectImages/8.jpg"),
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //--------------------------------------------End Project Portfolio Profile--------------------------------//
                        //---------------- first Project Portfolio starts--------------//
                        HoverContainer(
                          width: 400,
                          height: 650,
                          margin: const EdgeInsets.only(left: 30, top: 80),
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
                          child: Column(
                            children: [
                              Stack(children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 30, left: 30),
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
                                    padding:
                                        EdgeInsets.only(top: 50, left: 140),
                                    child: Text("Muhammad Asif",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 75, left: 140),
                                    child: Text("Owner",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 99, left: 140),
                                    child: Text("Self Employe at ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 125, left: 140),
                                    child: Text(
                                        "Islamabad , Capital , Pakistan",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))),
                              ]),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 40, left: 5, bottom: 0),
                                  child: Text(
                                    "1 Canal Banglo Project ",
                                    style: TextStyle(
                                      color: Color(0xFFFFA62B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                              const Padding(
                                  padding: EdgeInsets.only(top: 15, left: 0),
                                  child: Text(
                                      "F11, Street 8, Islamabad, Pakistan",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400))),
                              //------------------------------------------//
                              Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 65, bottom: 0),
                                      child: Text(
                                        "Construct By :",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 5, bottom: 0),
                                      child: Text(
                                        "Muhammad Abdullah Gul",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                              //------------------------Picture Box-----------------//
                              Container(
                                width: 250,
                                height: 200,
                                margin: EdgeInsets.only(top: 80),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("ProjectImages/8.jpg"),
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //--------------------------------------------End Project Portfolio Profile--------------------------------//
                        //---------------- first Project Portfolio starts--------------//
                        HoverContainer(
                          width: 400,
                          height: 650,
                          margin: const EdgeInsets.only(left: 30, top: 80),
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
                          child: Column(
                            children: [
                              Stack(children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 30, left: 30),
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
                                    padding:
                                        EdgeInsets.only(top: 50, left: 140),
                                    child: Text("Muhammad Asif",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 75, left: 140),
                                    child: Text("Owner",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 99, left: 140),
                                    child: Text("Self Employe at ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 125, left: 140),
                                    child: Text(
                                        "Islamabad , Capital , Pakistan",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))),
                              ]),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 40, left: 5, bottom: 0),
                                  child: Text(
                                    "1 Canal Banglo Project ",
                                    style: TextStyle(
                                      color: Color(0xFFFFA62B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                              const Padding(
                                  padding: EdgeInsets.only(top: 15, left: 0),
                                  child: Text(
                                      "F11, Street 8, Islamabad, Pakistan",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400))),
                              //------------------------------------------//
                              Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 65, bottom: 0),
                                      child: Text(
                                        "Construct By :",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 5, bottom: 0),
                                      child: Text(
                                        "Muhammad Abdullah Gul",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                              //------------------------Picture Box-----------------//
                              Container(
                                width: 250,
                                height: 200,
                                margin: EdgeInsets.only(top: 80),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("ProjectImages/8.jpg"),
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //--------------------------------------------End Project Portfolio Profile--------------------------------//
                      ]),
                )

//----------------------------End here--------------//
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 60, left: 600),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 8, right: 0, bottom: 0),
                child: Text(
                  "<",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          HoverContainer(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            hoverDecoration: BoxDecoration(
                color: Color(0xFFFFA62B),
                borderRadius: BorderRadius.circular(5)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 12, right: 0, top: 4),
                child: Text(
                  "1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          HoverContainer(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            hoverDecoration: BoxDecoration(
                color: Color(0xFFFFA62B),
                borderRadius: BorderRadius.circular(5)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 12, right: 0, top: 4),
                child: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          HoverContainer(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            hoverDecoration: BoxDecoration(
                color: Color(0xFFFFA62B),
                borderRadius: BorderRadius.circular(5)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 12, right: 0, top: 4),
                child: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          HoverContainer(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            hoverDecoration: BoxDecoration(
                color: Color(0xFFFFA62B),
                borderRadius: BorderRadius.circular(5)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 12, right: 0, top: 4),
                child: Text(
                  "4",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 8, right: 0, bottom: 0),
                child: Text(
                  ">",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
