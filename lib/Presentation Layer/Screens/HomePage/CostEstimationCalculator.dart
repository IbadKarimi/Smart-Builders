import 'package:flutter/material.dart';

import 'footer.dart';
import 'header.dart';



class CostEstimationCalculator extends StatefulWidget {
  const CostEstimationCalculator({super.key});

  @override
  State<CostEstimationCalculator> createState() => _CostEstimationCalculator();
}

class _CostEstimationCalculator extends State<CostEstimationCalculator> {
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
                  CostEstimationCalculatorI(),
                  Footer(),
                ],
              ),
            )));
  }
}

class CostEstimationCalculatorI extends StatefulWidget {
  const CostEstimationCalculatorI({super.key});

  @override
  State<CostEstimationCalculatorI> createState() =>
      _CostEstimationCalculatorI();
}

class _CostEstimationCalculatorI extends State<CostEstimationCalculatorI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 60, left: 270, bottom: 0),
            child: Text(
              "Cost Estimation Calculator",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )),
        Center(
          child: Container(
            width: 1000,
            height: 500,
            margin: EdgeInsets.only(top: 20, left: 00, bottom: 40),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 60,
                width: 1000,
                color: const Color(0xFF363B42),
                child: const Padding(
                    padding: EdgeInsets.only(top: 20, left: 220, bottom: 0),
                    child: Text(
                      "Cost estimation calculator helps to estimate your project budget",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 60, left: 170, bottom: 0),
                      child: Text(
                        "Enter Plot Front Side Length",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  const Padding(
                      padding: EdgeInsets.only(top: 60, left: 200, bottom: 0),
                      child: Text(
                        "Enter Plot Back Side Length",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 250,
                  height: 32,
                  margin: EdgeInsets.only(top: 20, left: 170),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: strokeColor, width: 0.5)),
                  child: Stack(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 0, right: 0),
                          child: Container(
                              width: 250,
                              height: 32,
                              decoration: const BoxDecoration(),
                              child: const TextField(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ))),
                      Container(
                        margin: const EdgeInsets.only(left: 210),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFFA62B),
                        ),
                        child: Container(
                            width: 40,
                            height: 32,
                            decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    top: 5, left: 10, bottom: 0),
                                child: Text(
                                  "ft",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))),
                      )
                    ],
                  ),
                ),
                //---------------------Second Field
                Container(
                  width: 250,
                  height: 32,
                  margin: EdgeInsets.only(top: 20, left: 155),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: strokeColor, width: 0.5)),
                  child: Stack(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 0, right: 0),
                          child: Container(
                              width: 250,
                              height: 32,
                              decoration: const BoxDecoration(),
                              child: const TextField(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ))),
                      Container(
                        margin: const EdgeInsets.only(left: 210),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFFA62B),
                        ),
                        child: Container(
                            width: 40,
                            height: 32,
                            decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    top: 5, left: 10, bottom: 0),
                                child: Text(
                                  "ft",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))),
                      )
                    ],
                  ),
                ),
              ]),
              //---------------------------------------------------------Second Row of right left length
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 20, left: 170, bottom: 0),
                      child: Text(
                        "Enter Plot Left Side Length",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  const Padding(
                      padding: EdgeInsets.only(top: 20, left: 210, bottom: 0),
                      child: Text(
                        "Enter Plot Right Side Length",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 250,
                  height: 32,
                  margin: EdgeInsets.only(top: 20, left: 170),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: strokeColor, width: 0.5)),
                  child: Stack(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 0, right: 0),
                          child: Container(
                              width: 250,
                              height: 32,
                              decoration: const BoxDecoration(),
                              child: const TextField(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ))),
                      Container(
                        margin: const EdgeInsets.only(left: 210),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFFA62B),
                        ),
                        child: Container(
                            width: 40,
                            height: 32,
                            decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    top: 5, left: 10, bottom: 0),
                                child: Text(
                                  "ft",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))),
                      )
                    ],
                  ),
                ),
                //---------------------Second Field
                Container(
                  width: 250,
                  height: 32,
                  margin: EdgeInsets.only(top: 20, left: 155),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: strokeColor, width: 0.5)),
                  child: Stack(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 0, right: 0),
                          child: Container(
                              width: 250,
                              height: 32,
                              decoration: const BoxDecoration(),
                              child: const TextField(
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ))),
                      Container(
                        margin: const EdgeInsets.only(left: 210),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFFFA62B),
                        ),
                        child: Container(
                            width: 40,
                            height: 32,
                            decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    top: 5, left: 10, bottom: 0),
                                child: Text(
                                  "ft",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))),
                      )
                    ],
                  ),
                ),
              ]),
              //------------------------------Buttons
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 100, left: 170),
                      child: Container(
                          width: 140,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {},
                              // ignore: sort_child_properties_last
                              child: Row(children: const <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Center(
                                        child: Text(
                                      "Calculate",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ))),
                              ]),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor: const Color(0xFF363B42))))),
                  Padding(
                      padding: const EdgeInsets.only(top: 100, left: 10),
                      child: SizedBox(
                          width: 140,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                "Reset",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFA62B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              )))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 100, left: 120, bottom: 0),
                          child: Text(
                            "Grand Total :",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 100, left: 20),
                          child: SizedBox(
                              width: 150,
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                )),
                              ))),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ),
        //----------------------------------Second Container
        const Padding(
            padding: EdgeInsets.only(top: 30, left: 270, bottom: 0),
            child: Text(
              "Building Construction Materials",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )),
        Center(
            child: Container(
                width: 1000,
                height: 500,
                margin: EdgeInsets.only(top: 20, left: 00, bottom: 40),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 902,
                        margin: EdgeInsets.only(top: 60, left: 50),
                        color: const Color(0xFF363B42),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 10, bottom: 0),
                                child: Text(
                                  "S.No",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 60, bottom: 0),
                                child: Text(
                                  "Material",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 60, bottom: 0),
                                child: Text(
                                  "Percentage",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 60, bottom: 0),
                                child: Text(
                                  "Quantity",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 60, bottom: 0),
                                child: Text(
                                  "Rate",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 60, bottom: 0),
                                child: Text(
                                  "Amount",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: 902,
                        margin: EdgeInsets.only(left: 50),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFF888787), width: 1)),
                        //-----------------------one Row Multiple Colums-----------------------//
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 40,
                                      width: 50,
                                      margin: EdgeInsets.only(top: 0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                          right: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      height: 40,
                                      width: 50,
                                      margin: EdgeInsets.only(top: 0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                          right: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      height: 40,
                                      width: 50,
                                      margin: EdgeInsets.only(top: 0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                          right: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      height: 40,
                                      width: 50,
                                      margin: EdgeInsets.only(top: 0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                          right: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      height: 40,
                                      width: 50,
                                      margin: EdgeInsets.only(top: 0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                          right: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      height: 40,
                                      width: 50,
                                      margin: EdgeInsets.only(top: 0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                          right: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      height: 40,
                                      width: 50,
                                      margin: EdgeInsets.only(top: 0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                          right: BorderSide(
                                            color: Color(0xFF888787),
                                          ),
                                        ),
                                      )),
                                ]),
                            //-----------------------------------Material Columns starts
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            //-------------------------------------Percentage-----------------------//
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            //----------------------------Quantity---------------------//
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            //-----------------------------Rate--------------------------//
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            //------------------------------Amount----------------------------//
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                                Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(top: 0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xFF888787),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 30, right: 20, bottom: 0),
                              child: Text(
                                "Total Cost :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 30, right: 45),
                              child: SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    )),
                                  ))),
                        ],
                      )
                    ]))),
      ],
    );
  }
}
