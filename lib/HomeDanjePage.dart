import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_basics/icons/danje_icons_icons.dart';

import 'Ext.dart';

class HomeDanjePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Danje(),
    );
  }
}



class Danje extends StatefulWidget {
  @override
  _DanjeState createState() => _DanjeState();
}

class _DanjeState extends State<Danje> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: Container(
          color: parseColor("0F1012"),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.only(left: 33 , right: 33),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          child: Image.asset("assets/ic_menu.png"),
                        onTap: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                      Image.asset("assets/logo_image.png"),
                      Icon(Icons.shopping_basket, color: Colors.white,),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                SizedBox(
                    height: 67.0,
                    width: 350,
                    child: Carousel(
                      images: const [
                        const NetworkImage("http://s14.picofile.com/file/8408124700/capture.png"),
                        const NetworkImage("http://s14.picofile.com/file/8408124700/capture.png"),
                        const NetworkImage("http://s14.picofile.com/file/8408124700/capture.png"),
                      ],
                      dotSize: 5.0,
                      dotSpacing: 15.0,
                      dotColor: Colors.grey,
                      indicatorBgPadding: 5.0,
                      borderRadius: true,
                      radius: Radius.circular(10),
                      autoplayDuration: Duration(seconds: 15),
                    )
                ),
                SizedBox(height: 29,),
                Padding(
                  padding: EdgeInsets.only(left: 33 , right: 33),
                  child: SizedBox(
                    height: 40,
                    child: Card(
                      color: parseColor("#3F3F41"),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 14,  fontFamily: "IranSans", ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        showCursor: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " .. جست و جو",
                          counterText: "",
                          hintStyle: TextStyle(
                              color: parseColor("#C0C0C0"),
                              fontFamily: "IranSans",
                              fontSize: 14
                          ),

                          contentPadding: EdgeInsets.only(left: 30 , bottom: 15 , top: 0 , right: 30),
                        ),
                        maxLines: 1,
                        maxLength: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


