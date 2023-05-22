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

import 'package:intl/intl.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:typed_data';
import 'dart:html';
import 'dart:typed_data';

import '../../../models/AdminModel.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import '../Owner/Owner_Desire_Building.dart';



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

class AdminViewProfile extends StatefulWidget {
  String currentUserEmail;
  AdminViewProfile(this.currentUserEmail);


  @override
  State<AdminViewProfile> createState() => _AdminViewProfile();
}

class _AdminViewProfile extends State<AdminViewProfile> {
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();
  List<AdminProfileModel> _getAdminProfileData=[];





  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getAdminProfile().then((value){
      setState(() {
        _getAdminProfileData.addAll(value);
        for(int index=0;index<_getAdminProfileData.length;index++) {
          if (_getAdminProfileData[index].email.toString()==currentUserEmail) {

            id=_getAdminProfileData[index].sId.toString();

            firstName=_getAdminProfileData[index].firstName.toString();
            lastName=_getAdminProfileData[index].lastName.toString();
            city=_getAdminProfileData[index].city.toString();
            email=_getAdminProfileData[index].email.toString();
            phoneNo=_getAdminProfileData[index].phoneNo.toString();
            shopName=_getAdminProfileData[index].shopName.toString();
            country=_getAdminProfileData[index].country.toString();
            profilePhoto=_getAdminProfileData[index].profilePhoto.toString();
            coverPhoto=_getAdminProfileData[index].coverPhoto.toString();


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
                    AdminCoverProfile(),



                    Footer()
                  ],
                ))):Center(child: Padding(
          padding: const EdgeInsets.only(top:50),
          child: CircularProgressIndicator(),
        )));
  }
}




class  AdminCoverProfile extends StatefulWidget {
  AdminCoverProfile({super.key});
  @override
  State< AdminCoverProfile> createState() => _AdminCoverProfile();
}

class  _AdminCoverProfile extends State< AdminCoverProfile> {

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
                      child: Text("Admin",
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),

                  Padding(
                      padding: EdgeInsets.only(top: 5, left: 50,bottom: 10),
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
                                      response=await apiService.UpdateAdminProfilePhoto(id.toString(),editprofilePhotoObject!,);
                                      if(response=="200"){

                                        // Navigator.of(context).pop();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminViewProfile(currentUserEmail.toString())));

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

                                      response=await apiService.UpdateAdminCoverPhoto(id.toString(),editCoverPhotoObject!,);
                                      if(response=="200"){

                                        // Navigator.of(context).pop();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminViewProfile(currentUserEmail.toString())));

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













