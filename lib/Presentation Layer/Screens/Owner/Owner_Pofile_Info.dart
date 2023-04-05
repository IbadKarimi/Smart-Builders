import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/CurrentUser.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Preview_Profile.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Profile.dart';
import '../../../BuisnessLogic Layer/Api.dart';
import '../../../models/OwnerProfileModel.dart';
import '../HomePage/footer.dart';
import '../HomePage/header.dart';
import 'Owner_Desire_Building.dart';
import 'Owner_Manage_Accepted_Offer.dart';
import 'Owner_Manage_Applied_Contracts.dart';
import 'Owner_Mange_Offers.dart';
import 'Owner_Select_Title_ServiceProvider.dart';
import 'Owner_Submitted_Proposals.dart';


const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
String? ownerId;
String? profession;
String? firstName;
String? lastName;
String? city;
String? email;
String? phoneNo;
String? timeNowCreated;
String? country;
String? profilePhoto;
String ?currentUserEmail;
String ?coverPhotoUrl;
String ?id;
bool isEditMode=false;


PlatformFile? coverPhotoObject;

PlatformFile? editprofilePhotoObject;

class OwnerViewProfile extends StatefulWidget {
  String currentUserEmail;
 OwnerViewProfile(this.currentUserEmail);

  @override
  State<OwnerViewProfile> createState() => _OwnerViewProfile();
}

class _OwnerViewProfile extends State<OwnerViewProfile> {
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
                    OwnerCoverProfile(),
                    OwnerAddProposal(),
                    OwnerOffers(),
                    OwnerTrackContract(),
                    Footer()
                  ],
                ))));
  }
}

class OwnerCoverProfile extends StatefulWidget {
  OwnerCoverProfile({super.key});
  @override
  State<OwnerCoverProfile> createState() => _OwnerCoverProfile();
}

class _OwnerCoverProfile extends State<OwnerCoverProfile> {
  ApiService apiService = new ApiService();
  CurrentUser currentUserEmailObject=CurrentUser();
  List<OwnerProfileModel> _getOwnerProfileData=[];
  List<OwnerProfileModel> _getOwnerCoverPhotoData=[];

  void initState() {
    apiService.getOwnerProfile().then((value){
      setState(() {
        _getOwnerProfileData.addAll(value);
        for(int index=0;index<_getOwnerProfileData.length;index++) {
          if (_getOwnerProfileData[index].email==currentUserEmail
          ) {
            ownerId=_getOwnerProfileData[index].id.toString();
            profession=_getOwnerProfileData[index].occupation.toString();
            firstName=_getOwnerProfileData[index].firstName.toString();
            lastName=_getOwnerProfileData[index].lastName.toString();
            city=_getOwnerProfileData[index].city.toString();
            email=_getOwnerProfileData[index].email.toString();
            phoneNo=_getOwnerProfileData[index].phoneNo.toString();
            timeNowCreated=_getOwnerProfileData[index].timeNow.toString();
            country=_getOwnerProfileData[index].country.toString();
            profilePhoto=_getOwnerProfileData[index].uploadPhoto.toString();

            print("--------------------------------------------------------------");
            print("Id is :" + _getOwnerProfileData[index].id.toString());
            print("First Name is :" + _getOwnerProfileData[index].firstName.toString());
            print("Last Name is  :" + _getOwnerProfileData[index].lastName.toString());
            print("Email is      :" + _getOwnerProfileData[index].email.toString());
            print("Profession    :" + _getOwnerProfileData[index].occupation.toString());
            print("Country       :" + _getOwnerProfileData[index].country.toString());
            print("City          :" + _getOwnerProfileData[index].city.toString());
            print("Street Address:" + _getOwnerProfileData[index].streetAddress.toString());
            print("Phone no is   :" + _getOwnerProfileData[index].phoneNo.toString());
            print("CNIC no is    :" + _getOwnerProfileData[index].cnicNo.toString());
            print("Ntn  no is    :" + _getOwnerProfileData[index].ntnNo.toString());
            print("Time Now      :" + _getOwnerProfileData[index].timeNow.toString());
            print("--------------------------------------------------------------");

          }
        }//set data we get
        //set data we get
      });
    });
    apiService.getCoverPhotoData().then((value){
      setState(() {
        _getOwnerCoverPhotoData.addAll(value);
        Future.delayed(Duration(seconds: 2));
        for(int i=0;i<_getOwnerCoverPhotoData.length;i++){
          if( _getOwnerCoverPhotoData[i].email.toString()==currentUserEmail){
            id= _getOwnerCoverPhotoData[i].id.toString();
            coverPhotoUrl= _getOwnerCoverPhotoData[i].uploadCoverPhoto.toString();
           // print("Cover Photo Url :"+_getOwnerCoverPhotoData[i].uploadCoverPhoto.toString());
            //print("Id              :"+_getOwnerCoverPhotoData[i].id.toString());
            //print("Email is        :" + _getOwnerCoverPhotoData[i].email.toString());
            //print("Current User Email =:"+currentUserEmail.toString());//set data we get
          }

      }});
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

  //  currentUserEmailObject.SetCurrentUserEmail("hadiFAzool");
  //  String getEmail= currentUserEmailObject.getCurrentUserEmail();




    return Container(
        width: 900,
        height: 600,
        margin: const EdgeInsets.only(top: 50, bottom: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: strokeColor)), // all the boxes are here like skill
        child: Stack(children: <Widget>[

          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child:coverPhotoUrl!=null? Image.network(
             coverPhotoUrl.toString(),
              height: 300.0,
              width: 900.0,
              scale: 1,
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
            padding: const EdgeInsets.only(left:50,top:220),
            child: CircleAvatar(
              radius: 70.0,
              backgroundImage:
              NetworkImage(profilePhoto.toString(),),
              backgroundColor: Colors.transparent,
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
              height: 200,
              width: 350,
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
                      padding: EdgeInsets.only(left: 50),
                      child: Text("Owner",
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),
                  const Padding(
                      padding: EdgeInsets.only(
                        left: 50,
                        top: 10,
                      ),
                      child: Text("Smart Builders PVT LTD",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 50),
                      child: Text(city.toString()+"Pakistan",
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),
                  Row(children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                        child: Text(
                          "About",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const OverViewDialog();
                              });
                        },
                        child: Container(
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: strokeColor, width: 1),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Image.asset(
                                  "PreviewProfilePic/edit.png",
                                  width: 10,
                                  height: 10,
                                )))),
                  ])
                ],
              )),
          const Padding(
              padding: EdgeInsets.only(top: 510, left: 50, bottom: 0),
              child: Text(
                "To build something requires vision and the willingness to adapt to what is already there.",
                style: TextStyle(
                  color: TextlightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ]));
  }
}

class OwnerAddProposal extends StatefulWidget {
  const OwnerAddProposal({super.key});

  @override
  State<OwnerAddProposal> createState() => _OwnerAddProposal();
}

class _OwnerAddProposal extends State<OwnerAddProposal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 370,
      margin: const EdgeInsets.only(top: 50, bottom: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: strokeColor)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        const Padding(
            padding: EdgeInsets.only(left: 50, top: 20),
            child: Text(
              "Proposals",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 60,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddTitleServiceProvider()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text(
                              "Submit Proposals",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "(0)",
                              style: TextStyle(
                                  color: Color(0xFFFF9900), fontSize: 16),
                            )),
                      ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OwnerSubmittedProposals()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Center(
                              child: Text(
                                "Submitted Proposals",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "(1)",
                              style: TextStyle(
                                  color: Color(0xFFFF9900), fontSize: 16),
                            )),
                      ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
      ]),
    );
  }
}

class OwnerOffers extends StatefulWidget {
  const OwnerOffers({super.key});

  @override
  State<OwnerOffers> createState() => _OwnerOffers();
}

class _OwnerOffers extends State<OwnerOffers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 400,
      margin: const EdgeInsets.only(top: 50, bottom: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: strokeColor)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(left: 50, top: 20),
                child: Text(
                  "Manage Offers",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )),
            Center(
              child: Container(
                  margin: const EdgeInsets.only(
                    top: 60,
                  ),
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OwnerManageOffers()));
                      },
                      // ignore: sort_child_properties_last
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "Offers",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "(1)",
                                  style: TextStyle(
                                      color: Color(0xFFFF9900), fontSize: 14),
                                )),
                          ]),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF363B42)))),
            ),
            Center(
              child: Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                  ),
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const OwnerManageAcceptedOffers()));
                      },
                      // ignore: sort_child_properties_last
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  "Accepter Offers",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "(0)",
                                  style: TextStyle(
                                      color: Color(0xFFFF9900), fontSize: 14),
                                )),
                          ]),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF363B42)))),
            ),
          ]),
    );
  }
}

class OwnerTrackContract extends StatefulWidget {
  const OwnerTrackContract({super.key});

  @override
  State<OwnerTrackContract> createState() => _OwnerTrackContract();
}

class _OwnerTrackContract extends State<OwnerTrackContract> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      height: 470,
      margin: const EdgeInsets.only(top: 50, bottom: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: strokeColor)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        const Padding(
            padding: EdgeInsets.only(left: 50, top: 20),
            child: Text(
              "Track Contract",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 60,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DesireBuilding()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          "Contract in Progress",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "(0)",
                          style:
                              TextStyle(color: Color(0xFFFF9900), fontSize: 14),
                        )),
                  ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const OwnerManageAppliedContract()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Text(
                          "Contract Applied",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "(0)",
                          style:
                              TextStyle(color: Color(0xFFFF9900), fontSize: 14),
                        )),
                  ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.only(
                top: 40,
              ),
              width: 300,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DesireBuilding()));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          "Contract Completed",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "(0)",
                          style:
                              TextStyle(color: Color(0xFFFF9900), fontSize: 14),
                        )),
                  ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
      ]),
    );
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
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
            width: 650,
            height: 600,
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
                              new TextField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
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

class PortFolioDialog extends StatefulWidget {
  const PortFolioDialog({super.key});

  @override
  State<PortFolioDialog> createState() => _PortFolioDialog();
}

class _PortFolioDialog extends State<PortFolioDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
            width: 650,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, bottom: 0),
                  child: Text(
                    "Add Portfolio",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
                  child: Text(
                    "Project Title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                    top: 0,
                    left: 10,
                  ),
                  child: SizedBox(
                      width: 250,
                      height: 32,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                      ))),
              const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Text(
                    "Project Description",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Container(
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: strokeColor, width: 1)),
                  margin: EdgeInsets.only(top: 0, left: 10, bottom: 10),
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        new TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ])),

              //column
              Container(
                  margin: const EdgeInsets.only(
                    top: 0,
                    left: 10,
                  ),
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFF363B42),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(children: <Widget>[
                    Center(
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
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 140, left: 20),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                child: Text(
                                  "Drag and Drop",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                child: Text(
                                  "or Browser File",
                                  style: TextStyle(
                                    color: Color(0xFFFFA62B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ))
                  ])),

              Container(
                  margin: EdgeInsets.only(top: 20, left: 10, bottom: 0),
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
                              "Images (.jpg, .gif, .png, up to 10 MB, no more than 4000 px in any dimension",
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
                                  "Document (.pdf, up to 10 MB)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        )),

                    //place image edit
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

class uploadCoverPhotoAlertDialog extends StatefulWidget {
  const uploadCoverPhotoAlertDialog({super.key});

  @override
  State<uploadCoverPhotoAlertDialog> createState() => _uploadCoverPhotoAlertDialog();
}

class _uploadCoverPhotoAlertDialog extends State<uploadCoverPhotoAlertDialog> {
  //get file and insert in api
  var pickedCoverPhoto;
  @override
  Future getCoverImage()async{
    final _picker = ImagePicker();
    pickedCoverPhoto = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (pickedCoverPhoto != null) {
      setState(() {
        coverPhotoObject= pickedCoverPhoto.files.first;

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
                    child: pickedCoverPhoto!=null?Image.memory(pickedCoverPhoto.files.first.bytes,width: 500,height: 250,): IconButton(icon:Icon(Icons.add_photo_alternate_outlined,size: 50,),onPressed: () async {getCoverImage();},),),

                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 460),
                  child: Container(
                      width: 140,
                      height: 38,
                      child: ElevatedButton(
                          onPressed: () {
                            getCoverImage();
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
                                  onPressed: () async{

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

                                    if(coverPhotoObject!=null){
                                      setState(() async {
                                        coverPhotoObject =  pickedCoverPhoto.files.first;
                                        String response;
                                     //   if(isEditMode!=true){
                                         response=await apiService.InsertCoverPhoto(coverPhotoObject!, email.toString());


                                         // response=await apiService.UpdateCoverPhotoData(id.toString(),coverPhotoObject!, );
                                        //  print("Update as Image");



                                       if(response=="200"){
                                         print("Scess fully response");
                                        // Navigator.of(context).pop();
                                         Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerViewProfile(currentUserEmail.toString())));

                                       }

                                      });

                                      

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
                                        response=await apiService.UpdateProfilePhoto(ownerId.toString(),editprofilePhotoObject!,);
                                         print(ownerId.toString());

                                        // response=await apiService.UpdateCoverPhotoData(id.toString(),coverPhotoObject!, );
                                        //  print("Update as Image");



                                        if(response=="200"){
                                          print("Scess fully response");
                                          // Navigator.of(context).pop();
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerPreviewProfile(currentUserEmail.toString())));

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