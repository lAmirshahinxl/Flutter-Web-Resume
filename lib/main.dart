import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'BottomNavigator.dart';
import 'DescriptionPage.dart';
import 'HomeDanjePage.dart';
import 'LoginFigmaPage.dart';
import 'MapPage.dart';
import 'ProductModel.dart';
import 'ShoppingBasketPage.dart';

void main() {runApp(MainMaterial());}


class MainMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Store()
    );
  }
}


class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List<ProductModel> _models = [];
  @override
  void initState() {
    super.initState();
    fetchItems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "فروشگاه" ,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "IranSans",
              fontSize: 20
          ),
        ),
        centerTitle: true,
        leading: InkWell(
            child: Icon(Icons.arrow_back , color: Colors.black,) ,
            onTap: (){
              /*Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));*/
              Navigator.of(context).push(PageTransition(type: PageTransitionType.rippleLeftUp, child: LoginFigmaPage()
              , duration: Duration(seconds: 2)));
            }),
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_basket, color: Colors.black,),
            onPressed: (){
              Navigator.of(context).push(PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (context, animation, secondaryAnimation) => ShoppingBasketPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
                    child: child,
                    position: Tween<Offset>(
                        begin: Offset(0.5, 0.5),
                        end: Offset(0, 0)).animate(CurvedAnimation(
                      parent: animation ,
                      curve: Curves.easeInExpo
                    ))
                ),
              ));
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(_models.length, (int position){
            return genrateItem(_models[position] , context);
          }),
      ),
      ),
      bottomNavigationBar: BottomNavigator(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context).push(PageTransition(child: HomeDanjePage(), type: PageTransitionType.rippleRightDown, duration: Duration(seconds: 1)));
        },
        child: SvgPicture.asset("assets/test_icon2.svg"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void fetchItems() async {
    var url = "http://welearnacademy.ir/flutter/products_list.json";
    Response response = await get(url);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    print(response.statusCode);
    print(json);
    setState(() {
      for (var i in json){
        _models.add(ProductModel(i['product_name'] , i['image_url'],  i['id'] , i['price'], i['off'] , i['description']));
      }
    });
  }
}

Card genrateItem(ProductModel model , context ) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
    ),
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DescriptionPage(model)
        ));
      },
      child: Center(
        child: Column(
          children: [
            Container(
              height: 90,
              width: 90,
              child: Image.network(model.imageUrl),
            ),
            Text(model.productName ,
              style: TextStyle(
              fontFamily: "IranSans",
              color: Colors.red[700],
              fontSize: 20
              ),
            ),
            Text(model.price ,
              style: TextStyle(
                  fontFamily: "IranSans",
                  color: Colors.black,
                  fontSize: 13
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
