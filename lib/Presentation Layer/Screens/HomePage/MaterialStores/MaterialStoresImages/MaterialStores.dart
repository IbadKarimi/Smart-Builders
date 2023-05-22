import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/BuisnessLogic%20Layer/Api.dart';
import 'package:smart_builder_web/models/RetailerProfileModel.dart';

import '../../../../../models/MaterialStoresModel.dart';
import '../../../Owner/Owner_Desire_Building.dart';
import '../../footer.dart';
import '../../header.dart';
import '../../home_page.dart';
import 'package:latlong2/latlong.dart';
String? ratesId;
String? id;

double latitude=0.0;
double longitude=0.0;


class MaterialStores extends StatefulWidget {
  const MaterialStores({super.key});

  @override
  State<MaterialStores> createState() => _MaterialStores();
}

class _MaterialStores extends State<MaterialStores> {
  @override
  ApiService apiService = new ApiService();
  List<RetailerProfileModel> _getRetailerProfileData=[];

  List<MaterialRateModel> _getMaterialRate=[];
  //CurrentUser currentUserEmailObject=CurrentUser();




  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getRetailerProfile().then((value){
      setState(() {
        _getRetailerProfileData.addAll(value);
        for(int index=0;index<_getRetailerProfileData.length;index++) {

            id=_getRetailerProfileData[index].sId.toString();

        }//set data we get
        //set data we get
      });
    });
    apiService.getMaterialRate().then((value){
      setState(() {
        _getMaterialRate.addAll(value);
        for(int index=0;index<_getMaterialRate.length;index++) {


            ratesId=_getMaterialRate[index].sId.toString();
            print(ratesId);





        }//set data we get
        //set data we get
      });
    });


    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        body:id!=null ?SingleChildScrollView(
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
            )):CircularProgressIndicator());
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
                      "lib/Presentation Layer/Screens/HomePage/MaterialStores/MaterialStoresImages/MaterialStores.jpg"),
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
  ApiService apiService = new ApiService();
  List<RetailerProfileModel> _getRetailerProfileData=[];

  List<MaterialRateModel> _getMaterialRate=[];
  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getRetailerProfile().then((value){
      setState(() {
        _getRetailerProfileData.addAll(value);
        for(int index=0;index<_getRetailerProfileData.length;index++) {

          id=_getRetailerProfileData[index].sId.toString();

        }//set data we get
        //set data we get
      });
    });
    apiService.getMaterialRate().then((value){
      setState(() {
        _getMaterialRate.addAll(value);
        for(int index=0;index<_getMaterialRate.length;index++) {


          ratesId=_getMaterialRate[index].sId.toString();
          print(ratesId);





        }//set data we get
        //set data we get
      });
    });


    super.initState();
  }
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
                padding: const EdgeInsets.only(left: 700, top: 20,bottom: 20),
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

                margin: const EdgeInsets.only(top: 50,),
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFD9D9D9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        for(int index=0;index<_getRetailerProfileData.length;index++)

                        Container(
                          width: 300,
                          margin: EdgeInsets.only(left: 20, top: 30,bottom: 20,right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xFF888787),
                              )),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Padding(
                                    padding: EdgeInsets.only(
                                        top: 30, left: 30, bottom: 0),
                                    child: Text(
                                      _getRetailerProfileData[index].shopName.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),


                               Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 40, bottom: 0),
                                    child: Text(
                                      _getRetailerProfileData[index].firstName.toString()+" "+_getRetailerProfileData[index].lastName.toString(),
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
                                      Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 10),
                                          child: Text(_getRetailerProfileData[index].city.toString()+" , "+"Punjab"+" , "+_getRetailerProfileData[index].country.toString(),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w500))),

                                    ],
                                  ),
                                ),
                                if(_getRetailerProfileData[index].storeAdress.toString()!=null)
                                Padding(
                                    padding:
                                    EdgeInsets.only(top: 2, left: 65),
                                    child: Text(_getRetailerProfileData[index].storeAdress.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.w500))),

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
                                        child:  Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 10),
                                            child: Text(_getRetailerProfileData[index].phoneNo.toString(),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12)))),
                                  ],
                                ),
                                for(int _index=0;_index<_getMaterialRate.length;_index++)
                                if(_getRetailerProfileData[index].email.toString()==_getMaterialRate[_index].email.toString())

                                //----------------Steel Price-----------------//

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Padding(
                                            padding: EdgeInsets.only(top: 10, left: 40, bottom: 0),
                                            child: Text(
                                              '${_getMaterialRate[_index].materialName} ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10, right: 30, bottom: 0),
                                            child: Text(
                                              'Rs  ${_getMaterialRate[_index].amount} ${_getMaterialRate[_index].unit}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),



                                //---------------Read More-----------------//


                                //---------------------Button
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 80, bottom: 30),
                                    child: Container(
                                        width: 130,
                                        height: 40,
                                        child: ElevatedButton(
                                            onPressed: () {
                                            setState(() {
                                              longitude=double.parse(_getRetailerProfileData[index].longitude.toString());
                                              latitude=double.parse(_getRetailerProfileData[index].latitude.toString());
                                            });


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
                    MapScreen(),

                  ],
                ),
              ),
            ]),

          ],
        ));
  }
}

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _tapLocation;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1180,
        height:700,
        child:FlutterMap(

          options: MapOptions(
            center:longitude ==0.0? LatLng(33.6844, 73.0479):LatLng(latitude, longitude),
            zoom:13.0,
            minZoom:5.0,
            maxZoom: 18.0,

            // Set the minimum zoom level



            onTap: (TapPosition tapPosition, LatLng latLng) {
              setState(() {
                _tapLocation = latLng;

                print("latitude  :"+_tapLocation!.latitude.toString() );
                print("longitude  :"+_tapLocation!.longitude.toString() );
              });
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 80,
                  point: longitude ==0.0? LatLng(33.6844, 73.0479):LatLng(latitude, longitude),
                  height: 80,
                  builder: (context) => IconButton(
                    onPressed: (){},
                    icon:Icon(Icons.location_on),
                    color:Colors.red,
                    iconSize:35,
                  ),
                ),
              ],
            )
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


