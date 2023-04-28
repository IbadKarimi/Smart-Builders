
import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/JoinOwnerPro.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/CurrentUser.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Forget_Password.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Pofile_Info.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Profile.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_SignUp.dart';
import 'package:smart_builder_web/models/OwnerSignUpModel.dart';
import '../../../BuisnessLogic Layer/Api.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Desire_Building.dart';







final RegExp RegExpFirstName = RegExp(r'^[a-zA-Z]+$');
final RegExp RegExpLastName = RegExp(r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$');
final  emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override

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
                LoginInterface(),
                Footer(),
              ]),
            )));
  }
}

class LoginInterface extends StatefulWidget {
  const LoginInterface({super.key});

  @override
  State<LoginInterface> createState() => _LoginInterface();
}

class _LoginInterface extends State<LoginInterface> {
  ApiService apiService = new ApiService();
  List<OwnerSignUpModel> _getUserList=[];

  void initState() {
    apiService.getUserList().then((value){
      setState(() {
        _getUserList.addAll(value); //set data we get
      });
    });
    // Output: 2:30 PM
    //print('$hour:$minute');
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  Future<OwnerSignUpModel>? _createUser;
  bool _autoValidate=false;
  bool isPasswordVisibility=false;
  String? _email;
  String? _password;
  @override
  Widget build(BuildContext context) {

    for(int i=0;i<_getUserList.length;i++) {
      print(_getUserList[i].email);
    }
    bool isFirstName=false;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center
      ,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Container(
          margin: EdgeInsets.only(bottom: 60),
          width: 250,
          height: 480,
          color: const Color(0xFF343a40),
          child: Column(children:<Widget> [
            Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(top: 140, left: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("Logo/smartBuilderLogo.png")),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "SMART BUILDERS",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFFFFA62B),
                  ),
                )),


          ],),
        ),
        Container(
            margin: const EdgeInsets.only(top: 60, bottom: 120),
            width: 600,
            height: 480,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(color: const Color(0xFF999999))),
            child: Column(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 40, right: 0),
                    child: Text(
                      "Sign in to Smart Builders",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                 Padding(
                    padding: EdgeInsets.only(top: 40, right: 0),
                    child: Text(
                      "Welcome back ! Login to access the Smart Builder",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),

                //----------------------------Form-------------------------//
              SizedBox(height: 50,),
                Form(
                    key: _formKey,

                    autovalidateMode:_autoValidate==true?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,

                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        //------------------------------End Row---------------------//
                        Padding(
                            padding: EdgeInsets.only(top: 0, left: 10),
                            child:  Container(
                                width: 410,
                                margin: EdgeInsets.only(top:0),

                                child: TextFormField(
                                  controller: _emailController,

                                  // autovalidateMode:AutovalidateMode.,
                                  decoration: InputDecoration(
                                      helperText: ' ',
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 11),
                                      hintStyle:TextStyle(fontSize: 14) ,
                                      hintText:'User Name' ,
                                      prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      )),
                                  validator: (value){

                                    if(value!.trim().isEmpty){
                                      return  "User Name is Required";

                                    }
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                    for(int i=0;i<_getUserList.length;i++) {
                                      if (value!.trim() == _getUserList[i].email) {

                                        _email=_getUserList[i].email.toString();

                                      }
                                    }
                                    if(value!.trim()!=_email){
                                      return "User name is Invalid";
                                    }

                                    return null;
                                  },
                                ))),
                        //Password
                        Container(
                            width: 410,
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

                                  prefixIcon: Icon(Icons.security_sharp),
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
                                if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                                  return 'Password must contain at least one uppercase letter.';
                                }
                                if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                                  return 'Password must contain at least one lowercase letter.';
                                }
                                if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
                                  return 'Password must contain at least one number.';
                                }

                                for(int i=0;i<_getUserList.length;i++) {
                                  if (value!.trim() == _getUserList[i].password) {

                                    _password=_getUserList[i].password.toString();

                                  }
                                }
                                if(value!.trim()!=_password){
                                  return "Password is Invalid";
                                }
                                return null;
                              },
                            )),
                        Container(
                            margin:  const EdgeInsets.only(top: 20, left: 20),
                            width: 410,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ElevatedButton(
                                onPressed: ()async {
                                  if(_formKey.currentState!.validate()){
                                   debugPrint("Form is Valid");
                                   for(int i=0;i<_getUserList.length;i++) {
                                     if(_emailController.text==_getUserList[i].email&&_passwordController.text==_getUserList[i].password){
                                       CurrentUser currentUserEmail=CurrentUser();
                                       currentUserEmail.SetCurrentUserEmail(_emailController.text);
                                       Navigator.of(context).push(MaterialPageRoute(
                                           builder: (context) => OwnerViewProfile(_emailController.text)));
                                     }

                                   }

                                      }},

                                // ignore: sort_child_properties_last
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                  Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ]),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    backgroundColor: Color(0xFFFF9900)))),



                      ],)),
                //---------------------------------------------Form end-----------------------//



                Padding(
                    padding: const EdgeInsets.only(top: 20, left: 200),
                    child: Row(
                      children: <Widget>[
                        const Text(
                          "Create an Account ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => JoinOwnerPro()));
                            },
                            child: const Text("Sign Up ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFffa62b),
                                  fontSize: 14,
                                ))),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 20, left: 225),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OwnerForgetPassword()));
    },
                          child:Text(
                            "Forget Your Password ?",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ) ,
                        const SizedBox(
                          width: 5,
                        ),

                      ],
                    )),
              ],
            )),
      ],
    );
  }
}
