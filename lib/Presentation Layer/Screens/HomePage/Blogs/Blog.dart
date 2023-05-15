import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/footer.dart';

import '../header.dart';
import '../home_page.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _Blogs();
}

class _Blogs extends State<Blogs> {
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
                  BlogsFirstPage(),
                  BlogsSecondPage(),
                  CustomSlider(),
                  Footer(),
                ],
              ),
            )));
  }
}

class BlogsFirstPage extends StatefulWidget {
  @override
  State<BlogsFirstPage> createState() => _BlogsFirstPage();
}

class _BlogsFirstPage extends State<BlogsFirstPage> {
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
                      "lib/Presentation Layer/Screens/HomePage/Blogs/BlogImages/Blogs1.jpg"),
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
                                builder: (context) => const Blogs()));
                          }),
                          child: Text(
                            "Blogs",
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
            padding: EdgeInsets.only(top: 360, left: 660, bottom: 0),
            child: Text(
              "Blogs",
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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 40, left: 5, bottom: 0),
              child: Text(
                "Our Blog",
                style: TextStyle(
                  color: Color(0xFFFFA62B),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 20, bottom: 0),
              child: Text(
                "Recent Blog",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              )),
          //----------------------Grey Box------------------------//
          Container(
            margin: EdgeInsets.only(top: 60),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFD9D9D9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                       EdgeInsets.only(top: 100, left: 100, bottom: 50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //---------------- first Row of Blogs starts--------------//
                        Container(
                          width: 250,
                          height: 450,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),
                        Container(
                          width: 250,
                          height: 450,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),
                        Container(
                          width: 250,
                          height: 450,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),
                        Container(
                          width: 250,
                          height: 450,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),
                        Container(
                          width: 250,
                          height: 450,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),

                        //--------------------------------------------End Blogs --------------------------------//
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, left: 700),
                    child: Text(
                      "All Blogs",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 100, bottom: 50, top: 60),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //---------------- Second Row of Blogs starts--------------//
                        Container(
                          width: 250,
                          height: 450,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),
                        Container(
                          width: 250,
                          height: 450,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),
                        Container(
                          width: 250,
                          height: 450,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),
                        Container(
                          width: 250,
                          height: 450,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),
                        Container(
                          width: 250,
                          height: 450,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF3D424A),
                              )),
                          child: Column(children: <Widget>[
                            Container(
                                height: 210,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("RecentBlogImages/1.jpg")),
                                )),
                            SizedBox(height: 20),
                            Row(children: <Widget>[
                              SizedBox(width: 20),
                              Image.asset("RecentBlogImages/admin.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset("RecentBlogImages/comments.png",
                                  width: 10, height: 10),
                              SizedBox(width: 5),
                              Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "Biggest Construction in Islamabad ,Pakistan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Text(
                                  "A small river named Duden flows by their place and supplies it with the necessary regelialia.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF888787),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ]),
                        ),

                        //--------------------------------------------End Blogs --------------------------------//
                      ]),
                ),
                //-----------------Second Row----------------------------//

//----------------------------End here--------------//
              ],
            ),
          )
        ],
      ),
    );
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
