
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hovering/hovering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Admin/AdminProfile.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/CurrentUser.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Preview_Profile.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Profile.dart';
import 'package:smart_builder_web/models/DataModels.dart';

import '../../../../../BuisnessLogic Layer/Api.dart';

import '../../../../../models/MaterialStoresModel.dart';
import '../../../../../models/RetailerProfileModel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:typed_data';
import 'dart:html';
import 'dart:typed_data';

import '../HomePage/MaterialStores/MaterialStoresImages/RetailerViewProfile.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';



const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
String? id;

String? firstName;
String? lastName;
String? city;
String email='ali@gmail.com';
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

class AdminMaterialRateList extends StatefulWidget {
  String currentUserEmail;
  AdminMaterialRateList (this.currentUserEmail);


  @override
  State<AdminMaterialRateList > createState() => _AdminMaterialRateList ();
}

class _AdminMaterialRateList  extends State<AdminMaterialRateList > {
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();
  List<RetailerProfileModel> _getRetailerProfileData=[];

  List<MaterialRateModel> _getMaterialRate=[];



  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());

    apiService.getMaterialRate().then((value){
      setState(() {
        _getMaterialRate.addAll(value);
        for(int index=0;index<_getMaterialRate.length;index++) {
          if (_getMaterialRate[index].email.toString()=='ali@gmail.com') {

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
        body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
        color: Colors.white,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
              Boxes(),
              AdminMaterialRates(),
              AdminMyRates(),
          Padding(
              padding: const EdgeInsets.only(top: 20, left: 720,bottom: 40),
              child: Container(
                  width: 140,
                  height: 35,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  AdminViewProfile("ali@gmail.com")));
                      },
                      // ignore: sort_child_properties_last
                      child: Row(children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Center(
                                child: Text(
                                  "Going Back to Profile ",
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

              Footer(),
    ],))));

  }}









class AdminMaterialRates extends StatefulWidget {
  AdminMaterialRates({super.key});
  @override
  State<AdminMaterialRates> createState() =>  _AdminMaterialRates();
}

class  _AdminMaterialRates extends State<AdminMaterialRates> {
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
                                      return AdminRateListDialog();
                                    });
                              }
                              if(_tapCount==1){
                                apiService.InsertMaterialRate(email.toString(), _materialNameController.text, _amountController.text, selectedOptionUnit1, _currentDateNow);

                                apiService.InsertMaterialRate(email.toString(), _materialNameController2.text, _amountController2.text, selectedOptionUnit2, _currentDateNow);

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AdminRateListDialog();
                                    });
                              }

                              if(_tapCount==2){
                                apiService.InsertMaterialRate(email.toString(), _materialNameController.text, _amountController.text, selectedOptionUnit1, _currentDateNow);

                                apiService.InsertMaterialRate(email.toString(), _materialNameController2.text, _amountController2.text, selectedOptionUnit2, _currentDateNow);

                                apiService.InsertMaterialRate(email.toString(), _materialNameController3.text, _amountController3.text, selectedOptionUnit3, _currentDateNow);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AdminRateListDialog();
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
                                      return AdminRateListDialog();
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
                                      return AdminRateListDialog();
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


class AdminMyRates extends StatefulWidget {
  AdminMyRates ({super.key});
  @override
  State<AdminMyRates > createState() => _AdminMyRates();
}

class _AdminMyRates extends State<AdminMyRates> {
  List<MaterialRateModel> _getMaterialRate=[];

  ApiService apiService = new ApiService();
  String? _id;
  void initState() {
    apiService.getMaterialRate().then((value){
      setState(() {
        _getMaterialRate.addAll(value);
        for(int index=0;index<_getMaterialRate.length;index++)
          if (_getMaterialRate[index].email.toString()=='ali@gmail.com'){
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
                            var response=await apiService.deleteMaterialRates(_id.toString());
                            if(response=='200'){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AdminMaterialRateList('ali@gmail.com')));
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



class AdminRateListDialog extends StatefulWidget {
  const AdminRateListDialog({super.key});

  @override
  State<AdminRateListDialog> createState() => _AdminRateListDialog();
}

class _AdminRateListDialog extends State<AdminRateListDialog> {
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
                                    builder: (context) =>  AdminMaterialRateList("ali@gmail.com")));
                              },
                              // ignore: sort_child_properties_last
                              child: Row(children: const <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 40),
                                    child: Center(
                                        child: Text(
                                          "Go Back ",
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
