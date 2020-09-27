import 'package:flutter/material.dart';
import 'ProductModel.dart';
import 'ShoppingBasketData.dart';

class DescriptionPage extends StatelessWidget {

  ProductModel _model;

  DescriptionPage(this._model);

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
        leading: IconButton(
          onPressed: (){
            onBackPress(context);
          },
          icon: Icon(
            Icons.arrow_back ,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white70,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20 ,top: 5),
            child: Align(
              child: Text(
                _model.productName ,
              style: TextStyle(
                fontSize: 15,
                fontFamily: "IranSans",
                color: Colors.red[900]
              ),),
              alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){

            },
            child: Hero(
              tag: "heroname2",
              child: Image.network(_model.imageUrl ,
                alignment: Alignment.center,
                height: 200,
                width: 200,),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Align(
              child: Text(
                _model.price ,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "IranSans",
                    color: Colors.red
                ),),
              alignment: Alignment.center,
            ),
          ),
          Align(
            child: Text(
              _model.productName ,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "IranSans",
                  color: Colors.black
              ),),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            child: Text(
              _model.description ,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "IranSans",
                  color: Colors.grey[700]
              ),),
            alignment: Alignment.center,
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: (){
                  ShoppingBasketData.getInstance().listItems.add(_model);
                  print("add " + _model.productName );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Text(
                      "افزودن به سبد خرید" ,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "IranSans",
                          color: Colors.white
                      ),),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  void onBackPress(context){
    Navigator.of(context).pop();
  }
}
