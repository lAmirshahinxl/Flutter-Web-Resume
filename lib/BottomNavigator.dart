import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2-30,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home , color: Colors.blueGrey,),
                  Icon(Icons.person, color: Colors.blueGrey,)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2-30,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search , color: Colors.blueGrey,),
                  Icon(Icons.shopping_basket , color: Colors.blueGrey,)
                ],
              ),
            ),
          ],
        ),
      ),
      shape: CircularNotchedRectangle(),
      notchMargin: 10.0,
      clipBehavior: Clip.antiAlias,
    );
  }
}
