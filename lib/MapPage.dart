import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  void onComplete(GoogleMapController controller){
    _controller.complete();
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
        leading: Icon(Icons.arrow_back , color: Colors.black,),
        backgroundColor: Colors.white70,

        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          onMapCreated: onComplete,
          initialCameraPosition: CameraPosition(
            target: LatLng(36.5229531 , 53.0113115)
          ),
        ),
      ),
    );
  }
}
