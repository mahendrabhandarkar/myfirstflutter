import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfirstflutter/screen/home.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class EditPic extends StatefulWidget {
  const EditPic({Key? key}) : super(key: key);

  @override
  State<EditPic> createState() => _EditPicState();
}

class _EditPicState extends State<EditPic> {
  final GlobalKey<ScaffoldState> _myGlobe = GlobalKey<ScaffoldState>();
  late File image;
  late String url;
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
    return Scaffold(key: _myGlobe,
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(child: Container(width: MediaQuery.of(context).size.width*0.85,
              height: MediaQuery.of(context).size.height*0.50,
              decoration: BoxDecoration(color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 45.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        2.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: ListView(children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: GestureDetector(
                    onTap: (){
                      pickImage();
                    },
                    child: image==null?Container(width: MediaQuery.of(context).size.width*0.7,height: 230,color: Colors.grey[350],
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 60,right: 60),
                        child: Text('Tap to upload photo from gallery',textAlign: TextAlign.center,),
                      )),):Container(width: MediaQuery.of(context).size.width*0.7,height: 230,color: Colors.grey[350],
                      child: Image.file(image,fit: BoxFit.fill,),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if(image!=null){
                    //    _upload();
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please provide profile image'),
                            duration: Duration(seconds: 2)));
                      }
                    },
                  //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                  //  padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red, Colors.orange],),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 50.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text('Save Profile',textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                        ),),),),
                )
              ],),
            ),
            ),
            Positioned(top: MediaQuery.of(context).size.height*0.82,left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1,
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 6,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Home()));
                      },
                    //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    //  padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange],),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 200.0, minHeight: 50.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text('Search',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                          ),),),),
                  ]),
            ),
          ],),
      ),);
  }

  void pickImage(){
    showDialog(context: context, builder: (context)=>Center(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  _camera();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _gallery();
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
  _camera()async{
    final img = await ImagePicker.platform.getImage(source: ImageSource.camera, maxWidth: 512, maxHeight: 512, imageQuality: 80);
    if(img!=null){
      setState(() {
        image=img as File;
      });
      Navigator.pop(context);
    }
  }

  _gallery() async{
    try{
      final img = await ImagePicker.platform.getImage(source: ImageSource.gallery, maxWidth: 512, maxHeight: 512, imageQuality: 80);
      if(img!=null){
        setState(() {
          image=img as File;
        });
        Navigator.pop(context);
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }

  }
}