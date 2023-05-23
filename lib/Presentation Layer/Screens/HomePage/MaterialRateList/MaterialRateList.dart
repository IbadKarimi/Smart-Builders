import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/models/MaterialStoresModel.dart';

import '../../../../BuisnessLogic Layer/Api.dart';
import '../footer.dart';
import '../header.dart';
import '../home_page.dart';

String? ratesId;
class MaterialRateList extends StatefulWidget {
  const MaterialRateList({super.key});

  @override

  State<MaterialRateList> createState() => _MaterialRateList();
}

class _MaterialRateList extends State<MaterialRateList> {
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();


  List<MaterialRateModel> _getMaterialRate=[];



  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());

    apiService.getMaterialRate().then((value){
      setState(() {
        _getMaterialRate.addAll(value);
        for(int index=0;index<_getMaterialRate.length;index++) {
          if (_getMaterialRate[index].email.toString()=='ali@gmail.com') {

            ratesId=_getMaterialRate[index].sId.toString();




          }
        }//set data we get
        //set data we get
      });
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ratesId!=null? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Boxes(),
                  MaterialRateListFirstPage(),
                  BlogsSecondPage(),
                  Footer(),
                ],
              ),
            )):Center(child: Padding(
              padding: const EdgeInsets.only(top:50),
              child: CircularProgressIndicator(),
            )));
  }
}

class MaterialRateListFirstPage extends StatefulWidget {
  @override
  State<MaterialRateListFirstPage> createState() =>
      _MaterialRateListFirstPage();
}

class _MaterialRateListFirstPage extends State<MaterialRateListFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 800,
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 10,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF888787),
                    BlendMode.modulate,
                  ),
                  image: AssetImage(
                      "lib/Presentation Layer/Screens/HomePage/MaterialRateList/MaterialRateListImages/Materials.jpg"),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350, left: 700),
          child: Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                      child: GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          }),
                          child: Text(
                            "Home",
                            style: TextStyle(
                              color: Color(0xFFFFA62B),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                      child: Text(
                        ">",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                      child: GestureDetector(
                          onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const MaterialRateList()));
                          }),
                          child: Text(
                            "Material Rate List",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0),
                      child: Text(
                        ">",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        //--------------------------------------//

        Padding(
            padding: EdgeInsets.only(top: 360, left: 500, bottom: 0),
            child: Text(
              "Material Rate List",
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w600,
              ),
            )),
        //--------------------------------------------//

        //---------------Row dual color text------------------//,
      ],
    );
  }
}

class BlogsSecondPage extends StatefulWidget {
  @override
  State<BlogsSecondPage> createState() => _BlogsSecondPage();
}

class _BlogsSecondPage extends State<BlogsSecondPage> {
  ApiService apiService = new ApiService();
  //CurrentUser currentUserEmailObject=CurrentUser();


  List<MaterialRateModel> _getMaterialRate=[];



  void initState() {
    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());

    apiService.getMaterialRate().then((value){
      setState(() {
        _getMaterialRate.addAll(value);
       //set data we get
        //set data we get
      });
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(children: [
              Padding(
                  padding: EdgeInsets.only(top: 30, left: 50, bottom: 0),
                  child: Text(
                    "Material Rate List",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  )),

              //---------------------Material Rate List Box--------------------//

              Center(
                child: Container(
                  width: 960,
                  height: 900,
                  margin: EdgeInsets.only(top: 80,),
                  decoration: BoxDecoration(

                      border: Border.all(
                    color: TextlightGrey,
                  )),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 0),
                          child: Center(
                            child: Text(
                              "Rate List",
                              style: TextStyle(
                                color: Color(0xFFFFA62B),
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Container(
                              height: 60,
                              width: 240,
                              margin: EdgeInsets.only(top: 40),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                  bottom: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                  right: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                ),
                              ),
                              child: const Padding(
                                  padding:
                                      EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                  child: Center(
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )),
                            ),
                            Container(
                              height: 60,
                              width: 240,
                              margin: EdgeInsets.only(top: 40),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                  bottom: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                  right: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                ),
                              ),
                              child: const Padding(
                                  padding:
                                      EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                  child: Center(
                                    child: Text(
                                      "Price",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )),
                            ),
                            Container(
                              height: 60,
                              width: 240,
                              margin: EdgeInsets.only(top: 40),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                  bottom: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                  right: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                ),
                              ),
                              child: const Padding(
                                  padding:
                                      EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                  child: Center(
                                    child: Text(
                                      "Unit",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )),
                            ),
                            Container(
                              height: 60,
                              width: 238,
                              margin: EdgeInsets.only(top: 40),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                  bottom: BorderSide(
                                    color: Color(0xFF888787),
                                  ),
                                ),
                              ),
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 0, left: 0, bottom: 0),
                                  child: Center(
                                    child: Text(
                                      "Updated On",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        //---------------image /Name /Price/Unit
                        for(int index=0;index<_getMaterialRate.length;index++)
                          if (_getMaterialRate[index].email.toString()=='ali@gmail.com')
                            Container(
                          height: 180,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              color: Color(0xFF888787),
                            )),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //------------------------Steel Picture------------------//

                              //--------------------------COntainer Name---------------------//
                              Container(
                                height: 60,
                                width: 220,
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xFF888787),
                                  ),
                                ),
                                child:Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, left: 0, bottom: 0),
                                    child: Center(
                                      child: Text(
                                        _getMaterialRate[index].materialName.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )),
                              ),
                              //--------------price
                              //--------------------------COntainer Name---------------------//
                              Container(
                                height: 60,
                                width: 220,
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xFF888787),
                                  ),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, left: 0, bottom: 0),
                                    child: Center(
                                      child: Text(
                                    _getMaterialRate[index].amount.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )),
                              ),
                              //------------unit
                              //--------------------------COntainer Name---------------------//
                              Container(
                                height: 60,
                                width: 220,
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFF888787),
                                  ),
                                ),
                                child:  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, left: 0, bottom: 0),
                                    child: Center(
                                      child: Text(
                                 _getMaterialRate[index].unit.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )),
                              ),
                              //----------Date
                              //--------------------------COntainer Name---------------------//
                              Container(
                                height: 60,
                                width: 220,
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFF888787),
                                  ),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 0, left: 0, bottom: 0),
                                    child: Center(
                                      child: Text(
                                      _getMaterialRate[index].date.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        //-------------------Image/Name /Price ends here row----------------//
                      ]),
                ),
              ),
              const SizedBox(
                height: 300,
              )
            ]),

          ],
        ));
  }
}

class CustomSlider extends StatefulWidget {
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 60, left: 600),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 8, right: 0, bottom: 0),
                child: Text(
                  "<",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          HoverContainer(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            hoverDecoration: BoxDecoration(
                color: Color(0xFFFFA62B),
                borderRadius: BorderRadius.circular(5)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 12, right: 0, top: 4),
                child: Text(
                  "1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          HoverContainer(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            hoverDecoration: BoxDecoration(
                color: Color(0xFFFFA62B),
                borderRadius: BorderRadius.circular(5)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 12, right: 0, top: 4),
                child: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          HoverContainer(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            hoverDecoration: BoxDecoration(
                color: Color(0xFFFFA62B),
                borderRadius: BorderRadius.circular(5)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 12, right: 0, top: 4),
                child: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          HoverContainer(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            hoverDecoration: BoxDecoration(
                color: Color(0xFFFFA62B),
                borderRadius: BorderRadius.circular(5)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 12, right: 0, top: 4),
                child: Text(
                  "4",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Padding(
                padding: EdgeInsets.only(left: 8, right: 0, bottom: 0),
                child: Text(
                  ">",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

