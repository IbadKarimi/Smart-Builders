import 'package:flutter/material.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/HiringProfessionals/Contractors.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/JoinOwnerPro.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Owner/Owner_Proposals_Service_Providers.dart';
import 'dart:html';
import 'dart:typed_data';

import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_Personal_Info.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_Sign_Up.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_View_Profile.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/WorkExperience.dart';

import 'Presentation Layer/Screens/Owner/Owner_Submitted_Proposals.dart';
import 'Presentation Layer/Screens/Owner/Owner_View_Profile.dart';
import 'Presentation Layer/Screens/Owner/Owner_View_Submitted_Proposals.dart';

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
      theme:  ThemeData(
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
      home:  Scaffold(body:OwnerViewProfile("bilal@gmail.com")),
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
      filteredData = data.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
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
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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

