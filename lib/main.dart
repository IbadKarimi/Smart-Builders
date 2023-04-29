import 'package:flutter/material.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/JoinOwnerPro.dart';
import 'dart:html';
import 'dart:typed_data';

import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_Personal_Info.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_Sign_Up.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/Professionals/ProCommonPages/Pro_View_Profile.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/WorkExperience.dart';

import 'Presentation Layer/Screens/Owner/Owner_View_Profile.dart';

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
      debugShowCheckedModeBanner: false,
      title: "Smart Builder",
      home:  Scaffold(body:ProViewProfile("ibadkarimi.10@gmail.com")),
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
