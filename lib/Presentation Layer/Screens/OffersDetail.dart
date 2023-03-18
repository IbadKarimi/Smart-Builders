import 'package:flutter/material.dart';

import 'HomePage/footer.dart';
import 'HomePage/header.dart';
import 'Professionals/ProCommonPages/Pro_My_Offers.dart';

const lightGrey = Color(0xFFEDEDED);
const strokeColor = Color(0xFF888787);
const TextlightGrey = Color(0xFF888787);

class OfferDetailMain extends StatefulWidget {
  const OfferDetailMain({super.key});

  @override
  State<OfferDetailMain> createState() => _OfferDetailMain();
}

class _OfferDetailMain extends State<OfferDetailMain> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Boxes(),
                    OfferDetail(),
                    Button(),
                    Footer()
                  ],
                ))));
  }
}

class OfferDetail extends StatefulWidget {
  const OfferDetail({super.key});

  @override
  State<OfferDetail> createState() => _OfferDetail();
}

class _OfferDetail extends State<OfferDetail> {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 800,
      height: 520,
      margin: const EdgeInsets.only(top: 80, bottom: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: strokeColor)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
                padding: EdgeInsets.only(top: 50, left: 60, bottom: 0),
                child: Text(
                  "Contract Title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 50, left: 100, bottom: 0),
                child: Text(
                  "House Renovation",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ],
        ),
        //---------------------------------------------------------------//
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
                padding: EdgeInsets.only(top: 20, left: 60, bottom: 0),
                child: Text(
                  "Offer Date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 125, bottom: 0),
                child: Text(
                  "January 23,2022",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ],
        ), //-------------------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
                padding: EdgeInsets.only(top: 20, left: 60, bottom: 0),
                child: Text(
                  "Offer Expires",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 105, bottom: 0),
                child: Text(
                  "January 30,2022",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ],
        ),
        Container(
          height: 1,
          width: 800,
          color: Colors.grey,
          margin: EdgeInsets.only(top: 30),

          //--------------------------------------------------------
        ),
        Padding(
            padding: EdgeInsets.only(top: 20, left: 60, bottom: 0),
            child: Text(
              "My Offer to Zulqarnain",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 20, left: 60, bottom: 0),
            child: Text(
              "Offer",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 60, bottom: 0),
            child: Text(
              "500000",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 60, bottom: 0),
            child: Text(
              "Rate Per Sq ft",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 60, bottom: 0),
            child: Text(
              "350 Per Sq ft",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 60, bottom: 0),
            child: Text(
              "Description ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 60, bottom: 0),
            child: Text(
              '''This is my offer for your proposal if you ‘ll agree on this than ill going to 
build your dream home''',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )),
      ]),
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 30, left: 360, bottom: 30),
            child: Container(
                width: 140,
                height: 35,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyOffersMain()));
                    },
                    // ignore: sort_child_properties_last
                    child: Row(children: const <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Center(
                              child: Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ))),
                    ]),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Color(0xFFFFA62B))))),
      ],
    );
  }
}
