import 'package:flutter/material.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({Key? key}) : super(key: key);

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController password=TextEditingController();
  final GlobalKey<ScaffoldState> _myGlobe = GlobalKey<ScaffoldState>();

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
      title: Center(child: Text('Login Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
      ),),),
      key: _myGlobe,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListView(children: <Widget>[
              ListTile(title: Text('Full Name'),
                subtitle: TextField(
                  decoration: InputDecoration(
                      hintText: 'Name *',
                      border: InputBorder.none
                  ),
                  controller: name,
                ),
              ),
              Divider(),
              ListTile(title: Row(children: <Widget>[Text('Phone Number'),Text('(This number will be verified)',style: TextStyle(color: Colors.grey,fontSize: 13),)],),
                subtitle: TextField(
                  decoration: InputDecoration(
                      hintText: 'Number*',
                      border: InputBorder.none
                  ),
                  controller: number,
                ),
              ),
              Divider(),
              ListTile(title: Text('Email ID'),
                subtitle: TextField(
                  decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      border: InputBorder.none
                  ),
                  controller: mail,
                ),
              ),
              Divider(),
              ListTile(title: Text('Create New Password'),
                subtitle: TextField(
                  decoration: InputDecoration(
                      hintText: '**********',
                      border: InputBorder.none
                  ),
                  controller: password,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text('Use 8 or more characters with a mix of letters(a-z) & numbers(0-9)',style: TextStyle(fontSize: 10,color: Colors.grey),),
              ),
              Divider(),
            ],),
          ),
          Positioned(top: MediaQuery.of(context).size.height*0.78,
            child: Container(width: MediaQuery.of(context).size.width,
                child:Row(mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[
                  Text('Terms of Use',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold)),
                  SizedBox(width:40,),
                  Text('Privacy Policy',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold)),
                ],)),
          ),
          Positioned(top: MediaQuery.of(context).size.height*0.81,
            child: Container(width: MediaQuery.of(context).size.width,height:60,
                child:ElevatedButton(
                  onPressed: (){
                    if(name.text.length>4&&number.text.length>9&&mail.text.length>10&&password.text.length>8){
                    //  _signUp();
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please provide vaild details'),
                          duration: Duration(seconds: 2)));
                    }

                  },
                //  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange],),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 150.0, minHeight: 50.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text('Accept & Continue',textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),),),)
            ),
          ),
        ],
      ),);
  }
}