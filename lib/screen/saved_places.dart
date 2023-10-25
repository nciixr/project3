import 'package:path/path.dart' as Path;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class saved_places extends StatefulWidget {

  @override
  State<saved_places> createState() => _saved_placesState();

}
class _saved_placesState extends State<saved_places> {
  // void saved(){
  //   Navigator.of(context).pushReplacementNamed('saved_places');
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffdfa),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 235, 235),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.black87,),
                            hintText: "Search your saved place",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 15)
                        )
                    ),
                  ),
                  /*/SizedBox(
                  height: 10,
                )*/
                ],
              ),
            ),
            /*SizedBox(
            height: 20,
          ),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  SizedBox(
                    height: 15,
                    child: Text('Famous Places' ,
                      style: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.bold),),
                  ),
                  //Text('Famous Places' , style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  //SizedBox(height: 15,),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        famousPlaces('assets/images/blvd.png', ImageSize: 200),
                        famousPlaces('assets/images/KAFD.jpg', ImageSize: 200),
                        famousPlaces('assets/images/Rpark.png', ImageSize: 200),
                        famousPlaces('assets/images/blvd.png', ImageSize: 200),
                        famousPlaces('assets/images/KAFD.jpg', ImageSize: 200),
                        famousPlaces('assets/images/Rpark.png', ImageSize: 200),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                    child: Text('My Saved Places:' ,
                      style: TextStyle(fontSize: 15 ,
                          fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    height: 400,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        famousPlaces('assets/images/blvd.png',ImageSize:200),
                        famousPlaces('assets/images/KAFD.jpg', ImageSize: 200),
                        famousPlaces('assets/images/Rpark.png', ImageSize: 200),
                        famousPlaces('assets/images/blvd.png', ImageSize: 200),
                        famousPlaces('assets/images/KAFD.jpg', ImageSize: 200),
                        famousPlaces('assets/images/Rpark.png', ImageSize: 200),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  Widget famousPlaces (Image, {required int ImageSize}) {
    return AspectRatio(aspectRatio: 2.55 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.contain,
              image:AssetImage(Image)
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: [0.1, 0.9],
                colors: [
                  Colors.black.withOpacity(.0),
                  Colors.black.withOpacity(.0)
                ]
            ),
          ),
        ),
      ),
    );
  }

}