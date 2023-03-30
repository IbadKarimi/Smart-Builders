import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/HiringProfessionals/Contractors.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/home_page.dart';
import 'package:smart_builder_web/models/OwnerSignUpModel.dart';
import 'package:http/http.dart'as http;
import '../../../BuisnessLogic Layer/Api.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Desire_Building.dart';
import 'Owner_Profile.dart';

import 'package:email_validator/email_validator.dart';

//https://stackoverflow.com/questions/63861757/how-to-change-the-position-of-validation-error-in-flutter-forms






class OwnerSignUp extends StatefulWidget {
  const OwnerSignUp({super.key});

  @override
  State<OwnerSignUp> createState() => _OwnerSignUp();
}

class _OwnerSignUp extends State<OwnerSignUp> {
  @override
 /* void initState(){
    PostApiUserSignUp("abdullah", "gul","ibadkarimi.10@gmail.com", "new insert","Paskistan");
    super.initState();
  }
  Future<OwnerSignUpModel> PostApiUserSignUp(String firstName,String lastName,String email,String password,String country) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/smart-builders/UserSignUp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "firstName": firstName.toString(),
        "lastName": lastName.toString(),
        "email": email.toString(),
        "password": password.toString(),
        "country": country.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return OwnerSignUpModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to USer Sign-Up. Api');
    }
  }*/

  Widget build(BuildContext context) {

    final double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: ScreenWidth,
              color: Colors.white,
              child: Column(children: const <Widget>[
                Boxes(),
                SignUpInterface(),
                Footer(),
              ]),
            )));
  }
}

class SignUpInterface extends StatefulWidget {
  const SignUpInterface({super.key});

  @override
  State<SignUpInterface> createState() => _SignUpInterface();
}

class _SignUpInterface extends State<SignUpInterface> {
  ApiService apiService = new ApiService();
  List<OwnerSignUpModel> _userList=[];
  void initState() {
   apiService.getUserList().then((value){
      setState(() {
        _userList.addAll(value); //set data we get
      });
    });
    super.initState();
  }



  final _formKey = GlobalKey<FormState>();
  final _firstNameController=TextEditingController();
  final _lastNameController=TextEditingController();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  Future<OwnerSignUpModel>? _createUser;

  bool _autoValidate=false;
  bool isPasswordVisibility=false;

  //------------------------------------------------//

  bool isOpenCountry = false;
  String selectedOptionCountry = "Pakistan";
  List<String> optionsCountry = ["Pakistan", 'China', 'Srilanka', 'India'];

  //------------------------------------------------//


  @override

  Widget build(BuildContext context) {
    for(int i=0;i<_userList.length;i++) {

      print(_userList[i].email);
    }
    bool isFirstName=false;
    String country = "Pakistan";
    const checkbox = false;
    var countryItems = [
      'Pakistan',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 120),
        width: 700,
        height: 680,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 40, right: 0),
                child: Text(
                  "Sign up to Hire Professionals",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            //place google button here
            Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Container(
                    width: 570,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Color(0xFF3D424A), width: 1)),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DesireBuilding()));
                        },
                        // ignore: sort_child_properties_last
                        child: Row(children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                  image: AssetImage("GoogleLogo/Google.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(left: 130),
                              child: Text(
                                "Continue with Google",
                                style: TextStyle(
                                    color: Color(0xFF3D424A), fontSize: 14),
                              )),
                        ]),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: Colors.white)))),
            //line or
            const Padding(
                padding: EdgeInsets.only(left: 20, top: 10,bottom: 20),
                child: Text(
                  "___________________________________or______________________________________",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )),
            //Row
            //----------------------------Form-------------------------//

   Form(
     key: _formKey,

      autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,

    child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:<Widget> [

     Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Container(
             width: 240,
             margin: EdgeInsets.only(top:0,left:10),


             child: TextFormField(
            // autovalidateMode:AutovalidateMode.onUserInteraction,
               controller: _firstNameController,
               decoration: InputDecoration(
                   helperText: ' ',
                   isDense: true,
                   contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 11),
                   label: const Text("First Name",
                       style: TextStyle(fontSize: 14)),

                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0),
                   )),

               validator: (value){
                 if(value!.trim().isEmpty){
                   return "First Name is Required";

                 }

                 return null;
               },
             )),
         const SizedBox(
           width: 20,
         ),
         Container(
             width: 250,
             margin: EdgeInsets.only(top:0),

             child: TextFormField(
              // autovalidateMode:AutovalidateMode.onUserInteraction,
               controller: _lastNameController,
               decoration: InputDecoration(

                   helperText: ' ',//not moving the content

                   isDense: true,
                   contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 11),
                   label: const Text("Last Name",
                       style: TextStyle(fontSize: 14)),

                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0),
                   )),
               validator: (value){
                 if(value!.trim().isEmpty){
                   return "Last Name is Required";
                 }
                 return null;
               },
             )),
       ],
     ),
     //------------------------------End Row---------------------//
     Padding(
         padding: EdgeInsets.only(top: 0, left: 10),
         child:  Container(
             width: 510,
             margin: EdgeInsets.only(top:0),

             child: TextFormField(
               controller: _emailController,

              // autovalidateMode:AutovalidateMode.,
               decoration: InputDecoration(
                   helperText: ' ',
                   isDense: true,
                   contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 11),
                   hintStyle:TextStyle(fontSize: 14) ,
                   hintText:'Work Email Address' ,
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0),
                   )),
               validator: (_emailController){
                /* if(_emailController!.trim().isNotEmpty){
                   final bool isValid = EmailValidator.validate(_emailController);
                    var s = isValid ? null :"Email is not Valid" ;
                    return s;


                 }*/
                 if(_emailController!.trim().isEmpty){
                   return  "Email is Required";

                 }
                 for(int i=0;i<_userList.length;i++){
                   if(_emailController.toString()==_userList[i].email){
                     return "Email is Already Exist";
                   }
                 }


                 //if(){}

                 return null;
               },
             ))),
     //Password
     Container(
         width: 510,
         margin: EdgeInsets.only(left:10),

         child: TextFormField(
           controller: _passwordController,
          obscureText: isPasswordVisibility==true? false:true,

          // autovalidateMode:AutovalidateMode.onUserInteraction,
           decoration: InputDecoration(
               helperText: ' ',
               isDense:true,
               contentPadding: EdgeInsets.symmetric(vertical: 11,horizontal: 11),
               label:
               Text("Password", style: TextStyle(fontSize: 14)),


                   suffixIcon:isPasswordVisibility==true? IconButton(
    icon: Icon(Icons.visibility_off),
    onPressed: (){
    setState(() {
    isPasswordVisibility=false;
    });
    }) :IconButton(
                       icon: Icon(Icons.visibility),
                    onPressed: (){
                         setState(() {
                           isPasswordVisibility=true;
                         });
                    }),




               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.0),
               )),
           validator: (value){
             if(value!.trim().isEmpty){
               return "Password is Required";
             }
             if(value.length<8){
               return "Password should be at least 8 digit";
             }
             return null;
           },
         )),
     Stack(
       children: [
         Padding(
             padding: const EdgeInsets.only(top: 60, left: 100),
             child: Row(
               children: <Widget>[
                 Checkbox(
                   value: checkbox,
                   onChanged: (value) {
                     setState(() {
                       // _checkbox = false;
                     });
                   },
                 ),
                 const Text(
                   'Send me emails with tips on how to find professional that fits my needs ',
                   style: TextStyle(
                       fontSize: 10, fontWeight: FontWeight.w500),
                 ),
               ],
             )),
         //checkbox 2
         Padding(
             padding: const EdgeInsets.only(top: 80, left: 100),
             child: Row(
               children: <Widget>[
                 Checkbox(
                   value: checkbox,
                   onChanged: (value) {
                     setState(() {
                       // _checkbox = false;
                     });
                   },
                 ),
                 const Padding(
                     padding: EdgeInsets.only(top: 20),
                     child: Text(
                       '''
Yes, I understand and agree to the Smart Builders Terms of Service,including
the User Agreement and Privacy Policy
                              ''',
                       style: TextStyle(
                           fontSize: 10, fontWeight: FontWeight.w500),
                     )),
               ],
             )),
         Container(
           margin:  const EdgeInsets.only(top: 160, left: 70),
             width: 570,
             height: 35,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30.0),
             ),
             child: ElevatedButton(
                 onPressed: () {
                   if(_formKey.currentState!.validate()){
                     debugPrint("Form is Valid");

                   setState(()  {
                     _createUser =
                      apiService.PostApiUserSignUp(_firstNameController.text,_lastNameController.text,_emailController.text,_passwordController.text,selectedOptionCountry);

                   });
                     Navigator.of(context).push(MaterialPageRoute(
                         builder: (context) =>
                         const ContractorsMain()));

                 }
                   else {
                     setState(() {
                       _autoValidate=true;
                     });
                   }},

                 // ignore: sort_child_properties_last
                 child: Row(children: <Widget>[
                   const Padding(
                       padding: EdgeInsets.only(left: 190),
                       child: Text(
                         "Create my Account",
                         style: TextStyle(
                             color: Colors.white, fontSize: 16),
                       )),
                 ]),
                 style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30.0),
                     ),
                     backgroundColor: Color(0xFFFF9900)))),
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
                     width: 510,
                     height: 40,
                     margin: const EdgeInsets.only(
                         left: 100, top: 0, right: 10),
                     decoration: BoxDecoration(
                         border:
                         Border.all(color: Colors.black38, width: 1),
                         borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding:
                       const EdgeInsets.symmetric(horizontal: 10),
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
                 width: 510,
                 height: 150,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     border: Border.all(color: Colors.black38, width: 1),
                     borderRadius: BorderRadius.circular(5)),
                 margin: const EdgeInsets.only(left: 100),
                 child: ListView(
                     scrollDirection: Axis.vertical,
                     primary: true,
                     shrinkWrap: true,
                     children: optionsCountry //--------------------list
                         .map((e) => Container(
                       decoration: BoxDecoration(
                           borderRadius:
                           BorderRadius.circular(5)),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: GestureDetector(
                           onTap: () {
                             isOpenCountry = false;
                             selectedOptionCountry = e;
                             setState(() {});
                           },
                           child: HoverContainer(
                               height: 35,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                               ),
                               hoverDecoration: BoxDecoration(
                                 borderRadius:
                                 BorderRadius.circular(5),
                                 border: Border.all(
                                     color:
                                     const Color(0xFFFFA62B),
                                     width: 1),
                               ),
                               child: Padding(
                                 padding:
                                 const EdgeInsets.all(8.0),
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


   ],)),
            //---------------------------------------------Form end-----------------------//

            //Entrer work email address

            //drop down


            //Check Box

            //Buuton Create

            Padding(
                padding: const EdgeInsets.only(top: 20, left: 260),
                child: Row(
                  children: <Widget>[
                    const Text(
                      "Already have an Account ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Text("Login ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFffa62b),
                              fontSize: 14,
                            ))),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 240),
                child: Row(
                  children: <Widget>[
                    const Text(
                      "here to hire professionals ?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Text("join as owner ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFffa62b),
                              fontSize: 14,
                            ))),
                  ],
                )),
          ],
        ));
  }
}
