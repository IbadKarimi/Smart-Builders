// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/UserTitle.dart';

import 'HomePage/footer.dart';
import 'HomePage/header.dart';
import 'Owner/Owner_Desire_Building.dart';
import 'Professionals/ProCommonPages/Pro_Add_Education.dart';
import 'Professionals/ProCommonPages/Pro_Add_Title.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
final RegExp RegExpFirstName = RegExp(r'^[a-zA-Z]+$');
final RegExp RegExpLastName = RegExp(r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$');
final RegExp RegExpCity = RegExp(r'^[a-zA-Z ]+$');
final RegExp RegExpAddress = RegExp(r'^[a-zA-Z0-9\s\-\#.,]+$');
String? _title;


class WorkExperience1 extends StatefulWidget {
  String title;
   WorkExperience1(this.title);

  @override
  State<WorkExperience1> createState() => _WorkExperience1();
}

class _WorkExperience1 extends State<WorkExperience1> {
  @override
  Widget build(BuildContext context) {
    _title=widget.title;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.white,
              child: Column(
                children: const <Widget>[
                  Boxes(),
                  WorkExperienceInterface(),
                  Footer(),
                ],
              ),
            )));
  }
}

class WorkExperienceInterface extends StatefulWidget {
  const WorkExperienceInterface({super.key});

  @override
  State<WorkExperienceInterface> createState() => _WorkExperienceInterface();
}

class _WorkExperienceInterface extends State<WorkExperienceInterface> {
  @override
  Widget build(BuildContext context) {


    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 120),
        width: 700,
        height: 600,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "If you have a work experience , add it here",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  '''
Professional service providers who want to add their experience to win work, if you 
are just starting out, you can still create a great profile. Just head on to the next page
                  ''',
                  style: TextStyle(
                    color: Color(0xFF3D424A),
                    fontSize: 16,
                  ),
                )),
            //----------------------------Add Experinece Box
            Container(
                margin: const EdgeInsets.only(top: 0, right: 350),
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF363B42),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(children: <Widget>[
                  //--------------------------------------------alert dialog
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return showAddExperinceAlertDialog();
                            });
                      }, //-------------------------------------show dialog ends here----------------------------//
                      child: Center(
                          child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.only(top: 0, right: 0),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("logo/Plus.png"),
                                    fit: BoxFit.contain),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              )))),
                  Padding(
                      padding: EdgeInsets.only(top: 130, left: 70),
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Experience",
                                style: TextStyle(
                                  color: Color(0xFFFFA62B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ))
                ])),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 140, left: 50),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddTitle()));
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
                    padding: const EdgeInsets.only(top: 140, left: 250),
                    child: Container(
                        width: 220,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddEducations()));
                            },
                            // ignore: sort_child_properties_last
                            child: Row(children: const <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Center(
                                      child: Text(
                                    "Next,",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Add your education",
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
        ));
  }
}

class showAddExperinceAlertDialog extends StatefulWidget {
  const showAddExperinceAlertDialog({super.key});

  @override
  State<showAddExperinceAlertDialog> createState() =>
      _showAddExperinceAlertDialogState();
}

class _showAddExperinceAlertDialogState
    extends State<showAddExperinceAlertDialog> {
  bool isOpen = false;
  String selectedOption = "City";
  List<String> options = [
    'Rawalpindi',
    'Islamabad',
    'Lahore',
    'Karachi',
    'Multan',
  ];

  //-----------------------------------Start End-----------//
  bool isOpenMonth = false;
  String selectedOptionMonth = "Month";
  List<String> optionsMonth = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final _keyWorkExperience = GlobalKey<FormState>();
  final _companyNameController=TextEditingController();
  final _workExperienceController=TextEditingController();
  bool _autoValidate=false;
  static const checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: StatefulBuilder(builder: (context, setState) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Container(
                  width: 650,
                  height: 480,
                  child: Form(
                    key: _keyWorkExperience,
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
                                "Add Work Experience",
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
                              EdgeInsets.only(top: 20, left: 10, bottom: 10),
                          child: Text(
                            "Title",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 0, left:10),
                          child: Container(
                              width: 640,
                              height: 35,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                                border:   Border.all(
                                  color: Colors.black38, width: 1),
                              ),
                              child:Padding(
                                padding: EdgeInsets.only(left:10,top:10),
                                  child:Text(_title.toString(),style:TextStyle(fontSize: 14,) ,))),
                          ),
                      Padding(
                          padding:
                              EdgeInsets.only(top: 20, left:10, bottom: 10),
                          child: Text(
                            "Company",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 0, left:10),
                          child: SizedBox(
                              width: 640,

                              child: TextFormField(
                                // autovalidateMode:AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.name,
                                controller: _companyNameController,
                                decoration: InputDecoration(
                                    helperText: "",
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 11),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )),
                                validator: (value){

                                  if(value!.trim().isEmpty){
                                    return "Company Name is Required";
                                  }
                                  if (!RegExpFirstName.hasMatch(value)) {
                                    return 'Please enter a valid company name';
                                  }
                                  return null;
                                },
                              ))),
                      Padding(
                          padding:
                          EdgeInsets.only(top: 0, left:10, bottom: 10),
                          child: Text(
                            "How much experience you have",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 0, left: 10),
                          child: SizedBox(
                              width: 640,
                              child: TextFormField(
                                // autovalidateMode:AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.name,
                                controller: _workExperienceController,

                                decoration: InputDecoration(


                                    helperText: "",
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 11),


                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )),
                                validator: (value){

                                  if(value!.trim().isEmpty){
                                    return "Experience is Required";

                                  }



                                  return null;
                                },
                              ))),
                      // ignore: prefer_const_literals_to_create_immutables

                      Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 120, left: 0),
                                  child: SizedBox(
                                      width: 140,
                                      height: 35,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          // ignore: sort_child_properties_last
                                          child: const Text(
                                            "Back",
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFD9D9D9),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          )))),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 120, left: 350),
                                  child: Container(
                                      width: 140,
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if( _keyWorkExperience.currentState!.validate()){
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      const DesireBuilding()));
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
                            ],
                          ),
                        ],
                      ),

                      // ignore: prefer_const_literals_to_create_immutables

                      //Back and Next Button--------------------------------------------------------------------------------------------
                    ]),
                  ))),
        );
      }),
    );
  }
}
