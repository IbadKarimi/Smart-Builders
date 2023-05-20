import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/CurrentUser.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Preview_Profile.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Profile.dart';
import 'package:smart_builder_web/models/DataModels.dart';

import '../../../../../BuisnessLogic Layer/Api.dart';

import '../../../../../models/RetailerProfileModel.dart';
import '../../../Owner/Owner_Desire_Building.dart';
import '../../footer.dart';
import '../../header.dart';
import 'package:intl/intl.dart';
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

bool isEditMode=false;


PlatformFile? coverPhotoObject;

PlatformFile? editProfilePhotoObject;
PlatformFile?editCoverPhotoObject;

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


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 900,

        margin: const EdgeInsets.only(top: 50, bottom: 50),
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
                      padding: EdgeInsets.only(top: 5, left: 50,bottom: 40),
                      child: Text(city.toString()+" , "+"Punjab"+" , "+"Pakistan",
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),






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


class OverViewDialog extends StatefulWidget {
  const OverViewDialog({super.key});

  @override
  State<OverViewDialog> createState() => _OverViewDialog();
}

class _OverViewDialog extends State<OverViewDialog> {
  @override
  final _OwnerAboutFormKey = GlobalKey<FormState>();
  final _aboutController=TextEditingController();

  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
            width: 650,
            height: 600,
            child: Form(
              key:_OwnerAboutFormKey,
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
                                new TextFormField(
                                  controller:_aboutController,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.multiline,
                                  maxLength: 200,
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                    helperText: "",
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value){
                                    if(value!.trim().length>200){
                                      return "Length should be at least 200 lines ";
                                    }

                                  },
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
                                    onPressed: () async{
                                      if(_OwnerAboutFormKey.currentState!.validate()){
                                        var response=await apiService.InsertAbout(currentUserEmail.toString(),_aboutController.text);
                                        if(response=="200"){
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RetailerViewProfile(currentUserEmail.toString())));
                                        }
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
              ]),
            )
        ));
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
  @override

  final _materialNameController=TextEditingController();
  final _amountController=TextEditingController();


  final List<String> options = [
    'Sand',
    'Cement',
    'Concrete',
    'Bricks',
    'Steel',
  ];

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
        height: 900,

        margin: const EdgeInsets.only(top: 50, bottom: 50),

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
                              left: 200,top:40
                          ),
                          child: Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(
                              left: 260,top:40
                          ),
                          child: Text(
                            "Amount",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ]),
                //----------------------Fields-----------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:EdgeInsets.only(top:10,left:50),
                      width: 250,
                      child: TextFormField(
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

                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 30),
                        child: Container(
                          width: 250,
                          height: 32,


                          child:   Padding(
                              padding: EdgeInsets.only(
                                  left: 10,top:5
                              ),
                              child: Text(
                                "12-02-2023",
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

                    Container(
                      width: 250,
                      margin:EdgeInsets.only(top:10,left:30),
                      child: TextFormField(
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
                  ],
                ),


              ],
            ),



        Container(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _dataList.length,
                itemBuilder: (context, index) {

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                                    left: 50,top:15
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
                                    left: 200,top:15
                                ),
                                child: Text(
                                  "Date",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    left: 260,top:15
                                ),
                                child: Text(
                                  "Amount",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                          ]),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:EdgeInsets.only(top:10,left:50),
                            width: 250,
                            child: TextFormField(
                              decoration: InputDecoration(


                                  helperText: "",
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              onChanged: (value) {
                                setState(() {
                                  _dataList[index].material = value;
                                });
                              },

                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10, left: 30),
                              child: Container(
                                width: 250,
                                height: 32,


                                child:   Padding(
                                    padding: EdgeInsets.only(
                                        left: 10,top:8
                                    ),
                                    child: Text(
                                      "12-02-2023",
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

                          Container(
                            width: 250,
                            margin:EdgeInsets.only(top:10,left:30),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _dataList[index].amount = double.parse(value);
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
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),


      //--------------------------------------------------------------//
      GestureDetector(
        onTap: (){
          setState(() {
            _tapCount++;

          });
          if(_tapCount<5){
            _addFormField();
          }

    },
        child:  const Padding(
            padding: EdgeInsets.only(
                left: 50,top:20
            ),
            child: Text(
              "Add More Fields",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )),

      )
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

                                      response=await apiService.UpdateRetailerCoverPhoto('64690f901f7c36eef719d817',editCoverPhotoObject!,);
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






