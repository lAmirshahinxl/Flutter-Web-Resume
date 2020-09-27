import 'package:flutter/material.dart';

import 'ShoppingBasketData.dart';
import 'ShoppingBasketItem.dart';

class ShoppingBasketPage extends StatefulWidget {
  @override
  _ShoppingBasketPageState createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "فروشگاه",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "IranSans",
              fontSize: 20
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.black,),
        backgroundColor: Colors.white70,
        elevation: 0,
      ),
      body: BasketUi(),
    );
  }

  Widget BasketUi(){
    if (ShoppingBasketData.getInstance().listItems.length < 1){
      return Text("ایتیمی جهت نمایش موجود نمی باشد");
    }
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: ShoppingBasketData.getInstance().listItems.length,
      itemBuilder: (context, position) {
        return GestureDetector(
          child: ShoppingBasketItem(ShoppingBasketData.getInstance().listItems[position] , onRemove, position ),
        );
      },
    );
  }

  void onRemove(int index){
    setState(() {
      ShoppingBasketData.getInstance().listItems.removeAt(index);
    });
  }
}


