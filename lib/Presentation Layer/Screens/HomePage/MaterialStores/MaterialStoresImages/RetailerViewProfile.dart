import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hovering/hovering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/CurrentUser.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Preview_Profile.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Profile.dart';
import 'package:smart_builder_web/models/DataModels.dart';

import '../../../../../BuisnessLogic Layer/Api.dart';

import '../../../../../models/MaterialStoresModel.dart';
import '../../../../../models/RetailerProfileModel.dart';
import '../../../Owner/Owner_Desire_Building.dart';
import '../../footer.dart';
import '../../header.dart';
import 'package:intl/intl.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:typed_data';
import 'dart:html';
import 'dart:typed_data';



const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
String? id;

String? firstName;
String? lastName;
String? city;
String? email;
String? phoneNo;

String? country;
String? profilePhoto;
String? coverPhoto;
String? shopName;
String ?currentUserEmail;
String ?response;

String? RatesId;
String? latitude;
String? longitude;

bool isEditMode=false;
bool _autoValidate=false;


PlatformFile? coverPhotoObject;

PlatformFile? editProfilePhotoObject;
PlatformFile?editCoverPhotoObject;

double _zoom=13.0;
double ?minZoom=0;

class RetailerViewProfile extends StatefulWidget {
  String currentUserEmail;
  RetailerViewProfile(this.currentUserEmail);


  @override
  State<RetailerViewProfile> createState() => _RetailerViewProfile();
}

class _RetailerViewProfile extends State<RetailerViewProfile> {
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();
  List<RetailerProfileModel> _getRetailerProfileData=[];

  List<MaterialRateModel> _getMaterialRate=[];



  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getRetailerProfile().then((value){
      setState(() {
        _getRetailerProfileData.addAll(value);
        for(int index=0;index<_getRetailerProfileData.length;index++) {
          if (_getRetailerProfileData[index].email.toString()==currentUserEmail) {

            id=_getRetailerProfileData[index].sId.toString();

            firstName=_getRetailerProfileData[index].firstName.toString();
            lastName=_getRetailerProfileData[index].lastName.toString();
            city=_getRetailerProfileData[index].city.toString();
            email=_getRetailerProfileData[index].email.toString();
            phoneNo=_getRetailerProfileData[index].phoneNo.toString();
            shopName=_getRetailerProfileData[index].shopName.toString();
            country=_getRetailerProfileData[index].country.toString();
            profilePhoto=_getRetailerProfileData[index].profilePhoto.toString();
            coverPhoto=_getRetailerProfileData[index].coverPhoto.toString();


          }
        }//set data we get
        //set data we get
      });
    });
    apiService.getMaterialRate().then((value){
      setState(() {
        _getMaterialRate.addAll(value);
        for(int index=0;index<_getMaterialRate.length;index++) {
          if (_getMaterialRate[index].email.toString()==currentUserEmail) {

            RatesId=_getMaterialRate[index].sId.toString();




          }
        }//set data we get
        //set data we get
      });
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    currentUserEmail=widget.currentUserEmail;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body:id!=null? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
                    Boxes(),
                    RetailerCoverProfile(),
                    MaterialRates(),
                    MyRates(),

                    Footer()
                  ],
                ))):Center(child: Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: CircularProgressIndicator(),
                )));
  }
}




class RetailerCoverProfile extends StatefulWidget {
  RetailerCoverProfile({super.key});
  @override
  State<RetailerCoverProfile> createState() => _RetailerCoverProfile();
}

class _RetailerCoverProfile extends State<RetailerCoverProfile> {

  void dispose() {
    response='0';
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 900,

        margin: const EdgeInsets.only(top: 50, bottom: 10),
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: strokeColor)), // all the boxes are here like skill
        child: Stack(children: <Widget>[

          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:coverPhoto!=""? Image.network(
                coverPhoto.toString(),
                height: 300.0,
                width: 900.0,
                scale: 2,
                fit: BoxFit.cover,
              ):Container(width:900,height: 300,decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular((10),)),)
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const uploadCoverPhotoAlertDialog();
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
          Padding(
            padding:  EdgeInsets.only(left:50,top:220),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child:profilePhoto!=""? Image.network(
                  profilePhoto.toString(),
                  height: 140.0,
                  width: 140.0,
                  scale: 2,
                  fit: BoxFit.cover,
                ):Container(width:140,height: 140,decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular((10),)),)
            ),
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const uploadProfilePhotoAlertDialog();
                    });
              },
              child: Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(top: 310, left: 173),
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


              margin: EdgeInsets.only(left: 0, top: 340, right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 50, top: 50, right: 80),
                      child: Text(firstName.toString()+" "+lastName.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700))),
                  const Padding(
                      padding: EdgeInsets.only(left: 50,top:5),
                      child: Text("Material Supplier",
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),
                   Padding(
                      padding: EdgeInsets.only(
                        left: 50,
                        top: 10,
                      ),
                      child: Text(shopName.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700))),
                  Padding(
                      padding: EdgeInsets.only(top: 5, left: 50,bottom: 10),
                      child: Text(city.toString()+" , "+"Punjab"+" , "+"Pakistan",
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),

                  GestureDetector(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return mapAlertDialog(); //---------calling the class here
                          });
                    },
                    child: const Padding(
                        padding: EdgeInsets.only(left: 50,top:0,bottom: 20),
                        child: Text("Add Your Store Location on MAP",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))),
                  ),






                ],
              )),

        ]));
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




class MaterialRates extends StatefulWidget {
  MaterialRates({super.key});
  @override
  State<MaterialRates> createState() => _MaterialRates();
}

class _MaterialRates extends State<MaterialRates> {
  int counter=0;
  int _tapCount = 0;
  int form2Counter=0;
  int form3Counter=0;
  int form4Counter=0;
  int form5Counter=0;
  int onTapcounter=0;
  @override

  final _materialNameController=TextEditingController();
  final _amountController=TextEditingController();

  final _materialNameController2=TextEditingController();
  final _amountController2=TextEditingController();

  final _materialNameController3=TextEditingController();
  final _amountController3=TextEditingController();

  final _materialNameController4=TextEditingController();
  final _amountController4=TextEditingController();

  final _materialNameController5=TextEditingController();
  final _amountController5=TextEditingController();

  final _materialFormKey = GlobalKey<FormState>();

  final _materialFormKey2 = GlobalKey<FormState>();
  final _materialFormKey3 = GlobalKey<FormState>();
  final _materialFormKey4 = GlobalKey<FormState>();
  final _materialFormKey5= GlobalKey<FormState>();


  final List<String> options = [
    'Sand',
    'Cement',
    'Concrete',
    'Bricks',
    'Steel',
  ];

  bool isOpenUnit1 = false;
  String selectedOptionUnit1 = "Kg";

  bool isOpenUnit2 = false;
  String selectedOptionUnit2 = "Kg";

  bool isOpenUnit3 = false;
  String selectedOptionUnit3 = "Kg";

  bool isOpenUnit4 = false;
  String selectedOptionUnit4 = "Kg";

  bool isOpenUnit5 = false;
  String selectedOptionUnit5 = "Kg";

  List<String> optionsUnit = ["Kg.", 'Cubic Ft.','Bag.','Each.'];

  String _selectedOption = '';
  List<DataModel> _dataList = [];
  List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(options);

    matches.firstWhere((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
  Widget build(BuildContext context) {

    void _addFormField() {
      setState(() {
        _dataList.add(DataModel(material: '', date: DateTime.now(), amount: 0.0));
      });
    }

    DateTime now = DateTime.now();
    DateTime currentDate = DateTime.now();
    String _currentDateNow = DateFormat('dd-MM-yyy').format(currentDate);
    print(_currentDateNow);

    return Container(
        width: 900,
        height: 700,

        margin: const EdgeInsets.only(top: 20, bottom: 50),

    decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(10),
    border: Border.all(
    color: strokeColor)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(
                left: 50,top:40
            ),
            child: Text(
              "Material Price",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 50,top:20
            ),
            child: Text(
              "Add new items and Also update material Prices amount to the market ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            )),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(
                              left: 50,top:40
                          ),
                          child: Text(
                            "Material Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(
                              left: 105,top:40
                          ),
                          child: Text(
                            "Amount",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(
                              left: 125,top:40
                          ),
                          child: Text(
                            "Unit",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(
                              left: 160,top:40
                          ),
                          child: Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ]),
                //----------------------Form 1------------------------//
               Stack(
              alignment: AlignmentDirectional.topStart,
                 children: [
                   GestureDetector(

                     onTap:_tapCount<5? (){
                       if(_tapCount<5){
                         setState(() {
                           _tapCount++;
                           print(_tapCount.toString());


                         });


                         if(_tapCount==1){
                           setState(() {
                             form2Counter=1;

                           });

                         }
                         if(_tapCount==2){
                           setState(() {
                             form3Counter=1;
                           });

                         }




                         if(_tapCount==3){
                           setState(() {
                             form4Counter=1;

                           });

                         }
                         if(_tapCount==4){
                           setState(() {
                             form5Counter=1;
                           });

                         }
                       }






                     }:(){},
                     child:   Padding(
                         padding:_tapCount==0 ?EdgeInsets.only(
                             left: 50,top:60
                         ): _tapCount==1?EdgeInsets.only(
                             left: 50,top:110
                         ):_tapCount==2?EdgeInsets.only(
                             left: 50,top:160
                         ):_tapCount==3?EdgeInsets.only(
                             left: 50,top:210
                         ):_tapCount==4?EdgeInsets.only(
                             left: 50,top:260
                         ):EdgeInsets.only(
                             left: 50,top:260
                         ),
                         child: Text(
                           "Add More Fields",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 14,
                             fontWeight: FontWeight.w700,
                           ),
                         )),

                   ),
                   //----------------------Submit----------------------//
                   Padding(

                       padding:_tapCount==0 ?EdgeInsets.only(
                           left: 580,top:70
                       ): _tapCount==1?EdgeInsets.only(
                           left: 580,top:120
                       ):_tapCount==2?EdgeInsets.only(
                           left: 580,top:170
                       ):_tapCount==3?EdgeInsets.only(
                           left: 580,top:220
                       ):_tapCount==4?EdgeInsets.only(
                           left: 580,top:270
                       ):EdgeInsets.only(
                           left: 580,top:270
                       ),child:Container(
                           width: 150,
                           height: 35,
                           child: ElevatedButton(
                               onPressed: () async {

                                 if( _materialFormKey.currentState!.validate() ||_materialFormKey2.currentState!.validate()
                                     ||_materialFormKey3.currentState!.validate()||_materialFormKey4.currentState!.validate()||_materialFormKey5.currentState!.validate()
                                 ){
                                   if(_tapCount==0){
                                     apiService.InsertMaterialRate(email.toString(), _materialNameController.text, _amountController.text, selectedOptionUnit1, _currentDateNow);
                                     showDialog(
                                         context: context,
                                         builder: (BuildContext context) {
                                           return RateListDialog();
                                         });
                                   }
                                   if(_tapCount==1){
                                     apiService.InsertMaterialRate(email.toString(), _materialNameController.text, _amountController.text, selectedOptionUnit1, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController2.text, _amountController2.text, selectedOptionUnit2, _currentDateNow);

                                     showDialog(
                                         context: context,
                                         builder: (BuildContext context) {
                                           return RateListDialog();
                                         });
                                   }

                                   if(_tapCount==2){
                                     apiService.InsertMaterialRate(email.toString(), _materialNameController.text, _amountController.text, selectedOptionUnit1, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController2.text, _amountController2.text, selectedOptionUnit2, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController3.text, _amountController3.text, selectedOptionUnit3, _currentDateNow);
                                     showDialog(
                                         context: context,
                                         builder: (BuildContext context) {
                                           return RateListDialog();
                                         });
                                   }
                                   if(_tapCount==3){
                                     apiService.InsertMaterialRate(email.toString(), _materialNameController.text, _amountController.text, selectedOptionUnit1, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController2.text, _amountController2.text, selectedOptionUnit2, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController3.text, _amountController3.text, selectedOptionUnit3, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController4.text, _amountController4.text, selectedOptionUnit4, _currentDateNow);
                                     showDialog(
                                         context: context,
                                         builder: (BuildContext context) {
                                           return RateListDialog();
                                         });
                                   }

                                   if(_tapCount==4){
                                     apiService.InsertMaterialRate(email.toString(), _materialNameController.text, _amountController.text, selectedOptionUnit1, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController2.text, _amountController2.text, selectedOptionUnit2, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController3.text, _amountController3.text, selectedOptionUnit3, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController4.text, _amountController4.text, selectedOptionUnit4, _currentDateNow);

                                     apiService.InsertMaterialRate(email.toString(), _materialNameController5.text, _amountController5.text, selectedOptionUnit5, _currentDateNow);
                                     showDialog(
                                         context: context,
                                         builder: (BuildContext context) {
                                           return RateListDialog();
                                         });
                                   }


                                 }

                                 else{
                                   setState(() {

                                     _autoValidate=true;
                                   });

                                 }

                               },


                               // ignore: sort_child_properties_last
                               child: Row(children: const <Widget>[
                                 Padding(
                                     padding: const EdgeInsets.only(left: 35),
                                     child: Text(
                                       "Submit",
                                       style: TextStyle(
                                           color: Colors.white, fontSize: 12),
                                     )),

                               ]),
                               style: ElevatedButton.styleFrom(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(30.0),
                                   ),
                                   backgroundColor: const Color(0xFF363B42))))),
                 if(form5Counter==1)
                   Padding(
                     padding: const EdgeInsets.only(top:200),
                     child: Form(
                       key:_materialFormKey5,
                       autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                       child: Stack(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 margin:EdgeInsets.only(top:10,left:50),
                                 width: 150,
                                 child: TextFormField(
                                   controller: _materialNameController5,
                                   decoration: InputDecoration(


                                       helperText: "",
                                       isDense: true,
                                       contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       )),
                                   onChanged: (value) {
                                     setState(() {

                                     });
                                   },
                                   validator: (value){
                                     if(value!.trim().isEmpty){
                                       return "Name is Required";

                                     }
                                     final RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
                                     if (!regex.hasMatch(value)) {
                                       return 'Invalid material name';
                                     }
                                     return null;

                                   },

                                 ),
                               ),
                               Container(
                                 width: 150,
                                 margin:EdgeInsets.only(top:10,left:30),
                                 child: TextFormField(
                                   inputFormatters: <TextInputFormatter>[
                                     FilteringTextInputFormatter.digitsOnly
                                   ],
                                   controller: _amountController5,
                                   validator: (value){
                                     if(value!.trim().isEmpty){
                                       return "Amount is Required";

                                     }
                                     return null;

                                   },
                                   onChanged: (value) {
                                     setState(() {

                                     });
                                   },
                                   decoration: InputDecoration(


                                       helperText: "",
                                       isDense: true,
                                       contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       )),
                                 ),
                               ),

                               Stack(

                                 children: [


                                   GestureDetector(
                                       onTap: () {
                                         isOpenUnit5 = !isOpenUnit5;
                                         setState(() {});
                                       },
                                       child: SingleChildScrollView(
                                         scrollDirection: Axis.vertical,
                                         child: Container(
                                           width: 150,
                                           height: 32,
                                           margin: const EdgeInsets.only(
                                             left: 20, top: 10, ),
                                           decoration: BoxDecoration(
                                               border: Border.all(
                                                   color: Colors.black38,
                                                   width: 1),
                                               borderRadius:
                                               BorderRadius.circular(10)),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 10),
                                             child: Row(
                                               mainAxisAlignment:
                                               MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Text(selectedOptionUnit5),
                                                 Icon(
                                                     isOpenUnit5
                                                         ? Icons.arrow_drop_up
                                                         : Icons.arrow_drop_down,
                                                     color: Colors.black),
                                               ],
                                             ),
                                           ),
                                         ),
                                       )),
                                   if (isOpenUnit5)
                                     Container(
                                       width: 150,
                                       height: 100,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           border: Border.all(
                                               color: Colors.black38, width: 1),
                                           borderRadius: BorderRadius.circular(5)),
                                       margin: const EdgeInsets.only(left: 20,top:40),
                                       child: ListView(
                                           scrollDirection: Axis.vertical,
                                           primary: true,
                                           shrinkWrap: true,
                                           children:
                                           optionsUnit //--------------------list
                                               .map((e) => Container(
                                             decoration: BoxDecoration(
                                                 borderRadius:
                                                 BorderRadius
                                                     .circular(5)),
                                             child: Padding(
                                               padding:
                                               const EdgeInsets
                                                   .all(2.0),
                                               child: GestureDetector(
                                                 onTap: () {
                                                   isOpenUnit5 =
                                                   false;
                                                   selectedOptionUnit5 =
                                                       e;
                                                   setState(() {});
                                                 },
                                                 child: HoverContainer(
                                                     height: 35,
                                                     decoration:
                                                     BoxDecoration(
                                                       color: Colors
                                                           .white,
                                                     ),
                                                     hoverDecoration:
                                                     BoxDecoration(
                                                       borderRadius:
                                                       BorderRadius
                                                           .circular(
                                                           5),
                                                       border: Border.all(
                                                           color: const Color(
                                                               0xFFFFA62B),
                                                           width: 1),
                                                     ),
                                                     child: Padding(
                                                       padding:
                                                       const EdgeInsets
                                                           .all(
                                                           2.0),
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
                               //amount field
                               Padding(
                                   padding: EdgeInsets.only(top: 10, left: 30),
                                   child: Container(
                                     width: 150,
                                     height: 32,


                                     child:   Padding(
                                         padding: EdgeInsets.only(
                                             left: 14,top:7
                                         ),
                                         child: Text(
                                           _currentDateNow,
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontSize: 14,
                                             fontWeight: FontWeight.w700,
                                           ),
                                         )),
                                     decoration: BoxDecoration(
                                         borderRadius:BorderRadius.circular(10),
                                         border:Border.all(color:Colors.grey,width: 1)
                                     ),
                                   )),

                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                 if(form4Counter==1)
                   Padding(
                     padding: const EdgeInsets.only(top:150),
                     child: Form(
                       key:_materialFormKey4,
                       autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                       child: Stack(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 margin:EdgeInsets.only(top:10,left:50),
                                 width: 150,
                                 child: TextFormField(
                                   controller: _materialNameController4,
                                   decoration: InputDecoration(


                                       helperText: "",
                                       isDense: true,
                                       contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       )),
                                   onChanged: (value) {
                                     setState(() {

                                     });
                                   },
                                   validator: (value){
                                     if(value!.trim().isEmpty){
                                       return "Name is Required";

                                     }
                                     final RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
                                     if (!regex.hasMatch(value)) {
                                       return 'Invalid material name';
                                     }
                                     return null;

                                   },

                                 ),
                               ),
                               Container(
                                 width: 150,
                                 margin:EdgeInsets.only(top:10,left:30),
                                 child: TextFormField(
                                   inputFormatters: <TextInputFormatter>[
                                     FilteringTextInputFormatter.digitsOnly
                                   ],
                                   controller: _amountController4,
                                   validator: (value){
                                     if(value!.trim().isEmpty){
                                       return "Amount is Required";

                                     }
                                     return null;

                                   },
                                   onChanged: (value) {
                                     setState(() {

                                     });
                                   },
                                   decoration: InputDecoration(


                                       helperText: "",
                                       isDense: true,
                                       contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       )),
                                 ),
                               ),

                               Stack(

                                 children: [


                                   GestureDetector(
                                       onTap: () {
                                         isOpenUnit4 = !isOpenUnit4;
                                         setState(() {});
                                       },
                                       child: SingleChildScrollView(
                                         scrollDirection: Axis.vertical,
                                         child: Container(
                                           width: 150,
                                           height: 32,
                                           margin: const EdgeInsets.only(
                                             left: 20, top: 10, ),
                                           decoration: BoxDecoration(
                                               border: Border.all(
                                                   color: Colors.black38,
                                                   width: 1),
                                               borderRadius:
                                               BorderRadius.circular(10)),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 10),
                                             child: Row(
                                               mainAxisAlignment:
                                               MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Text(selectedOptionUnit4),
                                                 Icon(
                                                     isOpenUnit4
                                                         ? Icons.arrow_drop_up
                                                         : Icons.arrow_drop_down,
                                                     color: Colors.black),
                                               ],
                                             ),
                                           ),
                                         ),
                                       )),
                                   if (isOpenUnit4)
                                     Container(
                                       width: 150,
                                       height: 100,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           border: Border.all(
                                               color: Colors.black38, width: 1),
                                           borderRadius: BorderRadius.circular(5)),
                                       margin: const EdgeInsets.only(left: 20,top:40),
                                       child: ListView(
                                           scrollDirection: Axis.vertical,
                                           primary: true,
                                           shrinkWrap: true,
                                           children:
                                           optionsUnit //--------------------list
                                               .map((e) => Container(
                                             decoration: BoxDecoration(
                                                 borderRadius:
                                                 BorderRadius
                                                     .circular(5)),
                                             child: Padding(
                                               padding:
                                               const EdgeInsets
                                                   .all(2.0),
                                               child: GestureDetector(
                                                 onTap: () {
                                                   isOpenUnit4 =
                                                   false;
                                                   selectedOptionUnit4 =
                                                       e;
                                                   setState(() {});
                                                 },
                                                 child: HoverContainer(
                                                     height: 35,
                                                     decoration:
                                                     BoxDecoration(
                                                       color: Colors
                                                           .white,
                                                     ),
                                                     hoverDecoration:
                                                     BoxDecoration(
                                                       borderRadius:
                                                       BorderRadius
                                                           .circular(
                                                           5),
                                                       border: Border.all(
                                                           color: const Color(
                                                               0xFFFFA62B),
                                                           width: 1),
                                                     ),
                                                     child: Padding(
                                                       padding:
                                                       const EdgeInsets
                                                           .all(
                                                           2.0),
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
                               //amount field
                               Padding(
                                   padding: EdgeInsets.only(top: 10, left: 30),
                                   child: Container(
                                     width: 150,
                                     height: 32,


                                     child:   Padding(
                                         padding: EdgeInsets.only(
                                             left: 14,top:7
                                         ),
                                         child: Text(
                                           _currentDateNow,
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontSize: 14,
                                             fontWeight: FontWeight.w700,
                                           ),
                                         )),
                                     decoration: BoxDecoration(
                                         borderRadius:BorderRadius.circular(10),
                                         border:Border.all(color:Colors.grey,width: 1)
                                     ),
                                   )),

                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                 if(form3Counter==1)
                   Padding(
                     padding: const EdgeInsets.only(top:100),
                     child: Form(
                       key:_materialFormKey3,
                       autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                       child:form3Counter==1? Stack(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 margin:EdgeInsets.only(top:10,left:50),
                                 width: 150,
                                 child: TextFormField(
                                   controller: _materialNameController3,
                                   decoration: InputDecoration(


                                       helperText: "",
                                       isDense: true,
                                       contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       )),
                                   onChanged: (value) {
                                     setState(() {

                                     });
                                   },
                                   validator: (value){
                                     if(value!.trim().isEmpty){
                                       return "Name is Required";

                                     }
                                     final RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
                                     if (!regex.hasMatch(value)) {
                                       return 'Invalid material name';
                                     }
                                     return null;

                                   },

                                 ),
                               ),
                               Container(
                                 width: 150,
                                 margin:EdgeInsets.only(top:10,left:30),
                                 child: TextFormField(
                                   inputFormatters: <TextInputFormatter>[
                                     FilteringTextInputFormatter.digitsOnly
                                   ],
                                   controller: _amountController3,
                                   validator: (value){
                                     if(value!.trim().isEmpty){
                                       return "Amount is Required";

                                     }
                                     return null;

                                   },
                                   onChanged: (value) {
                                     setState(() {

                                     });
                                   },
                                   decoration: InputDecoration(


                                       helperText: "",
                                       isDense: true,
                                       contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       )),
                                 ),
                               ),

                               Stack(

                                 children: [


                                   GestureDetector(
                                       onTap: () {
                                         isOpenUnit3 = !isOpenUnit3;
                                         setState(() {});
                                       },
                                       child: SingleChildScrollView(
                                         scrollDirection: Axis.vertical,
                                         child: Container(
                                           width: 150,
                                           height: 32,
                                           margin: const EdgeInsets.only(
                                             left: 20, top: 10, ),
                                           decoration: BoxDecoration(
                                               border: Border.all(
                                                   color: Colors.black38,
                                                   width: 1),
                                               borderRadius:
                                               BorderRadius.circular(10)),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 10),
                                             child: Row(
                                               mainAxisAlignment:
                                               MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Text(selectedOptionUnit3),
                                                 Icon(
                                                     isOpenUnit3
                                                         ? Icons.arrow_drop_up
                                                         : Icons.arrow_drop_down,
                                                     color: Colors.black),
                                               ],
                                             ),
                                           ),
                                         ),
                                       )),
                                   if (isOpenUnit3)
                                     Container(
                                       width: 150,
                                       height: 100,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           border: Border.all(
                                               color: Colors.black38, width: 1),
                                           borderRadius: BorderRadius.circular(5)),
                                       margin: const EdgeInsets.only(left: 20,top:40),
                                       child: ListView(
                                           scrollDirection: Axis.vertical,
                                           primary: true,
                                           shrinkWrap: true,
                                           children:
                                           optionsUnit //--------------------list
                                               .map((e) => Container(
                                             decoration: BoxDecoration(
                                                 borderRadius:
                                                 BorderRadius
                                                     .circular(5)),
                                             child: Padding(
                                               padding:
                                               const EdgeInsets
                                                   .all(2.0),
                                               child: GestureDetector(
                                                 onTap: () {
                                                   isOpenUnit3 =
                                                   false;
                                                   selectedOptionUnit3 =
                                                       e;
                                                   setState(() {});
                                                 },
                                                 child: HoverContainer(
                                                     height: 35,
                                                     decoration:
                                                     BoxDecoration(
                                                       color: Colors
                                                           .white,
                                                     ),
                                                     hoverDecoration:
                                                     BoxDecoration(
                                                       borderRadius:
                                                       BorderRadius
                                                           .circular(
                                                           5),
                                                       border: Border.all(
                                                           color: const Color(
                                                               0xFFFFA62B),
                                                           width: 1),
                                                     ),
                                                     child: Padding(
                                                       padding:
                                                       const EdgeInsets
                                                           .all(
                                                           2.0),
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
                               //amount field
                               Padding(
                                   padding: EdgeInsets.only(top: 10, left: 30),
                                   child: Container(
                                     width: 150,
                                     height: 32,


                                     child:   Padding(
                                         padding: EdgeInsets.only(
                                             left: 14,top:7
                                         ),
                                         child: Text(
                                           _currentDateNow,
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontSize: 14,
                                             fontWeight: FontWeight.w700,
                                           ),
                                         )),
                                     decoration: BoxDecoration(
                                         borderRadius:BorderRadius.circular(10),
                                         border:Border.all(color:Colors.grey,width: 1)
                                     ),
                                   )),

                             ],
                           ),
                         ],
                       ):Container(),

    ),
                   ),
    //-----------
                 if(form2Counter==1)
                   Padding(
                     padding: const EdgeInsets.only(top:50),
                     child: Form(
                       key:_materialFormKey2,
                       autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                       child: Stack(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 margin:EdgeInsets.only(top:10,left:50),
                                 width: 150,
                                 child: TextFormField(
                                   controller: _materialNameController2,
                                   decoration: InputDecoration(


                                       helperText: "",
                                       isDense: true,
                                       contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       )),
                                   onChanged: (value) {
                                     setState(() {

                                     });
                                   },
                                   validator: (value){
                                     if(value!.trim().isEmpty){
                                       return "Name is Required";

                                     }
                                     final RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
                                     if (!regex.hasMatch(value)) {
                                       return 'Invalid material name';
                                     }
                                     return null;

                                   },

                                 ),
                               ),
                               Container(
                                 width: 150,
                                 margin:EdgeInsets.only(top:10,left:30),
                                 child: TextFormField(
                                   inputFormatters: <TextInputFormatter>[
                                     FilteringTextInputFormatter.digitsOnly
                                   ],
                                   controller: _amountController2,
                                   validator: (value){
                                     if(value!.trim().isEmpty){
                                       return "Amount is Required";

                                     }
                                     return null;

                                   },
                                   onChanged: (value) {
                                     setState(() {

                                     });
                                   },
                                   decoration: InputDecoration(


                                       helperText: "",
                                       isDense: true,
                                       contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.0),
                                       )),
                                 ),
                               ),

                               Stack(

                                 children: [


                                   GestureDetector(
                                       onTap: () {
                                         isOpenUnit2 = !isOpenUnit2;
                                         setState(() {});
                                       },
                                       child: SingleChildScrollView(
                                         scrollDirection: Axis.vertical,
                                         child: Container(
                                           width: 150,
                                           height: 32,
                                           margin: const EdgeInsets.only(
                                             left: 20, top: 10, ),
                                           decoration: BoxDecoration(
                                               border: Border.all(
                                                   color: Colors.black38,
                                                   width: 1),
                                               borderRadius:
                                               BorderRadius.circular(10)),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 10),
                                             child: Row(
                                               mainAxisAlignment:
                                               MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Text(selectedOptionUnit2),
                                                 Icon(
                                                     isOpenUnit2
                                                         ? Icons.arrow_drop_up
                                                         : Icons.arrow_drop_down,
                                                     color: Colors.black),
                                               ],
                                             ),
                                           ),
                                         ),
                                       )),
                                   if (isOpenUnit2)
                                     Container(
                                       width: 150,
                                       height: 100,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           border: Border.all(
                                               color: Colors.black38, width: 1),
                                           borderRadius: BorderRadius.circular(5)),
                                       margin: const EdgeInsets.only(left: 20,top:40),
                                       child: ListView(
                                           scrollDirection: Axis.vertical,
                                           primary: true,
                                           shrinkWrap: true,
                                           children:
                                           optionsUnit //--------------------list
                                               .map((e) => Container(
                                             decoration: BoxDecoration(
                                                 borderRadius:
                                                 BorderRadius
                                                     .circular(5)),
                                             child: Padding(
                                               padding:
                                               const EdgeInsets
                                                   .all(2.0),
                                               child: GestureDetector(
                                                 onTap: () {
                                                   isOpenUnit2 =
                                                   false;
                                                   selectedOptionUnit2 =
                                                       e;
                                                   setState(() {});
                                                 },
                                                 child: HoverContainer(
                                                     height: 35,
                                                     decoration:
                                                     BoxDecoration(
                                                       color: Colors
                                                           .white,
                                                     ),
                                                     hoverDecoration:
                                                     BoxDecoration(
                                                       borderRadius:
                                                       BorderRadius
                                                           .circular(
                                                           5),
                                                       border: Border.all(
                                                           color: const Color(
                                                               0xFFFFA62B),
                                                           width: 1),
                                                     ),
                                                     child: Padding(
                                                       padding:
                                                       const EdgeInsets
                                                           .all(
                                                           2.0),
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
                               //amount field
                               Padding(
                                   padding: EdgeInsets.only(top: 10, left: 30),
                                   child: Container(
                                     width: 150,
                                     height: 32,


                                     child:   Padding(
                                         padding: EdgeInsets.only(
                                             left: 14,top:7
                                         ),
                                         child: Text(
                                           _currentDateNow,
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontSize: 14,
                                             fontWeight: FontWeight.w700,
                                           ),
                                         )),
                                     decoration: BoxDecoration(
                                         borderRadius:BorderRadius.circular(10),
                                         border:Border.all(color:Colors.grey,width: 1)
                                     ),
                                   )),

                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                 Form(
                   key:_materialFormKey,
                   autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                   child: Stack(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             margin:EdgeInsets.only(top:10,left:50),
                             width: 150,
                             child: TextFormField(
                               controller: _materialNameController,
                               decoration: InputDecoration(


                                   helperText: "",
                                   isDense: true,
                                   contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10.0),
                                   )),
                               onChanged: (value) {
                                 setState(() {

                                 });
                               },
                               validator: (value){
                                 if(value!.trim().isEmpty){
                                   return "Name is Required";

                                 }
                                 final RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
                                 if (!regex.hasMatch(value)) {
                                   return 'Invalid material name';
                                 }
                                 return null;

                               },

                             ),
                           ),
                           Container(
                             width: 150,
                             margin:EdgeInsets.only(top:10,left:30),
                             child: TextFormField(
                               inputFormatters: <TextInputFormatter>[
                                 FilteringTextInputFormatter.digitsOnly
                               ],
                               controller: _amountController,
                               validator: (value){
                                 if(value!.trim().isEmpty){
                                   return "Amount is Required";

                                 }
                                 return null;

                               },
                               onChanged: (value) {
                                 setState(() {

                                 });
                               },
                               decoration: InputDecoration(


                                   helperText: "",
                                   isDense: true,
                                   contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10.0),
                                   )),
                             ),
                           ),

                           Stack(

                             children: [


                               GestureDetector(
                                   onTap: () {
                                     isOpenUnit1 = !isOpenUnit1;
                                     setState(() {});
                                   },
                                   child: SingleChildScrollView(
                                     scrollDirection: Axis.vertical,
                                     child: Container(
                                       width: 150,
                                       height: 32,
                                       margin: const EdgeInsets.only(
                                         left: 20, top: 10, ),
                                       decoration: BoxDecoration(
                                           border: Border.all(
                                               color: Colors.black38,
                                               width: 1),
                                           borderRadius:
                                           BorderRadius.circular(10)),
                                       child: Padding(
                                         padding: const EdgeInsets.symmetric(
                                             horizontal: 10),
                                         child: Row(
                                           mainAxisAlignment:
                                           MainAxisAlignment.spaceBetween,
                                           children: [
                                             Text(selectedOptionUnit1),
                                             Icon(
                                                 isOpenUnit1
                                                     ? Icons.arrow_drop_up
                                                     : Icons.arrow_drop_down,
                                                 color: Colors.black),
                                           ],
                                         ),
                                       ),
                                     ),
                                   )),
                               if (isOpenUnit1)
                                 Container(
                                   width: 150,
                                   height: 100,
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       border: Border.all(
                                           color: Colors.black38, width: 1),
                                       borderRadius: BorderRadius.circular(5)),
                                   margin: const EdgeInsets.only(left: 20,top:40),
                                   child: ListView(
                                       scrollDirection: Axis.vertical,
                                       primary: true,
                                       shrinkWrap: true,
                                       children:
                                       optionsUnit //--------------------list
                                           .map((e) => Container(
                                         decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius
                                                 .circular(5)),
                                         child: Padding(
                                           padding:
                                           const EdgeInsets
                                               .all(2.0),
                                           child: GestureDetector(
                                             onTap: () {
                                               isOpenUnit1 =
                                               false;
                                               selectedOptionUnit1 =
                                                   e;
                                               setState(() {});
                                             },
                                             child: HoverContainer(
                                                 height: 35,
                                                 decoration:
                                                 BoxDecoration(
                                                   color: Colors
                                                       .white,
                                                 ),
                                                 hoverDecoration:
                                                 BoxDecoration(
                                                   borderRadius:
                                                   BorderRadius
                                                       .circular(
                                                       5),
                                                   border: Border.all(
                                                       color: const Color(
                                                           0xFFFFA62B),
                                                       width: 1),
                                                 ),
                                                 child: Padding(
                                                   padding:
                                                   const EdgeInsets
                                                       .all(
                                                       2.0),
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
                           //amount field
                           Padding(
                               padding: EdgeInsets.only(top: 10, left: 30),
                               child: Container(
                                 width: 150,
                                 height: 32,


                                 child:   Padding(
                                     padding: EdgeInsets.only(
                                         left: 14,top:7
                                     ),
                                     child: Text(
                                       _currentDateNow,
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 14,
                                         fontWeight: FontWeight.w700,
                                       ),
                                     )),
                                 decoration: BoxDecoration(
                                     borderRadius:BorderRadius.circular(10),
                                     border:Border.all(color:Colors.grey,width: 1)
                                 ),
                               )),

                         ],
                       ),
                     ],
                   ),
                 ),
               ],),



                //------------------------Form 2-------------------------//

                //------------------------Form 3--------------------------//






                //-----------------------form 5---------------------------------//



              ],
            ),







      //--------------------------------------------------------------//

      ],
    ),);}}





class uploadProfilePhotoAlertDialog extends StatefulWidget {
  const uploadProfilePhotoAlertDialog({super.key});

  @override
  State<uploadProfilePhotoAlertDialog> createState() => _uploadProfilePhotoAlertDialog();
}

class _uploadProfilePhotoAlertDialog extends State<uploadProfilePhotoAlertDialog> {
  //get file and insert in api
  var pickedProfilePhoto;
  @override
  Future getProfileImage()async{
    final _picker = ImagePicker();
    pickedProfilePhoto = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (pickedProfilePhoto != null) {
      setState(() {
        editprofilePhotoObject= pickedProfilePhoto.files.first;

      });
    }}
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
                    "Edit Your Profile Picture",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              //place image edit
              Padding(
                padding: const EdgeInsets.only(top:40),
                child: DottedBorder(
                  color: Colors.black,
                  dashPattern: [8, 4],
                  strokeWidth: 0.5,
                  child:Container(
                    width:500,height: 250,
                    child: pickedProfilePhoto!=null?Image.memory(pickedProfilePhoto.files.first.bytes,width: 500,height: 250,): IconButton(icon:Icon(Icons.add_photo_alternate_outlined,size: 50,),onPressed: () async {getProfileImage();},),),

                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 460),
                  child: Container(
                      width: 140,
                      height: 38,
                      child: ElevatedButton(
                          onPressed: () {
                            getProfileImage();
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
                              "Be a close-up of your Profile picture",
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
                  ])),
              Padding(
                  padding: const EdgeInsets.only(top: 60, left: 50),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 300),
                          child: SizedBox(
                              width: 140,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () async{
                                    Navigator.of(context).pop();
                                  },
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
                                  onPressed: () async{

                                    if(editprofilePhotoObject!=null){

                                      editprofilePhotoObject =  pickedProfilePhoto.files.first;
                                      String response;
                                      //   if(isEditMode!=true){
                                      response=await apiService.UpdateRetailerProfilePhoto(id.toString(),editprofilePhotoObject!,);
                                      if(response=="200"){

                                        // Navigator.of(context).pop();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RetailerViewProfile(currentUserEmail.toString())));

                                      }
                                    }
                                    else{
                                      print("Image is No Picked");
                                    }
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




class uploadCoverPhotoAlertDialog extends StatefulWidget {
  const uploadCoverPhotoAlertDialog({super.key});

  @override
  State<uploadCoverPhotoAlertDialog> createState() => _uploadCoverPhotoAlertDialog();
}

class _uploadCoverPhotoAlertDialog extends State<uploadCoverPhotoAlertDialog> {
  //get file and insert in api
  var pickedCoverPhoto;


  @override
  Future getProfileImage()async{
    final _picker = ImagePicker();
    pickedCoverPhoto = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (pickedCoverPhoto != null) {
      setState(() {
        editCoverPhotoObject= pickedCoverPhoto .files.first;

      });
    }}
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
                    "Edit Your Cover Picture",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              //place image edit
              Padding(
                padding: const EdgeInsets.only(top:40),
                child: DottedBorder(
                  color: Colors.black,
                  dashPattern: [8, 4],
                  strokeWidth: 0.5,
                  child:Container(
                    width:500,height: 250,
                    child: pickedCoverPhoto!=null?Image.memory(pickedCoverPhoto.files.first.bytes,width: 500,height: 250,): IconButton(icon:Icon(Icons.add_photo_alternate_outlined,size: 50,),onPressed: () async {getProfileImage();},),),

                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 460),
                  child: Container(
                      width: 140,
                      height: 38,
                      child: ElevatedButton(
                          onPressed: () {
                            getProfileImage();
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
                              "Be clear and crisp",
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
                  padding: const EdgeInsets.only(top: 60, left: 50),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 300),
                          child: SizedBox(
                              width: 140,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () async{
                                    Navigator.of(context).pop();
                                  },
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
                                  onPressed: () async{

                                    if(editCoverPhotoObject!=null){

                                      editCoverPhotoObject = pickedCoverPhoto.files.first;
                                      String response;

                                      response=await apiService.UpdateRetailerCoverPhoto(id.toString(),editCoverPhotoObject!,);
                                      if(response=="200"){

                                        // Navigator.of(context).pop();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RetailerViewProfile(currentUserEmail.toString())));

                                      }




                                    }
                                    else{
                                      print("Image is No Picked");
                                    }
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
class RateListDialog extends StatefulWidget {
  const RateListDialog({super.key});

  @override
  State<RateListDialog> createState() => _RateListDialog();
}

class _RateListDialog extends State<RateListDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
          width: 500,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 60, left: 180),
                  decoration: const BoxDecoration(
                    image:
                    DecorationImage(image: AssetImage("Logo/accept.png")),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 0, top: 40),
                  child: Center(
                      child: Text(
                        "Your Material Rates are Added Successfully!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),))),


              //-------------------------Add mobile no------------------//

              //--------------------------Buttons-------------------------//
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 60, left: 340),
                      child: Container(
                          width: 140,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>  RetailerViewProfile(currentUserEmail.toString())));
                              },
                              // ignore: sort_child_properties_last
                              child: Row(children: const <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 3),
                                    child: Center(
                                        child: Text(
                                          "Go Back to My Profile",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ))),
                              ]),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  backgroundColor: Color(0xFFFFA62B))))),
                ],
              ),
            ],
          )),
    );
  }
}


class mapAlertDialog extends StatefulWidget {
  const mapAlertDialog({super.key});

  @override
  State<mapAlertDialog > createState() =>
      _mapAlertDialog ();
}

class _mapAlertDialog  extends State<mapAlertDialog > {

  final _keyMap = GlobalKey<FormState>();
  final _addressController=TextEditingController();

  bool _autoValidate=false;
  static const checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left:10),
      child: StatefulBuilder(builder: (context, setState) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Container(
                  width: 550,

                  child: Form(
                    key: _keyMap,
                    autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          //  Form(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(top: 20, left:10),
                                  child: Text(
                                    "Add Store Location on Map",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),

                            ],
                          ),


                          Padding(
                              padding:
                              EdgeInsets.only(top: 20, left:10, bottom: 10),
                              child: Text(
                                "Enter your Store Address",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 0, left:10),
                              child: SizedBox(
                                  width: 500,

                                  child: TextFormField(
                                    // autovalidateMode:AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.name,
                                    controller: _addressController,
                                    decoration: InputDecoration(
                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 11),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        )),
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "Location is Required";
                                      }

                                      return null;
                                    },
                                  ))),
                                  Padding(
                                    padding: const EdgeInsets.only(left:10),
                                    child: MapScreen(),
                                  ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                const EdgeInsets.only(top: 120, left: 200),
                                child: Container(
                                    width: 140,
                                    height: 40,
                                    child: ElevatedButton(
                                        onPressed: () async {


                                          Navigator.of(context).pop();

                                        },
                                        // ignore: sort_child_properties_last
                                        child: Row(children: const <Widget>[
                                          Padding(
                                              padding:
                                              EdgeInsets.only(left: 30),
                                              child: Center(
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ))),
                                        ]),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor:
                                            Colors.grey.shade50)))),
                            Padding(
                                padding:
                                const EdgeInsets.only(top: 120, left: 20),
                                child: Container(
                                    width: 140,
                                    height: 40,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if( _keyMap.currentState!.validate()){
                                            var response=await apiService.updateStoreAddress(id.toString(), _addressController.text, latitude.toString(), longitude.toString());
                                            if(response=="200"){
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RetailerViewProfile(currentUserEmail.toString())));
                                            }

                                          }else{

                                            setState(() {

                                              _autoValidate=true;
                                            });


                                          }

                                        },
                                        // ignore: sort_child_properties_last
                                        child: Row(children: const <Widget>[
                                          Padding(
                                              padding:
                                              EdgeInsets.only(left: 30),
                                              child: Center(
                                                  child: Text(
                                                    "Submit",
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
                          ],)




                          // ignore: prefer_const_literals_to_create_immutables



                          // ignore: prefer_const_literals_to_create_immutables

                          //Back and Next Button--------------------------------------------------------------------------------------------
                        ]),
                  ))),
        );
      }),
    );
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
            width: 500,
            height:300,
            child:FlutterMap(
              options: MapOptions(
                center: LatLng(33.6844, 73.0479),
                zoom:_zoom,
                minZoom:5.0,
                maxZoom: 18.0,

                // Set the minimum zoom level



                onTap: (TapPosition tapPosition, LatLng latLng) {
                  setState(() {
                    _tapLocation = latLng;
                    latitude=_tapLocation!.latitude.toString();
                    longitude=_tapLocation!.longitude.toString();
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
                      point: _tapLocation ?? LatLng(33.6844, 73.0479),
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



class MyRates extends StatefulWidget {
  MyRates({super.key});
  @override
  State<MyRates> createState() => _MyRates();
}

class _MyRates extends State<MyRates> {
  List<MaterialRateModel> _getMaterialRate=[];
  String? _id;
  ApiService apiService = new ApiService();
  void initState() {
  apiService.getMaterialRate().then((value){
  setState(() {
  _getMaterialRate.addAll(value);
  for(int index=0;index<_getMaterialRate.length;index++)
    if (_getMaterialRate[index].email.toString()==currentUserEmail){
      _id=_getMaterialRate[index].sId.toString();

    }

  });
  });


  super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        width: 900,


        margin: const EdgeInsets.only(top: 20, bottom: 50),

    decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(10),
    border: Border.all(
    color: strokeColor)),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
          padding: EdgeInsets.only(
              left: 50,top:40
          ),
          child: Text(
            "My Material Rates",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          )),
      Padding(
          padding:_id==null? EdgeInsets.only(
              left: 50,top:20,bottom: 300,
          ):EdgeInsets.only(
            left: 50,top:20,
          ),
          child: Text(
            "Add new items and Also update material Prices amount to the market ",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w700,



            ),
          )),
      if(_id!=null)
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(
                    left: 50,top:40
                ),
                child: Text(
                  "Material Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(
                    left: 105,top:40
                ),
                child: Text(
                  "Amount",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(
                    left: 135,top:40
                ),
                child: Text(
                  "Unit",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(
                    left: 160,top:40
                ),
                child: Text(
                  "Date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ]),
    for(int index=0;index<_getMaterialRate.length;index++)
    if (_getMaterialRate[index].email.toString()==currentUserEmail)
      GestureDetector(
        onTap:(){
          print(_getMaterialRate[index].sId);
    },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 50),
              child: Container(
                width: 150,
                height: 32,


                child:   Padding(
                    padding: EdgeInsets.only(
                        left: 14,top:7
                    ),
                    child: Text(
                      _getMaterialRate[index].materialName.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    border:Border.all(color:Colors.grey,width: 1)
                ),
              )),
            //-----------AMount
            Padding(
                padding: EdgeInsets.only(top: 10, left: 30),
                child: Container(
                  width: 150,
                  height: 32,


                  child:   Padding(
                      padding: EdgeInsets.only(
                          left: 14,top:7
                      ),
                      child: Text(
                        _getMaterialRate[index].amount.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      border:Border.all(color:Colors.grey,width: 1)
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 30),
                child: Container(
                  width: 150,
                  height: 32,


                  child:   Padding(
                      padding: EdgeInsets.only(
                          left: 14,top:7
                      ),
                      child: Text(
                        _getMaterialRate[index].unit.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      border:Border.all(color:Colors.grey,width: 1)
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 30),
                child: Container(
                  width: 150,
                  height: 32,


                  child:   Padding(
                      padding: EdgeInsets.only(
                          left: 14,top:7
                      ),
                      child: Text(
                        _getMaterialRate[index].date.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      border:Border.all(color:Colors.grey,width: 1)
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(left:10,top:5,bottom: 00),
                  child: IconButton(onPressed: ()async{
                    var response=await apiService.deleteMaterialRates(_getMaterialRate[index].sId.toString());
                    if(response=='200'){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RetailerViewProfile(currentUserEmail.toString())));
                    }

                  }, icon: Container(
                    width:100,
                      height:100,

                      child: Icon(Icons.delete,color: Colors.red,),
                  decoration: BoxDecoration(
                      color:Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)),)
                  ),
                ),










          ],),
      ),
    SizedBox(height: 30,)

    ]));

  }}



