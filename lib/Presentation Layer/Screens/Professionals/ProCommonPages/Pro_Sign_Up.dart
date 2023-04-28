import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_SignUp.dart';
import '../../../../BuisnessLogic Layer/Api.dart';
import '../../../../models/OwnerSignUpModel.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';
import '../../Owner/Owner_Profile.dart';
import '../../Owner/Owner_login.dart';
import 'Pro_Add_Title.dart';
import 'Pro_Personal_Info.dart';

final RegExp RegExpFirstName = RegExp(r'^[a-zA-Z]+$');
final RegExp RegExpLastName = RegExp(r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$');
final  emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
String? _role;
bool titleError=false;
class ProSignUp extends StatefulWidget {
  String role;
  ProSignUp(this.role);

  @override
  State<ProSignUp> createState() => _ProSignUp();
}

class _ProSignUp extends State<ProSignUp> {
  @override
  Widget build(BuildContext context) {
    _role=widget.role;
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
    // Output: 2:30 PM
    //print('$hour:$minute');
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
  String selectedOptionTitle = "Title";
  List<String> optionsTitle = ["Contractor", 'Subcontractor', 'Architect', 'CivilEngineer'];

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
                padding: EdgeInsets.only(top: 60,bottom: 90),
                child: Text(
                  "Sign up to find work you Do ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            //place google button here

            //line or

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
                                  prefixIcon: Icon(Icons.person),
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
                                  prefixIcon: Icon(Icons.person),
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

                                if (!RegExpLastName.hasMatch(value)) {
                                  return 'Please enter a valid last name';
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
                                  prefixIcon: Icon(Icons.email),
                                  contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 11),
                                  hintStyle:TextStyle(fontSize: 14) ,
                                  hintText:'Work Email Address' ,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              validator: (value){

                                if(value!.trim().isEmpty){
                                  return  "Email is Required";

                                }

                                for(int i=0;i<_userList.length;i++){
                                  if(value.toString()==_userList[i].email&&value!.trim().isNotEmpty){
                                    return "Email is Already Exist";
                                  }


                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                }




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
                              prefixIcon: Icon(Icons.security_sharp),
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
                            if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                              return 'Password must contain at least one uppercase letter.';
                            }
                            if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                              return 'Password must contain at least one lowercase letter.';
                            }
                            if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
                              return 'Password must contain at least one number.';
                            }
                            return null;
                          },
                        )),
                    Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 120, left: 260),
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
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>  Login()));
                                    },
                                    child: const Text("Login ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFffa62b),
                                          fontSize: 14,
                                        ))),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 140, left: 240),
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
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>  ProSignUp("professionals")));
                                    },
                                    child: Text("join as owner ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFffa62b),
                                          fontSize: 14,
                                        ))),
                              ],
                            )),
                       /* Padding(
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
                            )),*/
                        Container(
                            margin:  const EdgeInsets.only(top: 60, left: 65),
                            width: 570,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: ElevatedButton(
                                onPressed: ()async {
                                  if(_formKey.currentState!.validate()&&selectedOptionTitle!="Title"){
                                    setState(() {
                                      titleError=false;
                                    });
                                    debugPrint("Form is Valid");


                                    var response= await apiService.PostApiUserSignUp(_firstNameController.text,_lastNameController.text,_emailController.text,_passwordController.text,selectedOptionTitle.toString(),/*_role.toString()*/);

                                    if(response=="200")
                                    {
                                      String currentEmail=_emailController.text;
                                      debugPrint("Email is"+_emailController.text);
                                      debugPrint(_emailController.toString());
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                              ProfessionalsProfile(currentEmail,selectedOptionTitle.toString())));}
                                  }

                                  else {

                                    setState(() {
                                      _autoValidate=true;
                                      titleError=true;
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
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                          Text(selectedOptionTitle),
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
                                    children: optionsTitle //--------------------list
                                        .map((e) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            isOpenCountry = false;
                                            selectedOptionTitle = e;
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
                            Padding(
                              padding:const EdgeInsets.only(top:10,left:110),
                              child:titleError==true?  Text("Title is Required",style:TextStyle(fontSize: 12,color:Colors.red.shade50)):Text(""),
                            ),
                          ],

                        ),
                      ],
                    ),


                  ],)),
            //---------------------------------------------Form end-----------------------//


          ],
        ));
  }
}

