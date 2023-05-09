import 'dart:html';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hovering/hovering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_View_Requested_Proposals.dart';

import '../../../BuisnessLogic Layer/Api.dart';
import '../HomePage/HiringProfessionals/Contractors.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import '../Professionals/ProCommonPages/Pro_View_Profile.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'Owner_View_Profile.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
final RegExp RegExpProjectTitle = RegExp(r'^[a-zA-Z]+$');
String pattern = r'(^[0-9]{100}$)';
RegExp regExpInteger = RegExp(pattern);
String _pattern = r'(^\d{1,10}(\.\d{1,2})?$)';
RegExp _regExp = RegExp(pattern);
bool validateInteger(String value) {


  if (value.isEmpty) {
    return false;
  }
  return true;
}

String? firstName;
String? lastName;
String? city;
String? country;
String? profilePhotoUrl;
PlatformFile? attachFile;
ApiService apiService = new ApiService();
String? serviceProviderTitle;
String? currentUserEmail;
class ProposalServiceProvider extends StatefulWidget {
  String _email;
  String _serviceProviderTitle;
  String firstName,lastName,city,country,profilePhotoUrl;
  ProposalServiceProvider(this._email,this._serviceProviderTitle,this.firstName,this.lastName,this.city,this.country,this.profilePhotoUrl);

  @override
  State<ProposalServiceProvider> createState() => _ProposalServiceProvider();
}

class _ProposalServiceProvider extends State<ProposalServiceProvider> {
  @override
  Widget build(BuildContext context) {
    firstName=widget.firstName;
    lastName=widget.lastName;
    city=widget.city;
    country=widget.country;
    profilePhotoUrl=widget.profilePhotoUrl;
    setState(() {
      serviceProviderTitle=widget._serviceProviderTitle;
      currentUserEmail=widget._email;
    });
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Boxes(),
                    ProposalServiceProviderI(),
                    Footer(),
                  ],
                ))));
  }
}

class ProposalServiceProviderI extends StatefulWidget {
  const ProposalServiceProviderI({super.key});

  @override
  State<ProposalServiceProviderI> createState() => _ProposalServiceProviderI();
}

class _ProposalServiceProviderI extends State<ProposalServiceProviderI> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  @override
  _ProposalServiceProviderI() {
    // defauslt value set in constructor
    _selectedValue = cityItems[0];
  }
  String? _months;
  String? _groundFloor;
  String? _projectType;
  String city = "Rawalpindi";
  String? floors;
  String _selectedValue = "Rawalpindi";
  final cityItems = [
    'Rawalpindi',
    "Islamabad",
    'Lahore',
    'Karachi',
  ];

  final _OwnerSubmitProposalsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _autoValidate=false;
  final _projectTitleController=TextEditingController();
  final _projectTypeController=TextEditingController();
  final _projectBudgetController=TextEditingController();
  final _plotLengthRightSideController=TextEditingController();
  final _plotLengthLeftSideController=TextEditingController();
  final _plotWidthFrontSideController=TextEditingController();
  final _plotWidthBackSideController=TextEditingController();
  final _actualPlotSizeController=TextEditingController();
  final _plotLocationController=TextEditingController();
  final _floorsController=TextEditingController();
  final _describeYourProjectController=TextEditingController();


  //-----------------------------------------------------------------//






  Widget build(BuildContext context) {

    TextEditingController _controller = TextEditingController(text: '$_counter');


    DateTime now = DateTime.now();
    DateTime currentDate = DateTime.now();
    String _currentDateNow = DateFormat('dd-MM-yyy').format(currentDate);
    int hour = now.hour;
    int minute = now.minute;
    TimeOfDay time = TimeOfDay(hour: hour, minute:minute);
    String _currentTimeNow=time.format(context);
    print(_currentTimeNow);
    const checkbox = false;
    return Form(
      autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
      key:_OwnerSubmitProposalsFormKey,
      child: Column(

        children: [
          Container(
              margin: EdgeInsets.only(top: 60, bottom: 10),
              width: 900,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF999999))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                      padding: EdgeInsets.only(top: 50, left: 80, bottom: 0),
                      child: Text(
                        "Add Details , write the proper requirement to hire a Professional for your project",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                   Padding(
                      padding: EdgeInsets.only(top: 50, left: 60, bottom: 0),
                      child: Text(
                        "Project Title",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 60),
                      child:  SizedBox(
                          width:400,

                          child:TextFormField(
                            // autovalidateMode:AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            controller: _projectTitleController,

                            decoration: InputDecoration(


                                helperText: "",
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            validator: (value){

                              if(value!.trim().isEmpty){
                                return "Project title is Required";

                              }
                            },
                          ))),

                  const Padding(
                      padding: EdgeInsets.only(top: 0, left: 60, bottom: 0),
                      child: Text(
                        "Project Type",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  FormField(
                    builder: (FormFieldState<bool> state) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                        state.hasError
                            ? Padding(
                              padding: const EdgeInsets.only(left:60,top:4),
                              child: Text(
                          state.errorText.toString(),
                          style: TextStyle(color: Colors.red,fontSize: 12),
                        ),
                            )
                            : Container(),
                              Padding(
                                padding: const EdgeInsets.only(left:30),
                                child: RadioListTile(
                                  title: Text("Residential"),
                                  value: "Residential",
                                  groupValue: _projectType,
                                  onChanged: (value) {
                                    state.setValue(true);
                                    setState(() {
                                      _projectType = value.toString();

                                    });
                                  },
                                ),
                              ),

                      ],
                      ));
                    },
                    validator: (value) {
                      if (value != true) {
                        return 'Project type is required';
                      }
                      return null;
                    },
                  ),


                  /*Padding(
                    padding:const EdgeInsets.only(top:0,left:60,bottom: 4),
                    child:projectTypeError==true?  Text("Project type is Required",style:TextStyle(fontSize: 12,color:Colors.red)):Text(""),
                  ),*/
                  const Padding(
                      padding: EdgeInsets.only(top: 0, left: 60, bottom: 0),
                      child: Text(
                        "How long will your work take",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  FormField(
                    builder: (FormFieldState<bool> state) {
                      return Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              state.hasError
                                  ? Padding(
                                padding: const EdgeInsets.only(left:60,top:4),
                                child: Text(
                                  state.errorText.toString(),
                                  style: TextStyle(color: Colors.red,fontSize: 12),
                                ),
                              )
                                  : Container(),
                              Padding(
                                padding: const EdgeInsets.only(left:30),
                                child:  RadioListTile(
                                  title: Text("1 to 3 months"),
                                  value: "1 to 3 months",
                                  groupValue: _months,
                                  onChanged: (value) {
                                    state.setValue(true);
                                    setState(() {
                                      _months = value.toString();
                                    });
                                  },
                                ),),
                              Padding(
                                  padding: const EdgeInsets.only(left:30),
                                  child:RadioListTile(
                                  title: Text("3 to 6 months"),
                                  value: "3 to 6 months",
                                  groupValue: _months,
                                  onChanged: (value) {
                                    state.setValue(true);
                                    setState(() {
                                      _months = value.toString();
                                    });
                                  },
                                )),
                                 Padding(
                                  padding: const EdgeInsets.only(left:30),
                                   child:RadioListTile(
                                  title: Text("more than 6 months"),
                                  value: "more than 6 months",
                                  groupValue: _months,
                                  onChanged: (value) {
                                    state.setValue(true);
                                    setState(() {
                                      _months = value.toString();
                                    });
                                  },
                                )),


                            ],
                          ));
                    },
                    validator: (value) {
                      if (value != true) {
                        return 'Work months are required';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                      ],
                    ),
                  ),

                  //-----------------------------Project Budget-----------------//
                  const Padding(
                      padding: EdgeInsets.only(top: 20, left: 60, bottom: 0),
                      child: Text(
                        "Project Budget",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 60, bottom: 30),
                      child:SizedBox(
                          width:400,

                          child:TextFormField(
                            // autovalidateMode:AutovalidateMode.onUserInteraction,

                            controller: _projectBudgetController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(

                                hintText: "100-1000000 Rs",
                                helperText: "",
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            validator: (value){

                              if(value!.trim().isEmpty){
                                return "Project budget is Required";

                              }





                              return null;
                            },
                          ))),

                  //----------------Review and Submit--------------//
                ],
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 900,
                  margin: EdgeInsets.only(top: 10, left: 00, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF999999), width: 1)),
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 40, left: 50, bottom: 0),
                        child: Text(
                          "Add a accurate plot size and locations",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(top: 60, left: 60, bottom: 0),
                            child: Text(
                              "Enter Plot Front Side Width",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 60, left: 210, bottom: 0),
                            child: Text(
                              "Enter Plot Back Side Width",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Stack(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10,left:60 ),
                              child: SizedBox(
                                  width:250,
                                  child:TextFormField(
                                    // autovalidateMode:AutovalidateMode.onUserInteraction,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller:_plotWidthFrontSideController,

                                    decoration: InputDecoration(


                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        )),
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "Plot front side width is Required";

                                      }

                                      if (!validateInteger(value)) {
                                        return 'Only digits allow ';
                                      }


                                      return null;
                                    },
                                  ))),
                          Container(
                            margin: const EdgeInsets.only(left: 269,top:10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFFFA62B),
                            ),
                            child: Container(
                                width: 40,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                                child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 10, bottom: 0),
                                    child: Text(
                                      "ft",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))),
                          )
                        ],
                      ),
                      //---------------------Second Field
                      Stack(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10,left:150 ),
                              child: SizedBox(
                                  width:250,

                                  child:TextFormField(
                                    // autovalidateMode:AutovalidateMode.onUserInteraction,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller:_plotWidthBackSideController,

                                    decoration: InputDecoration(


                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        )),
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "Plot back side width is Required";

                                      }

                                      if (!validateInteger(value)) {
                                        return 'Only digits allow ';
                                      }


                                      return null;
                                    },
                                  ))),
                          Container(
                            margin: const EdgeInsets.only(left: 359,top:10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFFFA62B),
                            ),
                            child: Container(
                                width: 40,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                                child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 10, bottom: 0),
                                    child: Text(
                                      "ft",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))),
                          )
                        ],
                      ),
                    ]),
                    //---------------------------------------------------------Second Row of right left length
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(top: 0, left: 60, bottom: 0),
                            child: Text(
                              "Enter Plot Left Side Length",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 0, left: 210, bottom: 0),
                            child: Text(
                              "Enter Plot Right Side Length",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Stack(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10,left:60 ),
                              child: SizedBox(
                                  width:250,

                                  child:TextFormField(
                                    // autovalidateMode:AutovalidateMode.onUserInteraction,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller:_plotLengthLeftSideController,

                                    decoration: InputDecoration(


                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        )),
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "Plot left side length is Required";

                                      }

                                      if (!validateInteger(value)) {
                                        return 'Only digits allow ';
                                      }


                                      return null;
                                    },
                                  ))),
                          Container(
                            margin: const EdgeInsets.only(left: 269,top:10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFFFA62B),
                            ),
                            child: Container(
                                width: 40,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                                child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 10, bottom: 0),
                                    child: Text(
                                      "ft",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))),
                          )
                        ],
                      ),
                      //---------------------Second Field
                      Stack(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10,left:150 ),
                              child: SizedBox(
                                  width:250,

                                  child:TextFormField(
                                    // autovalidateMode:AutovalidateMode.onUserInteraction,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.name,
                                    controller:_plotLengthRightSideController,

                                    decoration: InputDecoration(


                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        )),
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "Plot right side length is Required";

                                      }

                                      if (!validateInteger(value)) {
                                        return 'Only digits allow ';
                                      }


                                      return null;
                                    },
                                  ))),
                          Container(
                            margin: const EdgeInsets.only(left: 359,top:10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFFFA62B),
                            ),
                            child: Container(
                                width: 40,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                                child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 10, bottom: 0),
                                    child: Text(
                                      "ft",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))),
                          )
                        ],
                      ),
                    ]),
                    //------------------Total Plot Size----------------//
                    const Padding(
                        padding: EdgeInsets.only(top: 0, left: 60, bottom: 0),
                        child: Text(
                          "Enter Actual Plot Size",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),


                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Stack(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10,left:60 ),
                              child: SizedBox(
                                  width:250,

                                  child:TextFormField(
                                    // autovalidateMode:AutovalidateMode.onUserInteraction,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller:_actualPlotSizeController,

                                    decoration: InputDecoration(


                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        )),
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "Actual plot size is Required";

                                      }

                                      if (!validateInteger(value)) {
                                        return 'Only digits allow ';
                                      }


                                      return null;
                                    },
                                  ))),
                          Container(
                            margin: const EdgeInsets.only(left: 269,top:10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFFFA62B),
                            ),
                            child: Container(
                                width: 40,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                                child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 10, bottom: 0),
                                    child: Text(
                                      "ft",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))),
                          )
                        ],
                      ),

                    ]),
                    const Padding(
                        padding:
                        EdgeInsets.only(top: 10, left: 50, bottom: 0),
                        child: Text(
                          "How many floors you want to build ?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),


                    Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 10,left:60 ),
                            child: SizedBox(
                                width:150,

                                child:TextFormField(
                                  onTap: () {
                                    // Move cursor to the end of the text field
                                    _controller.selection = TextSelection.fromPosition(
                                        TextPosition(offset: _controller.text.length)
                                    );
                                  },
                                  // autovalidateMode:AutovalidateMode.onUserInteraction,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller:_controller,

                                  decoration: InputDecoration(


                                      helperText: "",
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 18.0,horizontal: 11),


                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      )),
                                  onChanged: (value) {
                                    setState(() {
                                      _counter = int.parse(value);
                                    });
                                  },
                                  validator: (value){

                                    if(value!.trim().isEmpty){
                                      return "Field is Required";

                                    }

                                    return null;
                                  },
                                ))),
                        Container(
                          margin: const EdgeInsets.only(left: 169,top:11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),

                          ),
                          child: Container(
                              width: 40,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child:  Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, left: 5, bottom: 0),
                                      child: GestureDetector(
                                          onTap:(){
                                            setState(() {
                                              _counter++;
                                            });
                                          },

                                          child:Text(
                                            "+",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ))),

                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, left: 5, bottom: 0),
                                      child: GestureDetector(
                                          onTap:(){
                                          setState(() {
                                            if(_counter>=1){
                                              _counter--;
                                            }

                                          });
                                          },
                                          child:Text("_",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ))),
                                  //------------------------Ground floor-----------------//

                                ],
                              )),
                        )
                      ],
                    ),
                    FormField(
                      builder: (FormFieldState<bool> state) {
                        return Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                state.hasError
                                    ? Padding(
                                  padding: const EdgeInsets.only(left:60,top:4),
                                  child: Text(
                                    state.errorText.toString(),
                                    style: TextStyle(color: Colors.red,fontSize: 12),
                                  ),
                                )
                                    : Container(),
                                Padding(
                                  padding: const EdgeInsets.only(left:30),
                                  child:  RadioListTile(
                                    title: Text("With ground floor ?"),
                                    value: "With ground floor",
                                    groupValue: _groundFloor,
                                    onChanged: (value) {
                                      state.setValue(true);
                                      _counter=_counter+1;
                                      setState(() {
                                        _groundFloor = value.toString();
                                      });
                                    },
                                  ),),
                                Padding(
                                    padding: const EdgeInsets.only(left:30),
                                    child:RadioListTile(
                                      title: Text("Without ground floor ?"),
                                      value: "Without ground floor",
                                      groupValue: _groundFloor,
                                      onChanged: (value) {
                                        state.setValue(true);
                                        if(_groundFloor=="With ground floor"){
                                          _counter=_counter-1;
                                        }

                                        setState(() {
                                          _groundFloor = value.toString();
                                        });
                                      },
                                    )),



                              ],
                            ));
                      },
                      validator: (value) {
                        if (value != true) {
                          return 'Work months are required';
                        }
                        return null;
                      },
                    ),
                    //-------------------Location
                    const Padding(
                        padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                        child: Text(
                          "Select Location:",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding:
                                  EdgeInsets.only(top: 10, left: 50, bottom: 0),
                                  child: Text(
                                    "City",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                              Container(
                                  width: 150,
                                  height: 38,
                                  margin: const EdgeInsets.only(left: 50, top: 10),
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(0),
                                      boxShadow: <BoxShadow>[]),
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField(
                                        value: _selectedValue,
                                        items: cityItems.map((e) {
                                          return DropdownMenuItem(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 0, left: 10),
                                                child: Text(
                                                  e,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                              ),
                                              value: e);
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedValue = newValue as String;
                                          });
                                        },
                                        isExpanded: true,
                                      ))),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding:
                                  EdgeInsets.only(top: 10, left: 140, bottom: 0),
                                  child: Text(
                                    "Plot Location",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(top: 10, left: 140),
                                  child:SizedBox(
                                      width:250,

                                      child:TextFormField(
                                        // autovalidateMode:AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.name,
                                        controller:_plotLocationController,

                                        decoration: InputDecoration(


                                            helperText: "",
                                            isDense: true,
                                            contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),


                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                            )),
                                        validator: (value){

                                          if(value!.trim().isEmpty){
                                            return "Plot location is Required";

                                          }




                                          return null;
                                        },
                                      ))),
                            ],
                          )
                        ],
                      ),
                    ),


                  ]),
                ),
              ),
            ],
          ),
          //----------------------Describe your Project ------------------------//
          Container(
              margin: const EdgeInsets.only(top: 10, bottom: 50),
              width: 900,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF999999))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Padding(
                    padding: EdgeInsets.only(top: 30, left: 50, bottom: 0),
                    child: Text(
                      "Describe your Project",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                    child: Text(
                      '''
This is how Professional figures out what you need and why you’re great to work with!
Include your expectations about the task or deliverable, what you’re looking for in a work 
relationship, and anything unique about your project, team, or company. ''',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Container(

                    width: 600,

                    margin: EdgeInsets.only(top: 20, left: 50, bottom: 10),
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: <Widget>[
                          new TextFormField(
                            controller: _describeYourProjectController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 11.0,horizontal: 11),

                            ),
                            validator: (value){
                              if(value!.trim().isEmpty){
                                return "Field is required";
                              }
                              return null ;
                            },
                          ),

                        ])),
                //---------------------Button-----------------//
                Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 20, left: 50),
                        child: Container(
                            width: 140,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(width: 1, color: Colors.grey)),
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return uploadAtachFileAlertDialog();
                                      });
                                },
                                // ignore: sort_child_properties_last
                                child: Row(children: <Widget>[
                                  Icon(
                                    Icons.attach_file,
                                    color: Color(0xFFFFA62B),
                                    size: 20,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 3),
                                      child: Center(
                                          child: Text(
                                            "Attach File",
                                            style: TextStyle(
                                                fontSize: 14, color: Color(0xFFFFA62B)),
                                          ))),
                                ]),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    backgroundColor: Colors.white)))),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 10, left: 55, bottom: 20),
                    child: Text(
                      "Max file size: 100 MB",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                //----------------Review and Submit--------------//
                Row(
                  children: <Widget>[
                    Padding(
                        padding:
                        const EdgeInsets.only(top: 10, left: 550, bottom: 30),
                        child: SizedBox(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const ContractorsMain()));
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
                        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 30),
                        child: Container(
                            width: 140,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: ()async {
                                  if(_OwnerSubmitProposalsFormKey.currentState!.validate()){

                                       if(attachFile!=null){  var response=await apiService.InsertOwnerSubmitProposals(firstName.toString(),lastName.toString(),city.toString(),country.toString(),profilePhotoUrl.toString(),currentUserEmail.toString(), serviceProviderTitle.toString(), _projectTitleController.text, _projectType.toString(),
                                           _months.toString(),_projectBudgetController.text, _plotWidthFrontSideController.text, _plotWidthBackSideController.text, _plotLengthLeftSideController.text,
                                           _plotLengthRightSideController.text, _actualPlotSizeController.text, _counter.toString(),_groundFloor.toString(), _selectedValue.toString(),_plotLocationController.text, _describeYourProjectController.text,
                                           attachFile!, _currentTimeNow, _currentDateNow);
                                       if(response=="200"){
                                         Navigator.of(context).push(MaterialPageRoute(
                                             builder: (context) => OfferSentShowDialog()));
                                       }}else{
                                         var response=await apiService.InsertOwnerSubmitProposals_(firstName.toString(),lastName.toString(),city.toString(),country.toString(),profilePhotoUrl.toString(),currentUserEmail.toString(), serviceProviderTitle.toString(), _projectTitleController.text, _projectType.toString(),
                                             _months.toString(),_projectBudgetController.text, _plotWidthFrontSideController.text, _plotWidthBackSideController.text, _plotLengthLeftSideController.text,
                                             _plotLengthRightSideController.text, _actualPlotSizeController.text, _counter.toString(),_groundFloor.toString(), _selectedValue.toString(),_plotLocationController.text,
                                             _describeYourProjectController.text,
                                              _currentTimeNow, _currentDateNow);
                                         if(response=="200"){
                                           Navigator.of(context).push(MaterialPageRoute(
                                               builder: (context) => OfferSentShowDialog()));
                                         }
                                       }


                                  }else{
                                    setState(() {
                                      _autoValidate=true;

                                    });
                                  }

                                  /*   showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return OfferSentShowDialog();
                                });*/
                                },
                                // ignore: sort_child_properties_last
                                child: Row(children: const <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Center(
                                          child: Text(
                                            "Review & Submit",
                                            style: TextStyle(
                                              fontSize: 12,
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
              ])),
        ],
      ),
    );
  }
}










class OfferSentShowDialog extends StatefulWidget {
  const OfferSentShowDialog({super.key});

  @override
  State<OfferSentShowDialog> createState() => _OfferSentShowDialog();
}

class _OfferSentShowDialog extends State<OfferSentShowDialog> {
  @override
  Widget build(BuildContext context) {
    String addNo = '+92';

    // List of items in our dropdown menu
    var addNoItems = [
      '+92',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
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
                    "Offer sent to Contractors that in your city!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ))),
              const Padding(
                  padding: EdgeInsets.only(left: 0, top: 10),
                  child: Center(
                      child: Text(
                    "We will notify you When Ibad karimi Responds to your offer ",
                    style: TextStyle(
                      color: Color(0xFFFFA62B),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ))),

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
                                    builder: (context) =>  OwnerViewProfile(currentUserEmail.toString())));
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



class uploadAtachFileAlertDialog extends StatefulWidget {
  const uploadAtachFileAlertDialog({super.key});

  @override
  State<uploadAtachFileAlertDialog> createState() => _uploadAtachFileAlertDialog();
}

class _uploadAtachFileAlertDialog extends State<uploadAtachFileAlertDialog> {
  //get file and insert in api
  var pickedattachfile;
  @override
  Future getAttachFile()async{
    final _picker = ImagePicker();
    pickedattachfile = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    File   _imageFile;

    if (pickedattachfile != null) {
      setState(() {
       attachFile = pickedattachfile.files.first;

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
                    "Attch your project file",
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
                    child: pickedattachfile!=null?Image.memory(pickedattachfile.files.first.bytes,width: 500,height: 250,): IconButton(icon:Icon(Icons.add,size: 50,),onPressed: () async {getAttachFile();},),),

                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 460),
                  child: Container(
                      width: 140,
                      height: 38,
                      child: ElevatedButton(
                          onPressed: () {
                            getAttachFile();
                          },
                          // ignore: sort_child_properties_last
                          child: Row(children: const <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Center(
                                    child: Text(
                                      "Select File",
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
                    "Your Attach File :",
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
                              "Document files .doc .docx.pdf .rtf",
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
                                    if(attachFile!=null){
                                      setState(() {
                                        attachFile =  pickedattachfile.files.first;
                                      });
                                      debugPrint( attachFile!.name);
                                      Navigator.of(context).pop();

                                    }
                                    else{
                                      print("File is Not Picked");
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
