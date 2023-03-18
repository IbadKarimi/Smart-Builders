import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hovering/hovering.dart';

import '../../Owner/OwnerUserSetting/PasswordSecurity.dart';
import '../footer.dart';
import '../header.dart';



const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _Chat();
}

class _Chat extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final menuAction = "";
    final screenWidth = MediaQuery.of(context).size.width;
    final screen = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
        designSize: const Size(1536, 792),
        builder: (context, child) => Scaffold(
            body: SingleChildScrollView(
                scrollDirection:
                    screenWidth > 1500 ? Axis.vertical : Axis.vertical,
                child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Boxes(),
                        SingleChildScrollView(
                          scrollDirection: screenWidth < 1300
                              ? Axis.horizontal
                              : Axis.vertical,
                          child: ChatInterface(),
                        ),
                        Footer(),
                      ],
                    )))));
  }
}

class ChatInterface extends StatefulWidget {
  const ChatInterface({super.key});

  @override
  State<ChatInterface> createState() => _ChatInterface();
}

class _ChatInterface extends State<ChatInterface> {
  @override
  bool isOpen = false;
  bool _isOpen = false;
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    var menuAction;

    return Container(
      width: screenWidth,
      height: 720,
      decoration: BoxDecoration(
        border: Border.all(color: TextlightGrey, width: 0.5),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                  //line container only
                  margin: EdgeInsets.only(top: 60),
                  width: 400,
                  height: 1,
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1),
                        top: BorderSide(color: Colors.white, width: 0)),
                  )),
              Container(
                //first container
                height: 720,
                width: 400,

                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(top: 8),
                        width: 400,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      )),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              isOpen = !isOpen;

                              setState(() {});
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  right: 20, top: 20, left: 100),
                              child: Icon(Icons.more_horiz),
                            ),
                          ),
                          if (isOpen)
                            Container(
                              width: 140,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                              ),
                              child: Row(children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ChatSettingALertDialog(); //alert dialog on logo
                                          });
                                    },
                                    child: Container(
                                        width: 20,
                                        height: 20,
                                        margin: const EdgeInsets.only(
                                            top: 0, left: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "Logo/Setting.png"))))),
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ChatSettingALertDialog(); //alert dialog on text
                                          });
                                    },
                                    child: const Padding(
                                        padding: EdgeInsets.only(
                                            top: 0, left: 20, bottom: 2),
                                        child: Text(
                                          "Setting",
                                          style: TextStyle(
                                            color: strokeColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ))),
                              ]),
                            ),
                        ],
                      )),
                    ]),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 200, left: 60, bottom: 0),
                  child: Center(
                      child: Text(
                    "Your chat rooms will appear here",
                    style: TextStyle(
                      color: TextlightGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ))),
            ],
          ),
          //----------------------------Second Container
          Container(
              height: 720,
              width: 800,
              margin: const EdgeInsets.only(left: 00),
              decoration: BoxDecoration(
                border: Border.all(color: TextlightGrey, width: 0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.only(top: 200),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Logo/ChatLogo.png")),
                    ),
                  )),
                  const Padding(
                      padding: EdgeInsets.only(top: 10, left: 30, bottom: 0),
                      child: Center(
                          child: Text(
                        '''Once you connect with a client, you'll be
     able to chat and collaborate here.''',
                        style: TextStyle(
                          color: TextlightGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ))),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, bottom: 0),
                          child: Center(
                              child: Text(
                            "To get started,",
                            style: TextStyle(
                              color: TextlightGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ))),
                      Padding(
                          padding: EdgeInsets.only(top: 10, left: 5, bottom: 0),
                          child: Center(
                              child: Text(
                            "search for professional",
                            style: TextStyle(
                              color: Color(0xFFFFA62B),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ))),
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 0, left: 20, bottom: 0),
                      child: Center(
                          child: Text(
                        "and submit job proposals.",
                        style: TextStyle(
                          color: TextlightGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ))),
                ],
              )),
        ],
      ),
    );
  }
}

class ChatSettingALertDialog extends StatefulWidget {
  const ChatSettingALertDialog({super.key});

  @override
  State<ChatSettingALertDialog> createState() => _ChatSettingALertDialog();
}

class _ChatSettingALertDialog extends State<ChatSettingALertDialog> {
  _ChatSettingALertDialog() {
    _selectedValue = questionItems[0]; // default value placed here
    //default value set in constructor
  }
  String question = "Your Mother Maiden Name";
  final questionItems = [
    "Your Mother Maiden Name",
    'Your First Pets Name',
    'Your Best Friend Nick Name"',
    'Your Favorites Singer',
  ];
  //------------------first drop down----//
  bool isOpen = false;
  String selectedOption = "Select Option";
  List<String> options = [
    "All activity",
    'Important activity',
    'Nothing',
  ];

  //-----------------Second drop down------------//
  bool isOpenMessageCounter = false;
  String selectedOptionMessageCounter = "Select Option";
  List<String> optionsMessageCounter = [
    "All activity",
    'Important activity',
    'Nothing',
  ];
  //-----------------Third drop down------------//
  bool isOpenSendEmail = false;
  String selectedOptionSendEmail = "Select Option";
  List<String> optionsSendEmail = [
    "All activity",
    'Important activity',
    'Nothing',
  ];
  //-----------------4th drop down------------//
  bool isOpenEveryMinute = false;
  String selectedEveryMinute = "Select Option";
  List<String> optionsEveryMinute = [
    "Immediately",
    'Every 15 minutes',
    'Once an hour',
    'Once a day',
  ];

  String _selectedValue = "";

  String _selectedValueMessageCounter = "";
  // new selected  value intialized here
  final answerController = TextEditingController(); // controller text
  final checkbox = false;
  @override
  Widget build(BuildContext context) {
    int? _value = 1;
    final _formKey = GlobalKey<FormState>(); // form global key
    // List of items in our dropdown menu

    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.only(left: 0, top: 20),
                          child: Text(
                            "Message Setting",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            '''Desktop alerts are not enabled on this browser.Click here to enable
desktop alerts.''',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 10, right: 0, bottom: 0),
                          child: Text(
                            "Show desktop notification for :",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      //-----first drop down----------//
                      Padding(
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
                                  width: 300,
                                  height: 35,
                                  margin:
                                      const EdgeInsets.only(left: 0, top: 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                width: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black38, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.only(left: 0),
                                child: ListView(
                                    primary: true,
                                    shrinkWrap: true,
                                    children: options
                                        .map((e) => Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    isOpen = false;
                                                    selectedOption = e;
                                                    setState(() {});
                                                  },
                                                  child: HoverContainer(
                                                      height: 35,
                                                      hoverDecoration:
                                                          BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xFFFFA62B),
                                                            width: 1),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
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
                      ),
                      //------------------------check box--------------------------//
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 0),
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                value: checkbox,
                                onChanged: (value) {
                                  value = true;
                                  setState(() {
                                    //value = true;
                                  });
                                },
                              ),
                              const Text(
                                'Also play a sound',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                      //----------------------------Second Drop Down----------------//
                      const Padding(
                          padding: EdgeInsets.only(top: 5, right: 0, bottom: 0),
                          child: Text(
                            "Increment message counter for:",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            GestureDetector(
                                onTap: () {
                                  isOpenMessageCounter = !isOpenMessageCounter;
                                  setState(() {});
                                },
                                child: Container(
                                  width: 300,
                                  height: 35,
                                  margin:
                                      const EdgeInsets.only(left: 0, top: 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(selectedOption),
                                        Icon(
                                            isOpenMessageCounter
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                )),
                            if (isOpenMessageCounter)
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black38, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.only(left: 0),
                                child: ListView(
                                    primary: true,
                                    shrinkWrap: true,
                                    children: optionsMessageCounter
                                        .map((e) => Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    isOpenMessageCounter =
                                                        false;
                                                    selectedOptionMessageCounter =
                                                        e;
                                                    setState(() {});
                                                  },
                                                  child: HoverContainer(
                                                      height: 35,
                                                      hoverDecoration:
                                                          BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xFFFFA62B),
                                                            width: 1),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
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
                      ),
                      //------------------------check box--------------------------//
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 0),
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                value: checkbox,
                                onChanged: (value) {
                                  value = true;
                                  setState(() {
                                    //value = true;
                                  });
                                },
                              ),
                              const Text(
                                'Also play a sound',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                      //----------------------------Third Drop Down----------------//
                      const Padding(
                          padding: EdgeInsets.only(top: 5, right: 0, bottom: 0),
                          child: Text(
                            "Send an email for:",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            GestureDetector(
                                onTap: () {
                                  isOpenSendEmail = !isOpenSendEmail;
                                  setState(() {});
                                },
                                child: Container(
                                  width: 300,
                                  height: 35,
                                  margin:
                                      const EdgeInsets.only(left: 0, top: 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(selectedOption),
                                        Icon(
                                            isOpenSendEmail
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                )),
                            if (isOpenSendEmail)
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black38, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.only(left: 0),
                                child: ListView(
                                    primary: true,
                                    shrinkWrap: true,
                                    children:
                                        optionsSendEmail //----------------list here----------------//
                                            .map((e) => Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        isOpenMessageCounter =
                                                            false;
                                                        selectedOptionMessageCounter =
                                                            e;
                                                        setState(() {});
                                                      },
                                                      child: HoverContainer(
                                                          height: 35,
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
                                                                    .all(8.0),
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
                      ),
                      //-----------------------4th drop down-----------------------------//

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            GestureDetector(
                                onTap: () {
                                  isOpenEveryMinute = !isOpenEveryMinute;
                                  setState(() {});
                                },
                                child: Container(
                                  width: 300,
                                  height: 35,
                                  margin:
                                      const EdgeInsets.only(left: 0, top: 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(selectedOption),
                                        Icon(
                                            isOpenEveryMinute
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                )),
                            if (isOpenEveryMinute)
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black38, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.only(left: 0),
                                child: ListView(
                                    primary: true,
                                    shrinkWrap: true,
                                    children:
                                        optionsEveryMinute //----------------list here----------------//
                                            .map((e) => Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        isOpenMessageCounter =
                                                            false;
                                                        selectedOptionMessageCounter =
                                                            e;
                                                        setState(() {});
                                                      },
                                                      child: HoverContainer(
                                                          height: 35,
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
                                                                    .all(8.0),
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
                      ),

                      //------------------- first radio buttons
                      const Padding(
                          padding: EdgeInsets.only(left: 0, top: 5),
                          child: Text(
                            "In message composer pressing enter key will",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 5, left: 0),
                                    child: Text("Send message",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14))),
                              ])),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 5, left: 0),
                                    child: Text("Add a line break",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14))),
                                const SizedBox(
                                  width: 10,
                                )
                              ])),
                      //-----------------------------------Second radios button
                      const Padding(
                          padding: EdgeInsets.only(left: 0, top: 10),
                          child: Text(
                            "When a link is shared in a message",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 5, left: 0),
                                    child: Text("Show a preview",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14))),
                                const SizedBox(
                                  width: 10,
                                )
                              ])),
                      Padding(
                          padding: const EdgeInsets.only(top: 5, left: 0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 5, left: 0),
                                    child: Text("Dont show a preview",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14))),
                              ])),

                      //-------------------------end of radio button

                      Row(
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, left: 200),
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
                                        backgroundColor:
                                            const Color(0xFFD9D9D9),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      )))),
                          Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Container(
                                  width: 140,
                                  height: 35,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        // User user = User();
                                        // user.answerData = answerController.text;
                                        // user.dropDownData =
                                        // _selectedValue as String;
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PasswordSecurity()));
                                        //  Details(user: user)));
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
                                              ),
                                            ))),
                                      ]),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          backgroundColor:
                                              const Color(0xFFFFA62B))))),
                        ],
                      ),
                    ],
                  )),
            )));
  }
}
