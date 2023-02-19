import 'package:flutter/material.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({Key? key}) : super(key: key);

  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {
  final GlobalKey<ScaffoldState> _myGlobe = GlobalKey<ScaffoldState>();
  TextEditingController about=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppResponsive(
        // Let's work on our mobile part
        mobile: mobileBuild(context, _size),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: mobileBuild(context, _size),
            ),
            Expanded(
              flex: 9,
              child: mobileBuild(context, _size),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: mobileBuild(context, _size),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: mobileBuild(context, _size),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: mobileBuild(context, _size),
            ),
          ],
        ),
      ),
    );
  }

  Widget mobileBuild(BuildContext context, Size _size) {
    return Scaffold(appBar: AppBar(automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Center(child: Text('About Me',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)))),
      key: _myGlobe,
      body: Stack(children: <Widget>[
        Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Introduce yourself in a minimum of 25 words (Don't mention your name or number)."
                      'You can write about your values/beliefs,aspiration,intrests and hobbies.',
                  border: InputBorder.none
              ),
              minLines: 8,
              maxLines: 10,
              controller: about,
            ),
          ),
        ],),
        Positioned(top: MediaQuery.of(context).size.height*0.81,
          child: Container(width: MediaQuery.of(context).size.width,height:60,
              child:ElevatedButton(
                onPressed: (){
                  if(about.text.length>10){
                  //  _upload();
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text('Tell us about you at least 100 words'), duration: Duration(milliseconds: 300), ), );
                  }
                },
            //    padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange],),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 150.0, minHeight: 50.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text('Next',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),),),)
          ),
        ),
      ],),
    );
  }
}