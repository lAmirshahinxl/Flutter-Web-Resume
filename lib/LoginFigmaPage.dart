import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'Ext.dart';

class LoginFigmaPage extends StatefulWidget {
  @override
  _LoginFigmaPageState createState() => _LoginFigmaPageState();
}

class _LoginFigmaPageState extends State<LoginFigmaPage> {
  var phoneNumberController = TextEditingController();
  var passwordNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        body: LoginUi(context , phoneNumberController , passwordNumberController ),
      ),
    );
  }


}

Widget LoginUi(context , phoneNumberController , passwordController) {

  void clickedOnLoginButton() async{
    if (phoneNumberController.text.toString().length < 11) {
      Fluttertoast.showToast(
          msg: "شماره همراه وارد شده صحیح نمی باشد",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
      );
    } else if(passwordController.text.toString().length < 6) {
      Fluttertoast.showToast(
        msg: "رمز عبور صحیح نمی باشد",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      final param = {
        "phonenumber" : phoneNumberController.text.toString(),
        "Password" : passwordController.text.toString()
      };

      var url = "https://Danje.org/api/identity/SignIn";
      final response = await post(url , body: param);
      var json = jsonDecode(utf8.decode(response.bodyBytes));

      var message = json['messages'].toString().replaceAll('([\[\]])', '');
      print(message);
      print(json['messages'].toString());
      Fluttertoast.showToast(
        msg: json['messages'].toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  return Container(
    color: parseColor("#0F1012"),
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 52,),
          Image.asset("assets/motor_image.png" , width: 600, height: 400,),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 34),
              child: Text("ورود" , style: TextStyle(
                fontFamily: "IranSans",
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 29
              ),),
            )
          ),
          SizedBox(height: 25,),
          Padding(
            padding: EdgeInsets.only(right: 33 , left: 33),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white , width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  height: 54,
                ),
                Container(
                  margin: EdgeInsets.only(right: 45 , left: 40 , top: 2),
                  child: TextField(
                    controller: phoneNumberController,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "IranSans",
                        color: Colors.white,
                    ),
                    textDirection: TextDirection.rtl,
                    cursorColor: Colors.red,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    maxLength: 11,
                    showCursor: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                      hintMaxLines: 1,
                      hintText: "شماره موبایل",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "IranSans",
                          color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(right: 33 , left: 33),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white , width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  height: 54,
                ),
                Container(
                  margin: EdgeInsets.only(right: 45 , left: 40 , top: 2),
                  child: TextField(
                    controller: passwordController,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "IranSans",
                      color: Colors.white,
                    ),
                    textDirection: TextDirection.rtl,
                    cursorColor: Colors.red,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    maxLength: 11,
                    showCursor: false,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintMaxLines: 1,
                      hintText: "رمز عبور",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "IranSans",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Card(
            color: Colors.red,
            elevation: 5,
            margin: EdgeInsets.only(right: 33 , left: 33),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              height: 63,
              child: InkWell(
                onTap: clickedOnLoginButton,
                child: Center(
                  child: Text("ورود" , style: TextStyle(
                    fontSize: 16,
                    fontFamily: "IranSans",
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
          ),
          SizedBox(height: 25,)
        ],
      ),
    ),
  );
}
