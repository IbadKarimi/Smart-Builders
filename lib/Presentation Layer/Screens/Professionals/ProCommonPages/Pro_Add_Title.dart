import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/CurrentUser.dart';
import '../../HomePage/JoinOwnerPro.dart';
import '../../HomePage/footer.dart';
import '../../HomePage/header.dart';
import '../../UserTitle.dart';
import '../../WorkExperience.dart';


bool titleError=false;
UserTitle userTitle=UserTitle();



class AddTitle extends StatefulWidget {
  const AddTitle({super.key});

  @override
  State<AddTitle> createState() => _AddTitle();
}

class _AddTitle extends State<AddTitle> {
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
                  AddTitleInterface(),
                  Footer(),
                ],
              ),
            )));
  }
}

class AddTitleInterface extends StatefulWidget {
  /*String title;
  void setTitle(String title){
    this.title=title;
  }
  String getTitle(){
    return title;
  }*/
  AddTitleInterface({super.key});

  @override
  State<AddTitleInterface> createState() => _AddTitleInterface();
}

class _AddTitleInterface extends State<AddTitleInterface> {

  @override
  bool isOpen = false;
  String selectedOption = "Select Option";
  List<String> options = [
    "Contractor",
    'Subcontractor',
    'Civil Engineer',
    'Architect',
  ];
  final _titleKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    // List of items in our dropdown menu

    const checkbox = false;
    return Form(
      key: _titleKey,
      child: Container(
          margin: const EdgeInsets.only(top: 60, bottom: 120),
          width: 700,
          height: 700,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF999999))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.only(top: 40, right: 0),
                  child: Text(
                    "Add a title to tell the people what you do",
                    style: TextStyle(
                      color: Color(0xFF3D424A),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.only(top: 40, right: 0),
                  child: Text(
                    "It is the very  first thing client see, so describe your experties",
                    style: TextStyle(
                      color: Color(0xFF3D424A),
                      fontSize: 16,
                    ),
                  )),
              Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      GestureDetector(
                          onTap: () {
                            isOpen = !isOpen;
                            setState(() {});
                          },
                          child: Container(
                            width: 440,
                            height: 35,
                            margin: const EdgeInsets.only(left: 5, top: 0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black38, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedOption),
                                  Icon(
                                      isOpen
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          )),
                      if (isOpen)
                        Container(
                          width: 440,
                          margin: isOpen == true
                              ? EdgeInsets.only(left: 5)
                              : EdgeInsets.only(bottom: 500),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: ListView(
                              primary: true,
                              shrinkWrap: true,
                              children: options
                                  .map((e) => Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              isOpen = false;
                                              selectedOption = e;

                                              setState(() {});
                                            },
                                            child: HoverContainer(
                                                height: 35,
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
                        padding:const EdgeInsets.only(top:10,left:10),
                        child:titleError==true?  Text("Title is Required",style:TextStyle(fontSize: 12,color:Colors.red)):Text(""),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 170, left: 50),
                      child: SizedBox(
                          width: 140,
                          height: 35,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const JoinOwnerPro()));
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
                      padding: const EdgeInsets.only(top: 170, left: 250),
                      child: Container(
                          width: 220,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {

                                if(_titleKey.currentState!.validate() && selectedOption!="Select Option"){
                                  setState(() {

                                    titleError=false;

                                    Navigator.of(context).push(MaterialPageRoute(

                                        builder: (context) => WorkExperience1(selectedOption)));
                                  });
                                }else{
                                  setState(() {
                                    titleError=true;
                                  });
                                }

                              },
                              // ignore: sort_child_properties_last
                              child: Row(children: const <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Next,",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Add your experience",
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
          )),
    );
  }
}
