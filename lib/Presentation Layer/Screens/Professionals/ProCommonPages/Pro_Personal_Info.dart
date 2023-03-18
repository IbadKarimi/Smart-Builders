import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../Owner/Owner_Desire_Building.dart';
import 'Pro_Add_Rate.dart';
import 'Pro_Preview_Profile.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class ContractorProfile extends StatefulWidget {
  const ContractorProfile({super.key});

  @override
  State<ContractorProfile> createState() => _ContractorProfile();
}

class _ContractorProfile extends State<ContractorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Boxes(),
                    ContractorProfileInterface(),
                    Footer(),
                  ],
                ))));
  }
}

class ContractorProfileInterface extends StatefulWidget {
  const ContractorProfileInterface({super.key});

  @override
  State<ContractorProfileInterface> createState() =>
      _ContractorProfileInterface();
}

class _ContractorProfileInterface extends State<ContractorProfileInterface> {
  var dropdownvalue;
  bool isOpenCountry = false;
  String selectedOptionCountry = "Pakistan";
  List<String> optionsCountry = ["Pakistan", 'China', 'Srilanka', 'India'];
  @override
  Widget build(BuildContext context) {
    // List of items in our dropdown menu

    const checkbox = false;
    return Container(
        margin: const EdgeInsets.only(top: 60, bottom: 40),
        width: 900,
        height: 1400,
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
              children: <Widget>[
                Container(
                    height: 600,
                    margin: EdgeInsets.only(left: 50, bottom: 530),
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
                        Container(
                          width: 80,
                          height: 80,
                          margin: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                              color: const Color(0xFF3D424A),
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: AssetImage("Logo/CNIC.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10, left: 0),
                            child: Container(
                                width: 150,
                                height: 26,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return uploadCnicAlertDialog();
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
                                              const EdgeInsets.only(left: 0),
                                          child: Text(
                                            "Upload CNIC Photo",
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
                  margin: EdgeInsets.only(left: 100, bottom: 800),
                  height: 300,
                  width: 1,
                  color: Colors.grey,
                ),
                //fields container firstname/lastname
                Container(
                    margin: EdgeInsets.only(left: 20, bottom: 300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.only(
                              top: 0,
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
                            padding: EdgeInsets.only(top: 10, right: 0),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //last name
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 10, right: 0, bottom: 0),
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
                                top: 10, right: 260, bottom: 10),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 0, right: 0, bottom: 10),
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
                                margin: EdgeInsets.only(right: 60),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                top: 40, right: 150, bottom: 0),
                                            child: Text(
                                              "City",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: SizedBox(
                                                width: 180,
                                                height: 32,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  )),
                                                ))),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 0, left: 0, bottom: 0),
                                        child: Column(
                                          children: <Widget>[
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 40,
                                                    right: 80,
                                                    bottom: 10),
                                                child: Text(
                                                  "ZIP/Postal Code",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(right: 0),
                                                width: 180,
                                                height: 32,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  )),
                                                )),
                                          ],
                                        )),
                                  ],
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 110, right: 420, bottom: 10),
                                child: Text(
                                  "Street Address",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 135, right: 110),
                                child: SizedBox(
                                    width: 400,
                                    height: 32,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                    ))),
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
                                        height: 32,
                                        margin: const EdgeInsets.only(
                                            left: 0, top: 0, right: 10),
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
                                    margin: const EdgeInsets.only(left: 0),
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
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 10, right: 440, bottom: 10),
                            child: Text(
                              "Phone No",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //Cnic
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 10, right: 410, bottom: 10),
                            child: Text(
                              "Enter CNIC NO",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //ntn no
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 10, right: 410, bottom: 10),
                            child: Text(
                              "Enter NTN NO",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //checkBox
                        Padding(
                            padding: const EdgeInsets.only(top: 10, right: 160),
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
                                  'if you’re a tax payer enter your NTN number,if not click the check box  ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        //Enter license no
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 20, right: 400, bottom: 10),
                            child: Text(
                              "Enter License NO",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //checkbox
                        Padding(
                            padding: const EdgeInsets.only(top: 10, right: 70),
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
                                  'If you’re contractor must enter license number of your company, if not click the check box  ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        //Enter permit no
                        const Padding(
                            padding: EdgeInsets.only(
                                top: 20, right: 400, bottom: 10),
                            child: Text(
                              "Enter Permit NO",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0, right: 260),
                            child: SizedBox(
                                width: 250,
                                height: 32,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ))),
                        //checkbox
                        Padding(
                            padding: const EdgeInsets.only(top: 10, right: 70),
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
                                  'If you’re contractor must enter permit number of your company, if not click the check box   ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                      ],
                    )), //end of the fields
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(bottom: 50, left: 40),
                    child: SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddRate()));
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
                    padding: const EdgeInsets.only(bottom: 50, left: 390),
                    child: Container(
                        width: 220,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const PreviewProfile()));
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
        ));
  }
}

class uploadPhotoAlertDialog extends StatefulWidget {
  const uploadPhotoAlertDialog({super.key});

  @override
  State<uploadPhotoAlertDialog> createState() => _uploadPhotoAlertDialog();
}

class _uploadPhotoAlertDialog extends State<uploadPhotoAlertDialog> {
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

class uploadCnicAlertDialog extends StatefulWidget {
  const uploadCnicAlertDialog({super.key});

  @override
  State<uploadCnicAlertDialog> createState() => _uploadCnicAlertDialog();
}

class _uploadCnicAlertDialog extends State<uploadCnicAlertDialog> {
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
                    "Edit Your CNIC Picture",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
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
