import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parking_app/screens/homescreen.dart';
//import 'package:parking_app/screens/homescreen.dart';
//import 'package:parking_app/screens/saved_places.dart';
//import 'package:parking_app/screens/saved_places.dart';


class splashscreen extends StatefulWidget {

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=> BottomNV()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC4DEDF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/pslogo.png'),
            Text('PS SPOT' , style: TextStyle(
              fontSize: 45, 
              color: Colors.black87, 
              fontWeight: FontWeight.bold),  
            ),
            SizedBox(height: 25,),
            Text('chose your own parking' , style: TextStyle(
              fontSize: 25, 
              color: Colors.black87, 
              fontWeight: FontWeight.bold),  
            ),
          ],
        ),
      ),
    );
    
  }
}
