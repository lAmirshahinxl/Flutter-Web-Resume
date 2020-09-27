import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginUi(),
      ),
    );
  }

  Widget LoginUi(){
    var hint_style = TextStyle(color: Colors.black, fontFamily: "IranSans");
    return Stack(
      children: [
        Image.asset('assets/test_image.jpg'),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 20,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "نام کاربری",
                      hintStyle: hint_style,
                      contentPadding: EdgeInsets.only(left: 30 , bottom: 10 , top: 10 , right: 30),
                      icon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.airplanemode_inactive),
                      )
                    ),
                    controller: usernameController,
                  ),
                ) ,
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 20,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "رمز عبور",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: "IranSans"
                      ),
                      contentPadding: EdgeInsets.only(left: 30 , bottom: 10 , top: 10 , right: 30),
                    ),
                    controller: passwordController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.red,
                  child: InkWell(
                    onTap: (){
                      callMe(username: "09302184230", password: "amirshahinx");
                    },
                    child: Container(
                      height: 50,
                      child: Center(
                          child: Text("ورود" , style: hint_style , textAlign: TextAlign.center,)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
      alignment: AlignmentDirectional.center,
    );
  }

  void callMe({@required String username , @required String password}) async {

    final param = {
      "phonenumber" : "09302184230",
      "Password" : "123456"
    };

    final response = await post(
      "https://Danje.org/api/identity/SignIn",  // change with your url
      body: param,
    );

    if (response.statusCode == 200) {
      print("OK!");
      print(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    else {
      print('Error!');
    }
  }
/*  void sendRequest({@required String username , @required String password}) async {
    var url = "https://Danje.org/api/identity/SignIn";
    var body = jsonEncode({
      'phonenumber' : '09118908255',
      'Password' : '123456789'
    });

    var response = await post(url , headers: {"content-type": "application/json; charset=utf-8"}, body: body);
    print(jsonDecode(utf8.decode(response.bodyBytes)));
  }*/
}
