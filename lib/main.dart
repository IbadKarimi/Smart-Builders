import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:html';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/HiringProfessionals/Contractors.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/JoinOwnerPro.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Proposals_Service_Providers.dart';
import 'dart:html';
import 'dart:typed_data';

import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_Personal_Info.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_Sign_Up.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_View_Profile.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_View_Requested_Proposals.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_View_Requested_Proposals_List.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/WorkExperience.dart';

import 'Presentation Layer/Screens/HomePage/MaterialStores/MaterialStoresImages/RetailerViewProfile.dart';
import 'Presentation Layer/Screens/Owner/Owner_Submitted_Proposals_List.dart';
import 'Presentation Layer/Screens/Owner/Owner_View_Profile.dart';
import 'Presentation Layer/Screens/Owner/Owner_View_Submitted_Proposals.dart';
import 'models/DataModels.dart';

//import 'mongodb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: "Smart Builder",
      home: Scaffold(body:RetailerViewProfile("hamza10@gmail.com")),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  GlobalKey menuKey = GlobalKey();

  showMenus(BuildContext context) async {
    final render = menuKey.currentContext!.findRenderObject() as RenderBox;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          render.localToGlobal(Offset.zero).dx,
          render.localToGlobal(Offset.zero).dy + 50,
          double.infinity,
          double.infinity),
      items: [
        PopupMenuItem(
            height: 20,
            child: Container(
              width: 20,
              height: 30,
              color: Colors.red,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: menuKey,
      color: Colors.lightBlueAccent,
      constraints: BoxConstraints(
        minWidth: 100,
        minHeight: 50,
      ),
      child: GestureDetector(
        onTap: () {
          showMenus(context);
        },
        child: Text('Solutions'),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  List<String> data = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
    'Jackfruit',
    'Kiwi',
    'Mango',
    'Mango',
    'Nectarine',
    'Orange',
    'Papaya',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tomato',
    'Ugli Fruit',
    'Watermelon',
  ];

  List<String> filteredData = [];

  @override
  void initState() {
    filteredData.addAll(data);
    super.initState();
  }

  void filterData(String query) {
    setState(() {
      filteredData = data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                searchQuery = value;
                filterData(searchQuery);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (BuildContext context, int index) {
                String item = filteredData[index];
                return ListTile(
                  title: RichText(
                    text: TextSpan(
                      text: item.substring(0, searchQuery.length),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                          text: item.substring(searchQuery.length),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}






/*class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  List<List<TextEditingController>> _textControllers = [[]];

  void _addFormFields() {
    _textControllers.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]);
    setState(() {});
  }

  @override
  void dispose() {
    for (var controllerList in _textControllers) {
      for (var controller in controllerList) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (var row in _textControllers) {
      for (var controller in row) {
        print(controller.text);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Fields Example'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: _textControllers.length,
              itemBuilder: (context, index) {
                List<TextEditingController> controllerList = _textControllers[index];
                return Row(
                  children: [
                    for (var i = 0; i < controllerList.length; i++)
                      SizedBox(
                        width:100,
                        child: TextFormField(
                          controller: controllerList[i],
                          decoration: InputDecoration(
                            labelText: 'Field ${index * 3 + i + 1}',
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFormFields,
        child: Icon(Icons.add),
      ),
    );
  }
}*/
class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  List<DataModel> _dataList = [];

  void _addFormField() {
    setState(() {
      _dataList.add(DataModel(material: '', date: DateTime.now(), amount: 0.0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Fields Example'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: _dataList.length,
              itemBuilder: (context, index) {

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(
                            left: 10,top:40
                        ),
                        child: Text(
                          "Material Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(
                            left: 152,top:40
                        ),
                        child: Text(
                          "Date",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    const Padding(
                        padding: EdgeInsets.only(
                            left: 260,top:40
                        ),
                        child: Text(
                          "Amount",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ]),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:EdgeInsets.only(top:10),
                          width: 250,
                          child: TextFormField(
                            decoration: InputDecoration(


                                helperText: "",
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            onChanged: (value) {
                              setState(() {
                                _dataList[index].material = value;
                              });
                            },

                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10, left: 30),
                            child: Container(
                              width: 250,
                              height: 32,


                              child:   Padding(
                                  padding: EdgeInsets.only(
                                      left: 10,top:8
                                  ),
                                  child: Text(
                                   "12-02-2023",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(10),
                                  border:Border.all(color:Colors.grey,width: 1)
                              ),
                            )),

                        Container(
                          width: 250,
                          margin:EdgeInsets.only(top:10,left:30),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _dataList[index].amount = double.parse(value);
                              });
                            },
                            decoration: InputDecoration(


                                helperText: "",
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 11),


                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFormField,
        child: Icon(Icons.add),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Submit'),
        ),
      ],
    );
  }
}









