import 'dart:html';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hovering/hovering.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';

import '../../../../../BuisnessLogic Layer/Api.dart';
import '../../../../../models/OwnerSignUpModel.dart';
import '../../../Owner/Owner_Preview_Profile.dart';
import '../../../Owner/Owner_SignUp.dart';
import '../../footer.dart';
import '../../header.dart';
import 'RetailerViewProfile.dart';


ApiService apiService = new ApiService();
const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

PlatformFile? cnicFile;
PlatformFile? profileFile;
bool isVisibleNtnNoField=false;



bool cnicError=false;
Uint8List defaultImageBytes=Uint8List(8);
late final String deFalultImageName;
final RegExp RegExpFirstName = RegExp(r'^[a-zA-Z]+$');
final RegExp RegExpLastName = RegExp(r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$');
final RegExp RegExpCity = RegExp(r'^[a-zA-Z ]+$');
final RegExp RegExpAddress = RegExp(r'^[a-zA-Z0-9\s\-\#.,]+$');
var responseApi;
String ?currentUserEmail;

class RetailerProfile extends StatefulWidget {
  final String email;
  RetailerProfile(this.email);

  @override
  State<RetailerProfile> createState() => _RetailerProfile();
}

class _RetailerProfile extends State<RetailerProfile> {
  @override



  Widget build(BuildContext context) {

    currentUserEmail = widget.email;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Boxes(),
                    RetailerProfileInterface(),
                    Footer(),
                  ],
                ))));
  }
}
String ?firstName;
String? lastName;
class RetailerProfileInterface extends StatefulWidget {

  const RetailerProfileInterface({super.key});

  @override
  State<RetailerProfileInterface> createState() => _RetailerProfileInterface();
}

class _RetailerProfileInterface extends State<RetailerProfileInterface> {
  bool _checkbox=false;

  var dropdownvalue;
  bool isOpenCountry = false;
  String selectedOptionCountry = "Pakistan";
  List<String> optionsCountry = ["Pakistan", 'China', 'Srilanka', 'India'];

  bool isOpenCity = false;
  String selectedOptionCity = "Islamabad";
  List<String> optionsCity = ["Islamabad", 'Rawalpindi'];
  //----------------form--------------------//
  final _OwnerProfileFormKey = GlobalKey<FormState>();
  final _firstNameController=TextEditingController();
  final _lastNameController=TextEditingController();


  final _occupationController=TextEditingController();
  final _countryController=TextEditingController();
  final _cityController=TextEditingController();
  final _zipPostalCodeController=TextEditingController();
  final _streetAddressController=TextEditingController();
  final _phoneNoController=TextEditingController();
  final _cnicNoController=TextEditingController();
  final _ntnNoController=TextEditingController();
  final _shopNameController=TextEditingController();

  String _textFormFieldValue="";
  List<OwnerSignUpModel> _getUserList=[];

  void initState() {
    apiService.getUserList().then((value){
      setState(() {
        _getUserList.addAll(value);
        for(int i=0;i< _getUserList.length;i++){
          if(_getUserList[i].email.toString()==currentUserEmail) {
            firstName = _getUserList[i].firstName;
            lastName = _getUserList[i].lastName;
            if(_firstNameController.text=="" || _firstNameController.text==""){

              _firstNameController.text=firstName.toString();
              _lastNameController.text=lastName.toString();

            }
            print(firstName.toString());
          }}//set data we get
      });

    });




    // Output: 2:30 PM
    //print('$hour:$minute');
    super.initState();
  }



  //------------------------------------------//
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _zipPostalCodeController.dispose();
    _streetAddressController.dispose();
    _phoneNoController.dispose();
    _cnicNoController.dispose();
    _ntnNoController.dispose();
    super.dispose();
  }
  bool progressBarVisible=false;
  bool _autoValidate=false;
  bool checkbox = false;

  String _selectedValue = "Rawalpindi";
  final cityItems = [
    'Rawalpindi',
    "Islamabad",

  ];
  @override
  Widget build(BuildContext context) {
    //  _firstNameController.text="Bilal";
    setState(() {
      print(_firstNameController.text);
    });

    DateTime now = DateTime.now();
    DateTime currentDate = DateTime.now();
    String _currentDateNow = DateFormat('dd-MM-yyy').format(currentDate);
    int hour = now.hour;
    int minute = now.minute;
    TimeOfDay time = TimeOfDay(hour: hour, minute:minute);
    String currentTimeNow=time.format(context);
    print(currentTimeNow);

    // List of items in our dropdown menu




    return  Form(
        autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
        key:_OwnerProfileFormKey,
        child:Container(
            margin: const EdgeInsets.only(top: 60, bottom: 40),
            width: 900,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF999999))),
            child: Column(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 40, right: 0),
                    child: Text(
                      "A few last details, then you can check and publish your profile ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(top: 40, right: 80),
                    child: Text(
                      '''
                  A professional photo helps you to build trust with your clients. To keep things safe   
                  and simple, they ‘ll pay  you through us- which is why we need your persona.
                  ''',
                      style: TextStyle(
                        color: Color(0xFF3D424A),
                        fontSize: 16,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 600,
                        margin: EdgeInsets.only(left: 50, top:10),

                        child: Column(

                          children: <Widget>[
                            Container(

                              margin: EdgeInsets.only(right: 0, bottom: 0),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF3D424A),
                                  borderRadius: BorderRadius.circular(100),
                                  image: const DecorationImage(
                                    image: AssetImage("Logo/Avatar.png"),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10, right: 0),
                                child: Container(
                                    width: 120,
                                    height: 26,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return uploadPhotoAlertDialog();
                                              });
                                        },
                                        // ignore: sort_child_properties_last
                                        child: Row(children: const <Widget>[
                                          Padding(
                                              padding:
                                              const EdgeInsets.only(left: 0),
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              )),
                                          Padding(
                                              padding:
                                              const EdgeInsets.only(left: 2),
                                              child: Text(
                                                "Upload Photo",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              )),
                                        ]),
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(30.0),
                                            ),
                                            backgroundColor: Color(0xFFFFA62B))))),




                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 100, top:10),
                      height: 300,
                      width: 1,
                      color: Colors.grey,
                    ),
                    //fields container firstname/lastname
                    //-----------------------------------------------Create form------------------------------//

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 20,top:10
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
                                     helperText: "",
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
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 20,top:0
                            ),
                            child: Text(
                              "Shop Name",
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
                                  controller:_shopNameController,

                                  decoration: InputDecoration(


                                      helperText: "",
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      )),
                                  validator: (value){

                                    if(value!.trim().isEmpty){
                                      return "Shop Name is Required";

                                    }



                                    return null;
                                  },
                                ))),
                        const Padding(
                            padding: EdgeInsets.only(
                              top: 0, left:20, ),
                            child: Text(
                              "Phone No",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 10,left:20),
                            child: SizedBox(
                                width: 250,

                                child: TextFormField(
                                  // autovalidateMode:AutovalidateMode.onUserInteraction,
                                  controller: _phoneNoController,
                                  decoration: InputDecoration(

                                      helperText: ' ',//not moving the content
                                      hintText: "03425949630",
                                      hintStyle: TextStyle(fontSize: 12),

                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      )),
                                  validator: (value){
                                    if(value!.trim().isEmpty){
                                      return "Phone No is Required";
                                    }
                                    if(value.length<11 ||value.length>11){
                                      return "Phone no must be 11 digit";
                                    }
                                    return null;
                                  },
                                ))),



                        const Padding(
                            padding:
                            EdgeInsets.only(left:20,top:0),
                            child: Text(
                              "Country",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [

                            Container(
                                width: 450,
                                margin: EdgeInsets.only(right: 0),
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.start,

                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 70,  left:20),
                                            child: Text(
                                              "City",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )),
                                        Stack(

                                          children: [


                                            GestureDetector(
                                                onTap: () {
                                                  isOpenCity = !isOpenCity;
                                                  setState(() {});
                                                },
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.vertical,
                                                  child: Container(
                                                    width: 250,
                                                    height: 37,
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
                                                          Text(selectedOptionCity),
                                                          Icon(
                                                              isOpenCity
                                                                  ? Icons.arrow_drop_up
                                                                  : Icons.arrow_drop_down,
                                                              color: Colors.black),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            if (isOpenCity)
                                              Container(
                                                width: 250,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.black38, width: 1),
                                                    borderRadius: BorderRadius.circular(5)),
                                                margin: const EdgeInsets.only(left: 20,top:45),
                                                child: ListView(
                                                    scrollDirection: Axis.vertical,
                                                    primary: true,
                                                    shrinkWrap: true,
                                                    children:
                                                    optionsCity //--------------------list
                                                        .map((e) => Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5)),
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(8.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            isOpenCity =
                                                            false;
                                                            selectedOptionCity =
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
                                                                    8.0),
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
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),

                                  ],
                                )),


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      isOpenCountry = !isOpenCountry;
                                      setState(() {});
                                    },
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        width: 250,
                                        height: 37,
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
                                              Text(selectedOptionCountry),
                                              Icon(
                                                  isOpenCountry
                                                      ? Icons.arrow_drop_up
                                                      : Icons.arrow_drop_down,
                                                  color: Colors.black),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                                if (isOpenCountry)
                                  Container(
                                    width: 250,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black38, width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    margin: const EdgeInsets.only(left: 20),
                                    child: ListView(
                                        scrollDirection: Axis.vertical,
                                        primary: true,
                                        shrinkWrap: true,
                                        children:
                                        optionsCountry //--------------------list
                                            .map((e) => Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(5)),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets
                                                .all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                isOpenCountry =
                                                false;
                                                selectedOptionCountry =
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
                                                        8.0),
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
                            //city and Zip cpde
                          ],
                        ),

                        //----------------------------------------------------------------------//ends

                        //Street Address

                        //Phone no



                        //checkbox
                      ],
                    ) //end of the fields//
                  ],
                ),
                //----------------------Form End----------------------------------//
                //------------------------- Starts Button------------------------//
                Row(
                  children: <Widget>[
                    Padding(
                        padding:
                        const EdgeInsets.only(bottom: 50, left: 40, top: 60),
                        child: SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => OwnerSignUp("")));
                                },
                                // ignore: sort_child_properties_last
                                child: const Text(
                                  "Back",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                )))),

                    Padding(
                        padding:
                        const EdgeInsets.only(left:200),
                        child:progressBarVisible!=true?Container():CircularProgressIndicator()),
                    Padding(
                        padding:
                        const EdgeInsets.only(bottom: 50, left: 190, top: 60),
                        child: Container(
                            width: 220,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if( _OwnerProfileFormKey.currentState!.validate()){

                                    if(profileFile!=null){
                                      var response=await apiService.createRetailerProfile(currentUserEmail.toString(), _firstNameController.text, _lastNameController.text, _shopNameController.text, selectedOptionCountry, selectedOptionCity, _phoneNoController.text, profileFile!);
                                      if(response=='200'){
                                        setState(() {
                                          progressBarVisible=false;
                                          debugPrint("Working Perfectly");
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => RetailerViewProfile(currentUserEmail.toString())),
                                        );
                                      }
                                      else{
                                        setState(() {
                                          progressBarVisible=true;
                                        });
                                      }


                                    }
                                    else{
                                      final ByteData data = await rootBundle.load('Logo/Avatar.png');
                                      var response=await apiService.RetailerProfileDefaultImage(currentUserEmail.toString(), _firstNameController.text, _lastNameController.text, _shopNameController.text, selectedOptionCountry, selectedOptionCity, _phoneNoController.text, data!);
                                      if(response=='200'){
                                        setState(() {
                                          progressBarVisible=false;
                                          debugPrint("Working Perfectly");
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => RetailerViewProfile(currentUserEmail.toString())),
                                        );
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
                                      child: Text(
                                        "Check Your,",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Profile",
                                        style: TextStyle(
                                            color: Color(0xFFFF9900), fontSize: 12),
                                      )),
                                ]),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    backgroundColor: const Color(0xFF363B42))))),
                  ],
                ),
              ],
            )));
  }
}

class uploadPhotoAlertDialog extends StatefulWidget {
  const uploadPhotoAlertDialog({super.key});

  @override
  State<uploadPhotoAlertDialog> createState() => _uploadPhotoAlertDialog();
}

class _uploadPhotoAlertDialog extends State<uploadPhotoAlertDialog> {


  var picked;
  @override
  Future getImage()async{
    final _picker = ImagePicker();
    picked = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    File   _imageFile;

    if (picked != null) {
      setState(() {
        profileFile = picked.files.first;
      });
    }

  }
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
            width: 650,
            height: 800,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  const Padding(
                      padding: EdgeInsets.only(top: 20, right: 440, bottom: 0),
                      child: Text(
                        "Edit Photo Cover",
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
                        child: picked!=null?Image.memory(picked.files.first.bytes,width: 500,height: 250,): IconButton(icon:Icon(Icons.add_photo_alternate_outlined,size: 50,),onPressed: () async {getImage();},),),

                    ),
                  ),

                  /* Container(
                  width: 500,
                  height: 250,
                  margin: const EdgeInsets.only(top: 60, left: 20),
                  decoration: BoxDecoration(
                // image: DecorationImage(image:picked!=null? AssetImage(file.toString()):AssetImage("HiringWorkersImages/HiringContractors.jpeg"),),
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
                  ),
              child:picked!=null?Image.memory(picked.files.first.bytes):Image.asset("HiringWorkersImages/HiringContractors.jpeg"),
              ),*/
                  //column
                  Padding(
                      padding: const EdgeInsets.only(top: 20, right: 460),
                      child: Container(
                          width: 140,
                          height: 38,
                          child: ElevatedButton(
                              onPressed: () async {
                                getImage();
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
                                        if(profileFile!=null){
                                          setState(() {
                                            profileFile = picked.files.first;

                                          });
                                          debugPrint( profileFile!.name);
                                          Navigator.of(context).pop();
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

class uploadCnicAlertDialog extends StatefulWidget {
  const uploadCnicAlertDialog({super.key});

  @override
  State<uploadCnicAlertDialog> createState() => _uploadCnicAlertDialog();
}

class _uploadCnicAlertDialog extends State<uploadCnicAlertDialog> {
  //get file and insert in api
  var pickedCnicPhoto;
  @override
  Future getImage()async{
    final _picker = ImagePicker();
    pickedCnicPhoto = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    File   _imageFile;

    if (pickedCnicPhoto != null) {
      setState(() {
        cnicFile = pickedCnicPhoto.files.first;

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
                    "Edit Your CNIC Picture",
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
                    child: pickedCnicPhoto!=null?Image.memory(pickedCnicPhoto.files.first.bytes,width: 500,height: 250,): IconButton(icon:Icon(Icons.add_photo_alternate_outlined,size: 50,),onPressed: () async {getImage();},),),

                ),
              ),
              /* Container(
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
                  )),*/
              //column
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 460),
                  child: Container(
                      width: 140,
                      height: 38,
                      child: ElevatedButton(
                          onPressed: () {
                            getImage();
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
                              "Be a close-up of your CNIC picture",
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
                                    if(cnicFile!=null){
                                      setState(() {
                                        cnicFile =  pickedCnicPhoto.files.first;
                                      });
                                      debugPrint( cnicFile!.name);
                                      Navigator.of(context).pop();

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
