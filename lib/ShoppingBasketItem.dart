import 'dart:ui';

import 'package:flutter/material.dart';

import 'ProductModel.dart';


typedef OnRemove(int index);

class ShoppingBasketItem extends StatefulWidget {

  ProductModel _product;
  int _count = 0;
  int _index;
  OnRemove _onRemove;


  ShoppingBasketItem(this._product , this._onRemove , this._index);

  @override
  _ShoppingBasketItemState createState() => _ShoppingBasketItemState();
}

class _ShoppingBasketItemState extends State<ShoppingBasketItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20 , left: 7),
              child: Image.network(widget._product.imageUrl ,
                width: 100,
              ),
            ) ,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20, top: 20),
                  child: Text(widget._product.productName ,
                  style: TextStyle(
                    fontFamily: "IranSans",
                    color: Colors.black,
                  ),
                  ),
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_right),
                      iconSize: 35,
                      onPressed: () {
                        },
                    ),
                    Text(widget._count.toString(),
                      style: TextStyle(
                        fontFamily: "IranSans",
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_left),
                      iconSize: 35,
                      onPressed: () {
                      },
                    )
                  ],
                )
              ],
            ),
            Expanded(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.airplanemode_inactive),
                      iconSize: 35,
                      onPressed: () {
                        widget._onRemove(widget._index);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10 , left: 10),
                      child: Text(widget._product.price ,
                        style: TextStyle(
                          fontFamily: "IranSans",
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
              )
            )
          ],
        ),
      ),
    );
  }
}
