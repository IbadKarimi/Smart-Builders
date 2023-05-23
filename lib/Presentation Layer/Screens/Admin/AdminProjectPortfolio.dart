

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Profile.dart';


import '../../../../../BuisnessLogic Layer/Api.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import '../Owner/Owner_Preview_Profile.dart';
import '../Owner/Owner_SignUp.dart';
import 'AdminProfile.dart';
import 'dart:html';

import 'package:dotted_border/dotted_border.dart';

import 'package:image_picker/image_picker.dart';
final RegExp RegExpFirstName = RegExp(r'^[a-zA-Z]+$');
final RegExp RegExpLastName = RegExp(r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$');
final RegExp RegExpCity = RegExp(r'^[a-zA-Z ]+$');
final RegExp RegExpAddress = RegExp(r'^[a-zA-Z0-9\s\-\#.,]+$');

PlatformFile? houseFile;
PlatformFile? profileFile;

class AdminProjectPortfolio extends StatefulWidget {
  String currentUserEmail;
  AdminProjectPortfolio (this.currentUserEmail);


  @override
  State<AdminProjectPortfolio > createState() => _AdminProjectPortfolio ();
}

class _AdminProjectPortfolio extends State<AdminProjectPortfolio> {


  @override
  Widget build(BuildContext context) {


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
                    AddProjectPortfolio(),


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


class AddProjectPortfolio extends StatefulWidget {
  AddProjectPortfolio  ({super.key});
  @override
  State< AddProjectPortfolio  > createState() => _AddProjectPortfolio  ();
}

class _AddProjectPortfolio   extends State< AddProjectPortfolio> {
  final _projectPortfolioFormKey = GlobalKey<FormState>();
  final _firstNameController=TextEditingController();
  final _lastNameController=TextEditingController();


  final _constructedByController=TextEditingController();
  final _plotLocationController=TextEditingController();
  final _cityController=TextEditingController();
  final _zipPostalCodeController=TextEditingController();
  final _streetAddressController=TextEditingController();
  final _phoneNoController=TextEditingController();
  final _cnicNoController=TextEditingController();
  final  _projectTitleController=TextEditingController();
  var picked;
  var pickedProfile;

  Future getImage()async{
    final _picker = ImagePicker();
    picked = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    File   _imageFile;

    if (picked != null) {
      setState(() {
        houseFile = picked.files.first;
      });
    }

  }


  Future getProfileImage()async{
    final _picker = ImagePicker();
    pickedProfile = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    File   _imageFile;

    if (pickedProfile!= null) {
      setState(() {
        profileFile = pickedProfile.files.first;
      });
    }

  }

  Widget build(BuildContext context) {
    bool progressBarVisible=false;
    bool _autoValidate=false;
    bool checkbox = false;


    return Container(
        width: 900,


        margin: const EdgeInsets.only(top: 20, bottom: 50),

        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.grey)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40,top:30),
                child:  Text(
                  "Project Portfolio",
                  style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40,top:30),
                child:  Text(
                  "Add House Photo",
                  style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40),
                child: Center(
                  child: DottedBorder(
                    color: Colors.black,
                    dashPattern: [8, 4],
                    strokeWidth: 0.5,
                    child:Container(
                      width:500,height: 250,
                      child: picked!=null?Image.memory(picked.files.first.bytes,width: 500,height: 250,): IconButton(icon:Icon(Icons.add_photo_alternate_outlined,size: 50,),onPressed: () async {getImage();},),),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40,top:30),
                child:  Text(
                  "Add Profile Photo",
                  style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40),
                child: Center(
                  child: DottedBorder(
                    color: Colors.black,
                    dashPattern: [8, 4],
                    strokeWidth: 0.5,
                    child:Container(
                      width:500,height: 250,
                      child: pickedProfile!=null?Image.memory(pickedProfile.files.first.bytes,width: 500,height: 250,): IconButton(icon:Icon(Icons.add_photo_alternate_outlined,size: 50,),onPressed: () async {getProfileImage();},),),

                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Form(
                autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                key:_projectPortfolioFormKey,
                child:Container(

                  margin: EdgeInsets.only(left:130),
                  child:Column(
                    children: <Widget>[

                      Row(
                          children: <Widget>[
                            Container(

                                margin: EdgeInsets.only(left: 50, bottom: 00),
                                child: Column(
                                  children: <Widget>[









                                    //fields container firstname/lastname
                                    //-----------------------------------------------Create form------------------------------//

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                left: 20,top:40
                                            ),
                                            child: Text(
                                              "First Name",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10, left: 20),
                                            child: SizedBox(
                                                width: 250,

                                                child:TextFormField(
                                                  // autovalidateMode:AutovalidateMode.onUserInteraction,
                                                  keyboardType: TextInputType.name,
                                                  controller:_firstNameController,

                                                  decoration: InputDecoration(


                                                      helperText: "",
                                                      isDense: true,
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      )),
                                                  validator: (value){

                                                    if(value!.trim().isEmpty){
                                                      return "First Name is Required";

                                                    }
                                                    if (!RegExpFirstName.hasMatch(value)) {
                                                      return 'Please enter a valid first name';
                                                    }


                                                    return null;
                                                  },
                                                ))),
                                        //last name
                                        const Padding(
                                            padding:
                                            EdgeInsets.only(left:20),
                                            child: Text(
                                              "Last Name",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )),

                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left:20),
                                            child: SizedBox(
                                                width: 250,

                                                child: TextFormField(
                                                  // autovalidateMode:AutovalidateMode.onUserInteraction,
                                                  controller: _lastNameController,
                                                  decoration: InputDecoration(

                                                    //not moving the content

                                                      isDense: true,
                                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),

                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      )),
                                                  validator: (value){
                                                    if(value!.trim().isEmpty){
                                                      return "Last Name is Required";
                                                    }
                                                    if (!RegExpLastName.hasMatch(value)) {
                                                      return 'Please enter a valid last name';
                                                    }
                                                    return null;
                                                  },
                                                ))),
                                        Padding(
                                            padding: EdgeInsets.only(top: 20, left: 20, bottom: 0),
                                            child: Text(
                                              "Project Title",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10, left: 20),
                                            child: SizedBox(
                                                width: 250,
                                                child:TextFormField(
                                                  // autovalidateMode:AutovalidateMode.onUserInteraction,
                                                  keyboardType: TextInputType.name,
                                                  controller: _projectTitleController,

                                                  decoration: InputDecoration(


                                                      helperText: "",
                                                      isDense: true,
                                                      contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      )),
                                                  validator: (value){

                                                    if(value!.trim().isEmpty){
                                                      return "Project title is Required";

                                                    }
                                                  },
                                                ))),
                                        const Padding(
                                            padding:
                                            EdgeInsets.only(top: 0, left: 20, bottom: 0),
                                            child: Text(
                                              "Constructed By",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),


                                        Padding(
                                            padding: EdgeInsets.only(top: 10, left: 20),
                                            child: SizedBox(
                                                width: 250,

                                                child: TextFormField(
                                                  // autovalidateMode:AutovalidateMode.onUserInteraction,
                                                  controller: _constructedByController,
                                                  decoration: InputDecoration(

                                                    //not moving the content
                                                      helperText: "",
                                                      isDense: true,
                                                      contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      )),
                                                  validator: (value){
                                                    if(value!.trim().isEmpty){
                                                      return "Name is Required";
                                                    }


                                                    return null;
                                                  },
                                                ))),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 0,  left:20),
                                            child: Text(
                                              "City",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10, left: 20),
                                            child: SizedBox(
                                                width: 250,

                                                child:  TextFormField(
                                                  // autovalidateMode:AutovalidateMode.onUserInteraction,
                                                  controller: _cityController,
                                                  decoration: InputDecoration(

                                                      helperText: ' ',//not moving the content

                                                      isDense: true,
                                                      contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      )),
                                                  validator: (value){
                                                    if(value!.trim().isEmpty){
                                                      return "City is Required";
                                                    }
                                                    if (!RegExpCity.hasMatch(value)) {
                                                      return 'Please enter a valid city name';
                                                    }
                                                    return null;
                                                  },
                                                ))),
                                        const Padding(
                                            padding:
                                            EdgeInsets.only(top: 0, left: 20, bottom: 0),
                                            child: Text(
                                              "Plot Location",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10, left: 20),
                                            child: SizedBox(
                                                width: 250,
                                                child:TextFormField(
                                                  // autovalidateMode:AutovalidateMode.onUserInteraction,
                                                  keyboardType: TextInputType.name,
                                                  controller:_plotLocationController,

                                                  decoration: InputDecoration(


                                                      helperText: "",
                                                      isDense: true,
                                                      contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      )),
                                                  validator: (value){

                                                    if(value!.trim().isEmpty){
                                                      return "Plot location is Required";

                                                    }




                                                    return null;
                                                  },
                                                ))),








                                      ],
                                    ) //end of the fields//
                                  ],
                                )),
                            //----------------------Form End----------------------------------//
                            //------------------------- Starts Button------------------------//



                          ]),
                      Padding(
                          padding:
                          const EdgeInsets.only(left:430,top:0),
                          child:progressBarVisible!=true?Container():CircularProgressIndicator()),
                      Padding(
                          padding:
                          const EdgeInsets.only(bottom: 40, left: 420, top: 0),
                          child: Container(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () async {

                                    if( _projectPortfolioFormKey.currentState!.validate()){

                                      if(houseFile!=null){
                                        houseFile = picked.files.first;
                                        profileFile=pickedProfile.files.first;
                                        print( houseFile?.name.toString());
                                        var response=await apiService.InsertProjectPortfolio('ali@gmail.com', _firstNameController.text, _lastNameController.text, _cityController.text, "Pakistan", _streetAddressController.text, _projectTitleController.text, _constructedByController.text, houseFile!,profileFile!);
                                        if(response=='200'){
                                          setState(() {
                                            progressBarVisible=false;
                                            debugPrint("Working Perfectly");
                                          });
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>AdminProjectPortfolio("ali@gmail.com")),
                                          );
                                        }
                                        else{
                                          setState(() {
                                            progressBarVisible=true;
                                          });
                                        }
                                      }

                                    }

                                    else{
                                      setState(() {
                                        cnicError=true;
                                        _autoValidate=true;
                                      });

                                    }
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Row(children: const <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.only(left: 40),
                                        child: Center(
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.orange, fontSize: 12),
                                          ),
                                        )),

                                  ]),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      backgroundColor: const Color(0xFF363B42))))),
                    ],
                  ),

                ),
              )


  ]));












           }}

