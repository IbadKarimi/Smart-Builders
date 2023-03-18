import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../../../Owner/Owner_Desire_Building.dart';
import '../../footer.dart';
import '../../header.dart';
import '../../home_page.dart';


class MaterialStores extends StatefulWidget {
  const MaterialStores({super.key});

  @override
  State<MaterialStores> createState() => _MaterialStores();
}

class _MaterialStores extends State<MaterialStores> {
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
                  MaterialStoresFirstPage(),
                  MaterialStoresSecondPage(),
                  Footer(),
                ],
              ),
            )));
  }
}

class MaterialStoresFirstPage extends StatefulWidget {
  @override
  State<MaterialStoresFirstPage> createState() => _MaterialStoresFirstPage();
}

class _MaterialStoresFirstPage extends State<MaterialStoresFirstPage> {
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
                      "lib/MaterialStores/MaterialStoresImages/MaterialStores.jpg"),
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
                                builder: (context) => const MaterialStores()));
                          }),
                          child: Text(
                            "Material Stores Near By",
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
            padding: EdgeInsets.only(top: 360, left: 400, bottom: 0),
            child: Text(
              "Material Stores Near By",
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

class MaterialStoresSecondPage extends StatefulWidget {
  @override
  State<MaterialStoresSecondPage> createState() => _MaterialStoresSecondPage();
}

class _MaterialStoresSecondPage extends State<MaterialStoresSecondPage> {
  @override
  bool isOpenReadMore = false;
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 700, top: 40),
                child: Row(
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
                              "Retail",
                              style: TextStyle(
                                color: Color(0xFFFFA62B),
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                        child: GestureDetector(
                            onTap: (() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const MaterialStores()));
                            }),
                            child: Text(
                              "Location",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ))),
                  ],
                ),
              ),

              //---------------------Grey Box--------------------//
              Container(
                height: 1000,
                margin: const EdgeInsets.only(top: 150),
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFD9D9D9),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          margin: EdgeInsets.only(left: 50, top: 30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xFF888787),
                              )),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(
                                        top: 30, left: 30, bottom: 0),
                                    child: Text(
                                      "Mujahid Steel",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 40, bottom: 0),
                                    child: Text(
                                      "Umair Malik",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                                //------------------Place Holder-------------//
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 37, top: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          width: 18,
                                          height: 18,
                                          margin: const EdgeInsets.only(
                                              top: 5, right: 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: const DecorationImage(
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      "PreviewProfilePic/placeholder.png")))),
                                      const Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 10),
                                          child: Text("Lahore, PB",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                    ],
                                  ),
                                ),

                                //---------------------Contact and Number-------------------//
                                Row(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 37),
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                            "FooterQuestionLogo/Contact.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {},
                                        child: const Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 10),
                                            child: Text("03425949630",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12)))),
                                  ],
                                ),
                                //----------------Steel Price-----------------//
                                const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 40, bottom: 0),
                                    child: Text(
                                      "Steel Price       : Rs 255 per Kg",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 40, bottom: 0),
                                    child: Text(
                                      "Cement Price  : Rs 1000 per Kg",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 40, bottom: 0),
                                    child: Text(
                                      "Sand Price       : Rs 500 per Cubic",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                const Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 40, bottom: 0),
                                    child: Text(
                                      "Bricks Price     : Rs 25 per Kg",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                //---------------Read More-----------------//
                                GestureDetector(
                                    onTap: () {
                                      isOpenReadMore = !isOpenReadMore;
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, top: 10),
                                      child: Text(
                                        "Read more:",
                                        style: TextStyle(
                                          color: Color(0xFFFFA62B),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )),
                                if (isOpenReadMore == true)
                                  Container(
                                    margin: EdgeInsets.only(left: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 40, bottom: 0),
                                            child: Text(
                                              "Steel Price       : Rs 255 per Kg",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 40, bottom: 0),
                                            child: Text(
                                              "Cement Price  : Rs 1000 per Kg",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 40, bottom: 0),
                                            child: Text(
                                              "Sand Price       : Rs 500 per Cubic",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 40, bottom: 0),
                                            child: Text(
                                              "Bricks Price     : Rs 25 per Kg",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),

                                //---------------------Button
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 80, bottom: 30),
                                    child: Container(
                                        width: 130,
                                        height: 40,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DesireBuilding()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFF363B42),
                                            ),
                                            // ignore: sort_child_properties_last
                                            child: Row(children: const <Widget>[
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    "View on",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    "Map",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFF9900),
                                                        fontSize: 12),
                                                  ))
                                            ])))),
                                //---------------------
                              ]),
                        ),
                      ],
                    ),
                    //-------------------------------------Map Pic
                    Container(
                      width: 1150,
                      height: 1000,
                      margin: EdgeInsets.only(top: 30, bottom: 30, left: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "lib/MaterialStores/MaterialStoresImages/Map.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SearchSelectLocation(),
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

class SearchSelectLocation extends StatefulWidget {
  @override
  State<SearchSelectLocation> createState() => _SearchSelectLocation();
}

class _SearchSelectLocation extends State<SearchSelectLocation> {
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
        Padding(
            padding: const EdgeInsets.only(top: 100, left: 60),
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
                        "Search Location"), //------------------correct this
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ))),
        const Padding(
            padding: EdgeInsets.only(top: 105, left: 700),
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
                    margin: const EdgeInsets.only(left: 30, top: 90),
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

        //--------------------------------------------------Roles Drop Down End Here-----------------------//
      ],
    );
  }
}
