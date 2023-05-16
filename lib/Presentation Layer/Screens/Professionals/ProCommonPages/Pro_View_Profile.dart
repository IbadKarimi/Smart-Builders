import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../BuisnessLogic Layer/Api.dart';
import '../../../../models/OwnerAboutModel.dart';
import '../../../../models/OwnerProfileModel.dart';
import '../../../../models/ProEducationHistory.dart';
import '../../../../models/ProWorkExperience.dart';
import '../../../../models/ProfessionalsProfileModel.dart';
import '../../../../models/ProfessionalsSkillsModels.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';
import '../../Owner/Owner_Forget_Password.dart';
import '../../Owner/Owner_View_Profile.dart';
import 'Pro_Accepted_Offers.dart';
import 'Pro_Accepted_Proposals.dart';
import 'Pro_My_Offers.dart';
import 'Pro_Offer_List.dart';
import 'Pro_Profile_Ready.dart';
import 'Pro_View_Accepted_Propsal_List.dart';
import 'Pro_View_Requested_Proposals_List.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);
String? proId;
String? companyName;
String? firstName;
String? lastName;
String ?title;
String? city;
String? email;
String? phoneNo;
String? timeNowCreated;
String? country;
String? profilePhoto;
String ?coverPhotoUrl;
String ?id;
String? about;
String? currentUserEmail;
PlatformFile? coverPhotoObject;
PlatformFile? editprofilePhotoObject;

ApiService apiService = new ApiService();

class ProViewProfile extends StatefulWidget {
  String email;
  ProViewProfile (this.email);

  @override
  State<ProViewProfile > createState() => _ProViewProfile();
}

class _ProViewProfile  extends State<ProViewProfile > {
  @override
  Widget build(BuildContext context) {
    currentUserEmail=widget.email;
    print("Email is "+currentUserEmail.toString());
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
                    ProProfile(),
                    WorkExperience(),
                    EducationHistory(),
                    Skills(),
                    AddPOrtFolio(),
                    AddProposal(),
                    Offers(),
                    TrackContract(),
                    Footer()
                  ],
                ))));
  }
}


class ProProfile extends StatefulWidget {
  ProProfile({super.key});
  @override
  State<ProProfile> createState() => _ProProfile();
}

class _ProProfile extends State<ProProfile> {

  ApiService apiService = new ApiService();
  List<ProfessionalsProfileModel> _getOwnerProfileData=[];
  List<ProfessionalsProfileModel> _getOwnerCoverPhotoData=[];
  List<OwnerAboutModel> _getOwnerAboutData=[];
  Future<String> getOwnerAbout(String email)async{
    var ownerAbout=await apiService.OwnerAboutFindByEmail(currentUserEmail.toString());
    return ownerAbout;
  }

  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());
    apiService.getProProfile().then((value){
      setState(() {
        _getOwnerProfileData.addAll(value);
        for(int index=0;index<_getOwnerProfileData.length;index++) {
          if (_getOwnerProfileData[index].email==currentUserEmail) {

            proId=_getOwnerProfileData[index].id.toString();
            companyName=_getOwnerProfileData[index].companyName.toString();
            firstName=_getOwnerProfileData[index].firstName.toString();
            lastName=_getOwnerProfileData[index].lastName.toString();
            title=_getOwnerProfileData[index].title.toString();
            city=_getOwnerProfileData[index].city.toString();
            email=_getOwnerProfileData[index].email.toString();
            phoneNo=_getOwnerProfileData[index].phoneNo.toString();
            timeNowCreated=_getOwnerProfileData[index].timeNow.toString();
            country=_getOwnerProfileData[index].country.toString();
            profilePhoto=_getOwnerProfileData[index].uploadPhoto.toString();

            print("--------------------------------------------------------------");
            print("Id is :" + _getOwnerProfileData[index].id.toString());
            // print("About is :" + ownerAbout.toString());
            print("First Name is :" + _getOwnerProfileData[index].firstName.toString());
            print("Last Name is  :" + _getOwnerProfileData[index].lastName.toString());
            print("Email is      :" + _getOwnerProfileData[index].email.toString());
            print("Profession    :" + _getOwnerProfileData[index].companyName.toString());
            print("Country       :" + _getOwnerProfileData[index].country.toString());
            print("City          :" + _getOwnerProfileData[index].city.toString());
            print("Street Address:" + _getOwnerProfileData[index].streetAddress.toString());
            print("Phone no is   :" + _getOwnerProfileData[index].phoneNo.toString());
            print("CNIC no is    :" + _getOwnerProfileData[index].cnicNo.toString());
            print("Ntn  no is    :" + _getOwnerProfileData[index].ntnNo.toString());
            print("Time Now      :" + _getOwnerProfileData[index].timeNow.toString());
            print("Profile photo"+profilePhoto.toString());
            print("Cover photo"+coverPhotoUrl.toString());
            print("--------------------------------------------------------------");

          }
        }//set data we get
        //set data we get
      });
    });

    apiService.getAbout().then((value){
      _getOwnerAboutData.addAll(value);
      for(int i=0;i<_getOwnerAboutData.length;i++){
        if(currentUserEmail.toString()==_getOwnerAboutData[i].email){
          setState(() {
            about=   _getOwnerAboutData[i].about.toString();
            print("About :"+about.toString());
          });

        }}
    });
    apiService.getProCoverPhotoData().then((value){
      setState(() {
        _getOwnerCoverPhotoData.addAll(value);

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
    return Container(
        width: 900,

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
                ):Container(width:142,height: 142,decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular((10),)),
                )
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
                Padding(
                      padding: EdgeInsets.only(left: 50,top:5),
                      child: Text(title.toString(),
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),
                  Padding(
                      padding: EdgeInsets.only(
                        left: 50,
                        top: 10,
                      ),
                      child:companyName!=null? Text(companyName.toString()+" "+"PVT LTD",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)):Container()
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5, left: 50),
                      child: Text(city.toString()+", "+"Pakistan",
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),
                /*  const Padding(
                      padding: EdgeInsets.only(
                        left: 50,
                        top: 10,
                      ),
                      child: Text("Contact",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700))),
                  Padding(
                      padding: EdgeInsets.only(left: 50,top:5),
                      child: Text(phoneNo.toString(),
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),
                  const Padding(
                      padding: EdgeInsets.only(
                        left: 50,
                        top: 10,
                      ),
                      child: Text("Email Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700))),
                  Padding(
                      padding: EdgeInsets.only(left: 50,top:5),
                      child: Text(email.toString(),
                          style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))),*/

                  Row(children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 10, left: 50, bottom: 0),
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
                            margin: const EdgeInsets.only(top: 10, left: 20),
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
          Padding(

              padding: EdgeInsets.only(top: 514, left: 50, bottom: 30),
              child:  Text(about.toString(),  style: TextStyle(
                color: TextlightGrey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),)),
        ]));
  }
}
class AddPOrtFolio extends StatefulWidget {
  const AddPOrtFolio({super.key});

  @override
  State<AddPOrtFolio> createState() => _AddPOrtFolio();
}

class _AddPOrtFolio extends State<AddPOrtFolio> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 900,
        height: 500,
        margin: const EdgeInsets.only(top: 50, bottom: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: strokeColor)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "Portfolio",
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
                        return const PortFolioDialog();
                      });
                },
                child: Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: strokeColor,
                          width: 1,
                        ),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("Logo/plus.png"))))),
          ]),
          GestureDetector(
              onTap: () {},
              child: Container(
                  width: 80,
                  height: 100,
                  margin: const EdgeInsets.only(top: 120, left: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("Logo/portfolio.png"))))),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
              child: Text(
                "Service Provider who add portfolio to their profile are more likely to win work",
                style: TextStyle(
                  color: TextlightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(top: 10, left: 20, bottom: 0),
              child: Text(
                "Add a Portfolio",
                style: TextStyle(
                  color: Color(0xFFFFA62B),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )),
          // all the boxes are here like skill
          // all the boxes are here like skill
        ]));
  }
}

class AddProposal extends StatefulWidget {
  const AddProposal({super.key});

  @override
  State<AddProposal> createState() => _AddProposal();
}

class _AddProposal extends State<AddProposal> {
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
                        builder: (context) =>  ViewProposalRequestedProposalList(currentUserEmail.toString())));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "View Requested Proposals",
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
                        builder: (context) =>  ViewAcceptedProposalList(currentUserEmail.toString())));
                  },
                  // ignore: sort_child_properties_last
                  child: Row(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: Center(
                          child: Text(
                            "My Accepted Proposals",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "(0)",
                          style:
                              TextStyle(color: Color(0xFFFF9900), fontSize: 16),
                        )),
                  ]),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF363B42)))),
        ),
      ]),
    );
  }
}

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _Offers();
}

class _Offers extends State<Offers> {
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
                  "My Offers",
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
                            builder: (context) =>ProOfferList(currentUserEmail.toString())));
                      },
                      // ignore: sort_child_properties_last
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "My Offers",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
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
                            builder: (context) => const AcceptedOffersMain()));
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

class TrackContract extends StatefulWidget {
  const TrackContract({super.key});

  @override
  State<TrackContract> createState() => _TrackContract();
}

class _TrackContract extends State<TrackContract> {
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
                        builder: (context) => const DesireBuilding()));
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
                          "Completed Contract",
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

class ShowProfileDialog extends StatefulWidget {
  const ShowProfileDialog({super.key});

  @override
  State<ShowProfileDialog> createState() => _ShowProfileDialog();
}

class _ShowProfileDialog extends State<ShowProfileDialog> {
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
                    "Edit Profile Photo",
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
  final _ProAboutFormKey = GlobalKey<FormState>();
  final _aboutController=TextEditingController();
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
            width: 650,
            height: 600,
            child: Form(
              key:_ProAboutFormKey,
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
                                      if(_ProAboutFormKey.currentState!.validate()){
                                        var response=await apiService.InsertAbout(currentUserEmail.toString(),_aboutController.text);
                                        if(response=="200"){
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProViewProfile(currentUserEmail.toString())));
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

                                    if(coverPhotoObject!=null){
                                      setState(() async {
                                        coverPhotoObject =  pickedCoverPhoto.files.first;
                                        String response;
                                        //   if(isEditMode!=true){
                                        response=await apiService.InsertProCoverPhoto(coverPhotoObject!, email.toString());


                                        // response=await apiService.UpdateCoverPhotoData(id.toString(),coverPhotoObject!, );
                                        //  print("Update as Image");



                                        if(response=="200"){
                                          print("Scessfully response");
                                          // Navigator.of(context).pop();
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProViewProfile(currentUserEmail.toString())));

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
                                      response=await apiService.UpdateProProfilePhoto(proId.toString(),editprofilePhotoObject!,);
                                     // print(ownerId.toString());

                                      // response=await apiService.UpdateCoverPhotoData(id.toString(),coverPhotoObject!, );
                                      //  print("Update as Image");



                                      if(response=="200"){
                                        print("Scess fully response");
                                        // Navigator.of(context).pop();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProViewProfile(currentUserEmail.toString())));

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
//------------------------------------------------------------Work Experience----------------------------------------//
String ? titleWorkExperience;
String ? companyNameWorkExperience;
String ? experience;

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperience();
}

class _WorkExperience extends State<WorkExperience> {
  ApiService apiService = new ApiService();
  List<ProWorkExperienceModel> _getProWorkExperience=[];

  void initState(){
    apiService.getProWorkExperience().then((value){
      setState(() {
        _getProWorkExperience.addAll(value);

        for(int i=0;i<_getProWorkExperience.length;i++){
          if( _getProWorkExperience[i].email.toString()==currentUserEmail){
            _getProWorkExperience[i].id.toString();

            titleWorkExperience=  _getProWorkExperience[i].title.toString();
            companyNameWorkExperience=_getProWorkExperience[i].companyName.toString();
            experience=_getProWorkExperience[i].experience.toString();

             print("Title :"+_getProWorkExperience[i].title.toString());
            print("CompanyName             :"+_getProWorkExperience[i].companyName.toString());
            print("Expereince       :" + _getProWorkExperience[i].experience.toString());
            print("Current User Email =:"+currentUserEmail.toString());//set data we get
          }

        }});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50, ),
        width: 900,

        decoration:
        BoxDecoration(

          borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            height: 60,
            width: 900,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightGrey,

            ),
            child: Row(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, bottom: 0),
                    child: Text(
                      "Work Experience",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return showAddExperinceAlertDialog(); //---------calling the class here
                          });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 20, left: 710),
                        decoration: BoxDecoration(
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
              ],
            ),
          ),
              if(titleWorkExperience!=null)
              Padding(
                  padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                  child: Text(
                    "Title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              if(titleWorkExperience!=null)
              Padding(
                  padding: EdgeInsets.only(top: 5, left: 50, bottom: 0),
                  child: Text(
                    titleWorkExperience.toString(),
                    style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              if(titleWorkExperience!=null)
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 50, bottom: 0),
                  child: Text(
                    "Company Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              if(titleWorkExperience!=null)
              Padding(
                  padding: EdgeInsets.only(top: 5, left: 50, bottom: 0),
                  child: Text(
                    companyNameWorkExperience.toString(),
                    style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              if(titleWorkExperience!=null)
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 50, bottom: 0),
                  child: Text(
                    "Experience",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              if(titleWorkExperience!=null)
              Padding(
                  padding: EdgeInsets.only(top: 5, left: 50, bottom: 30),
                  child: Text(
                    experience.toString(),
                    style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              if(titleWorkExperience==null)
                Padding(
                    padding: EdgeInsets.only(top: 5, left: 50, bottom: 30),
                    child: Text(
                     "No item is dipslay" ,
                      style: TextStyle(
                        color: TextlightGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
        ]));
  }
}

class showAddExperinceAlertDialog extends StatefulWidget {
  const showAddExperinceAlertDialog({super.key});

  @override
  State<showAddExperinceAlertDialog> createState() =>
      _showAddExperinceAlertDialogState();
}

class _showAddExperinceAlertDialogState extends State<showAddExperinceAlertDialog> {

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
                                    child:Text(title.toString(),style:TextStyle(fontSize: 14,) ,))),
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
                                    /*  if (!RegExpFirstName.hasMatch(value)) {
                                        return 'Please enter a valid company name';
                                      }*/
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
                                              onPressed: () async {
                                                if( _keyWorkExperience.currentState!.validate()){
                                                  var response=await apiService.InsertProWorkExperience(currentUserEmail.toString(), title.toString(), _companyNameController.text, _workExperienceController.text);
                                                  if(response=="200"){
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                            ProViewProfile(currentUserEmail.toString())));
                                                  }

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

//-----------------------------------------------------End Work Experience---------------------------------------------//


//------------------------------------------------------------Education History----------------------------------------//
String ?school;
String ?qualification;
String ?startYear;
String ?endYear;

class EducationHistory extends StatefulWidget {
  const EducationHistory({super.key});

  @override
  State<EducationHistory> createState() => _EducationHistory();
}

class _EducationHistory extends State<EducationHistory> {
  ApiService apiService = new ApiService();
  List<ProEducationHistoryModel> _getProEducationHistory=[];

  void initState(){
    apiService.getProEducationHistory().then((value){
      setState(() {
        _getProEducationHistory.addAll(value);

        for(int i=0;i<_getProEducationHistory.length;i++){
          if( _getProEducationHistory[i].email.toString()==currentUserEmail){
            _getProEducationHistory[i].id.toString();

            school=  _getProEducationHistory[i].school.toString();
            qualification=_getProEducationHistory[i].qualification.toString();
            startYear=_getProEducationHistory[i].startYear.toString();
            endYear=_getProEducationHistory[i].endYear.toString();

            print("school :"+_getProEducationHistory[i].school.toString());
            print("Qua             :"+_getProEducationHistory[i].qualification.toString());
            print("Start       :" + _getProEducationHistory[i].startYear.toString());
            print("End Year       :" + _getProEducationHistory[i].endYear.toString());
            print("Current User Email =:"+currentUserEmail.toString());//set data we get
          }

        }});
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50, ),
        width: 900,

        decoration:
        BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(

            width: 900,
            height: 60,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightGrey,

            ),
            child: Row(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, bottom: 0),
                    child: Text(
                      "Education History",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return showEducationHistoryAlertDialog(); //---------calling the class here
                          });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 20, left: 700),
                        decoration: BoxDecoration(
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
              ],
            ),

          ),

         Container(width:350,
         margin:EdgeInsets.only(left:50),

             child:Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

               if(school!=null)
                 Padding(
                     padding: EdgeInsets.only(top: 20, left: 0, bottom: 0),
                     child: Text(
                       school.toString(),
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 16,
                         fontWeight: FontWeight.w600,
                       ),
                     )),

               if(school!=null)
                 Padding(
                     padding: EdgeInsets.only(top: 5, left: 0, bottom: 0),
                     child: Text(
                       qualification.toString(), //qualification
                       style: TextStyle(
                         color: Colors.grey,
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                       ),
                     )),
               if(school!=null)
                 Padding(
                     padding: EdgeInsets.only(top: 5, left: 0, bottom: 30),
                     child: Text(
                       startYear.toString()+"-"+endYear.toString(),
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 14,
                         fontWeight: FontWeight.w600,
                       ),
                     )),
               if(school==null)
                 Padding(
                     padding: EdgeInsets.only(top: 5, left: 0, bottom: 30),
                     child: Text(
                       "No item is dipslay" ,
                       style: TextStyle(
                         color: TextlightGrey,
                         fontSize: 14,
                         fontWeight: FontWeight.w500,
                       ),
                     )),

           ],)
         ),

        ]));
  }
}

class showEducationHistoryAlertDialog extends StatefulWidget {
  const showEducationHistoryAlertDialog ({super.key});

  @override
  State<showEducationHistoryAlertDialog > createState() =>
      _showEducationHistoryAlertDialog ();
}

class _showEducationHistoryAlertDialog extends State<showEducationHistoryAlertDialog > {

  final _keyEducationHistory = GlobalKey<FormState>();
  final _qualificationController=TextEditingController();
  final _schoolController=TextEditingController();
  final _startYearController=TextEditingController();
  final _endYearController=TextEditingController();
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
                    key: _keyEducationHistory ,
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
                                    "Education History",
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
                                "School",
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
                                    controller: _schoolController,
                                    decoration: InputDecoration(
                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 11),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        )),
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "School name is Required";
                                      }

                                      return null;
                                    },
                                  ))),
                          Padding(
                              padding:
                              EdgeInsets.only(top: 0, left:10, bottom: 10),
                              child: Text(
                                "Qualification",
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
                                    controller: _qualificationController,
                                    decoration: InputDecoration(
                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 11),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        )),
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "Qualification is Required";
                                      }

                                      return null;
                                    },
                                  ))),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [  Padding(
                            padding:
                            EdgeInsets.only(top: 0, left:10, bottom: 10),
                            child: Text(
                              "Start Year",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          Padding(
                              padding:
                              EdgeInsets.only(top: 0, left:270, bottom: 10),
                              child: Text(
                                "End Year",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),]),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [ Padding(
                                padding: EdgeInsets.only(top: 0, left: 10),
                                child: SizedBox(
                                    width: 310,
                                    child: TextFormField(
                                      // autovalidateMode:AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.name,
                                      controller: _startYearController,

                                      decoration: InputDecoration(


                                          helperText: "",
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 11),


                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          )),
                                      validator: (value){

                                        if(value!.trim().isEmpty){
                                          return "Starting year is Required";

                                        }



                                        return null;
                                      },
                                    ))),
                              //----------------End Date-------------------------//
                              Padding(
                                  padding: EdgeInsets.only(top: 0, left: 20),
                                  child: SizedBox(
                                      width: 310,
                                      child: TextFormField(
                                        // autovalidateMode:AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.name,
                                        controller: _endYearController,

                                        decoration: InputDecoration(


                                            helperText: "",
                                            isDense: true,
                                            contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 11),


                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            )),
                                        validator: (value){

                                          if(value!.trim().isEmpty){
                                            return "Ending year is Required";

                                          }
                                          return null;
                                        },
                                      ))),
                            ],),

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
                                              onPressed: ()async {
                                                if( _keyEducationHistory .currentState!.validate()){
                                                  var response=await apiService.InsertProEducationHistory(currentUserEmail.toString(), _schoolController.text, _qualificationController.text, _startYearController.text, _endYearController.text);
                                                     if(response=="200"){
                                                       Navigator.of(context).push(
                                                           MaterialPageRoute(
                                                               builder: (context) =>
                                                               ProViewProfile(currentUserEmail.toString())));
                                                     }

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

//-----------------------------------------------------End Education History---------------------------------------------//


//------------------------------------------------------------Education History----------------------------------------//
String? skills;
class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _Skills();
}

class _Skills extends State<Skills> {
  ApiService apiService = new ApiService();
  List<ProSkillsModel> _getProEducationHistory=[];

  void initState(){
    apiService.getProSkills().then((value){
      setState(() {
        _getProEducationHistory.addAll(value);

        for(int i=0;i<_getProEducationHistory.length;i++){
          if( _getProEducationHistory[i].email.toString()==currentUserEmail){
            _getProEducationHistory[i].id.toString();

            skills=  _getProEducationHistory[i].skills.toString();




          }

        }});
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50, ),
        width: 900,

        decoration:
        BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF999999))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            height: 60,
            width: 900,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightGrey,

            ),
            child: Row(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, bottom: 0),
                    child: Text(
                      "Skills",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return showSkillsAlertDialog(); //---------calling the class here
                          });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 20, left: 790),
                        decoration: BoxDecoration(
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
              ],
            ),
          ),
          if(skills!=null)
            Padding(
                padding: EdgeInsets.only(top: 20, left: 50, bottom: 0),
                child: Text(
                  "Skills",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          if(skills!=null)
            Padding(
                padding: EdgeInsets.only(top: 5, left: 50, bottom: 30),
                child: Text(
                  skills.toString(),
                  style: TextStyle(
                    color: TextlightGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          if(skills==null)
            Padding(
                padding: EdgeInsets.only(top: 5, left: 50, bottom: 30),
                child: Text(
                  "No item is dipslay" ,
                  style: TextStyle(
                    color: TextlightGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )),
        ]));
  }
}

class showSkillsAlertDialog extends StatefulWidget {
  const showSkillsAlertDialog ({super.key});

  @override
  State<showSkillsAlertDialog > createState() =>
      _showSkillsAlertDialog ();
}

class _showSkillsAlertDialog  extends State<showSkillsAlertDialog > {

  final _keySkills = GlobalKey<FormState>();
  final _skillsController=TextEditingController();

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
                    key: _keySkills,
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
                                    "Add Your Skills",
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
                              EdgeInsets.only(top: 20, left:10, bottom: 10),
                              child: Text(
                                "Enter your Skills",
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
                                    controller: _skillsController,
                                    decoration: InputDecoration(
                                        helperText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 11),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        )),
                                    validator: (value){

                                      if(value!.trim().isEmpty){
                                        return "Skills is Required";
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
                                              onPressed: ()async {
                                                if( _keySkills.currentState!.validate()){
                                                  var response=await apiService.InsertProSkills(currentUserEmail.toString(),_skillsController.text);
                                                  if(response=="200"){
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProViewProfile(currentUserEmail.toString())));
                                                  }


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

//-----------------------------------------------------End Education History---------------------------------------------//