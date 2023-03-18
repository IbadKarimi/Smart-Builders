import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../footer.dart';
import '../header.dart';
import '../home_page.dart';

class MaterialRateList extends StatefulWidget {
  const MaterialRateList({super.key});

  @override
  State<MaterialRateList> createState() => _MaterialRateList();
}

class _MaterialRateList extends State<MaterialRateList> {
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
                  MaterialRateListFirstPage(),
                  BlogsSecondPage(),
                  Footer(),
                ],
              ),
            )));
  }
}

class MaterialRateListFirstPage extends StatefulWidget {
  @override
  State<MaterialRateListFirstPage> createState() =>
      _MaterialRateListFirstPage();
}

class _MaterialRateListFirstPage extends State<MaterialRateListFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 800,
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 10,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF888787),
                    BlendMode.modulate,
                  ),
                  image: AssetImage(
                      "lib/Presentation Layer/Screens/HomePage/MaterialRateList/MaterialRateListImages/Materials.jpg"),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350, left: 700),
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
                                    const MaterialRateList()));
                          }),
                          child: Text(
                            "Material Rate List",
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
            padding: EdgeInsets.only(top: 360, left: 500, bottom: 0),
            child: Text(
              "Material Rate List",
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w600,
              ),
            )),
        //--------------------------------------------//

        //---------------Row dual color text------------------//,
      ],
    );
  }
}

class BlogsSecondPage extends StatefulWidget {
  @override
  State<BlogsSecondPage> createState() => _BlogsSecondPage();
}

class _BlogsSecondPage extends State<BlogsSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(children: [
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 180, bottom: 0),
                  child: Text(
                    "Material Rate List",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  )),

              //---------------------Material Rate List Box--------------------//

              Container(
                width: 1200,
                height: 900,
                margin: EdgeInsets.only(top: 120, left: 170),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Color(0xFF888787),
                )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 0),
                        child: Center(
                          child: Text(
                            "Islamabad",
                            style: TextStyle(
                              color: Color(0xFFFFA62B),
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: 240,
                            margin: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                                bottom: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                                right: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                              ),
                            ),
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                child: Center(
                                  child: Text(
                                    "Image",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                            height: 60,
                            width: 240,
                            margin: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                                bottom: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                                right: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                              ),
                            ),
                            child: const Padding(
                                padding:
                                    EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                child: Center(
                                  child: Text(
                                    "Name",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                            height: 60,
                            width: 240,
                            margin: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                                bottom: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                                right: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                              ),
                            ),
                            child: const Padding(
                                padding:
                                    EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                child: Center(
                                  child: Text(
                                    "Price",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                            height: 60,
                            width: 240,
                            margin: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                                bottom: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                                right: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                              ),
                            ),
                            child: const Padding(
                                padding:
                                    EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                child: Center(
                                  child: Text(
                                    "Unit",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                            height: 60,
                            width: 238,
                            margin: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                                bottom: BorderSide(
                                  color: Color(0xFF888787),
                                ),
                              ),
                            ),
                            child: Padding(
                                padding:
                                    EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                child: Center(
                                  child: Text(
                                    "Updated On",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      //---------------image /Name /Price/Unit
                      Container(
                        height: 180,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            color: Color(0xFF888787),
                          )),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //------------------------Steel Picture------------------//
                            Container(
                              width: 160,
                              height: 160,
                              margin:
                                  const EdgeInsets.only(left: 30, bottom: 20),
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                  // ignore: prefer_const_constructors
                                  image: DecorationImage(
                                      // ignore: prefer_const_constructors
                                      image: AssetImage(
                                          "lib/Presentation Layer/Screens/HomePage/MaterialRateList/MaterialRateListImages/Steel.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                            //--------------------------COntainer Name---------------------//
                            Container(
                              height: 60,
                              width: 220,
                              margin: const EdgeInsets.only(left: 60),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFF888787),
                                ),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, left: 0, bottom: 0),
                                  child: Center(
                                    child: Text(
                                      "Steel",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )),
                            ),
                            //--------------price
                            //--------------------------COntainer Name---------------------//
                            Container(
                              height: 60,
                              width: 220,
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFF888787),
                                ),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, left: 0, bottom: 0),
                                  child: Center(
                                    child: Text(
                                      "255.0",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )),
                            ),
                            //------------unit
                            //--------------------------COntainer Name---------------------//
                            Container(
                              height: 60,
                              width: 220,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xFF888787),
                                ),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, left: 0, bottom: 0),
                                  child: Center(
                                    child: Text(
                                      "Kg",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )),
                            ),
                            //----------Date
                            //--------------------------COntainer Name---------------------//
                            Container(
                              height: 60,
                              width: 220,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xFF888787),
                                ),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, left: 0, bottom: 0),
                                  child: Center(
                                    child: Text(
                                      "25 Jan,2023",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      //-------------------Image/Name /Price ends here row----------------//
                    ]),
              ),
              const SizedBox(
                height: 300,
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: LocationMaterial(),
            ) // place behind the stack
          ],
        ));
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

class LocationMaterial extends StatefulWidget {
  @override
  State<LocationMaterial> createState() => _LocationMaterialState();
}

class _LocationMaterialState extends State<LocationMaterial> {
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
  String selectedOptionRoles = "Material";
  List<String> rolesArrayList = [
    "Steel",
    "Sand",
    'Bricks',
    'Cement',
    'Concrete',
  ];
  //----------------------------------------------//
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 62, left: 170),
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
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    isOpenCity = !isOpenCity;
                    setState(() {});
                  },
                  child: Container(
                    width: 150,
                    height: 35,
                    margin: const EdgeInsets.only(left: 30, top: 45),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 1),
                        borderRadius: BorderRadius.circular(0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      border: Border.all(color: Colors.black38, width: 1),
                      borderRadius: BorderRadius.circular(0)),
                  margin: const EdgeInsets.only(left: 30),
                  child: ListView(
                      primary: true,
                      shrinkWrap: true,
                      children: cityArrayList
                          .map((e) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      isOpenCity = false;
                                      selectedOptionCity = e;
                                      setState(() {});
                                    },
                                    child: HoverContainer(
                                        height: 35,
                                        hoverDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: const Color(0xFFFFA62B),
                                              width: 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
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
            padding: EdgeInsets.only(top: 62, left: 600),
            child: Center(
                child: Text(
              "Select Material :",
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
                    margin: const EdgeInsets.only(left: 30, top: 45),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 1),
                        borderRadius: BorderRadius.circular(0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      border: Border.all(color: Colors.black38, width: 1),
                      borderRadius: BorderRadius.circular(0)),
                  margin: const EdgeInsets.only(left: 30),
                  child: ListView(
                      primary: true,
                      shrinkWrap: true,
                      children: rolesArrayList
                          .map((e) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      isOpenRoles = false;
                                      selectedOptionRoles = e;
                                      setState(() {});
                                    },
                                    child: HoverContainer(
                                        height: 35,
                                        hoverDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: const Color(0xFFFFA62B),
                                              width: 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
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
    );
  }
}
