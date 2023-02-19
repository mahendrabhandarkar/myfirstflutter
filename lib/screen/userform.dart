import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myfirstflutter/data.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late String religion;
  late String cast;
  late String language;
  late int age;
  TextEditingController number = new TextEditingController();
  TextEditingController name = new TextEditingController();
  final GlobalKey<ScaffoldState> _myGlobe = GlobalKey<ScaffoldState>();
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.black87, width: 1));

  String _phone = '';
  late String _verificationId;

  @override
  void initState() {
    // TODO: implement initState
    religion = Data().religion[Data().religion.length - 1];
    cast = Data().caste[Data().caste.length - 1];
    language = Data().language[Data().language.length - 1];
    age = Data().age[Data().age.length - 1];
    _verificationId = Random().nextInt(10).toString();
    super.initState();
  }

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
    return Scaffold(
      key: _myGlobe,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tell us about you',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Religion',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 65,
              ),
              DropdownButton(
                  hint: Text('Your religion         '),
                  value: religion,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  onChanged: (newValue) {
                    setState(() {
                      religion = newValue.toString();
                    });
                  },
                  items: Data().religion.map((f) {
                    return DropdownMenuItem(
                      value: f,
                      child: Text(f.toString().toUpperCase()),
                    );
                  }).toList())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Cast',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 85,
              ),
              DropdownButton(
                  hint: Text('Your cast               '),
                  value: cast,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  onChanged: (newValue) {
                    setState(() {
                      cast = newValue.toString();
                    });
                  },
                  items: Data().caste.map((f) {
                    return DropdownMenuItem(
                      value: f,
                      child: Text(f.toString().toUpperCase()),
                    );
                  }).toList())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Language',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 58,
              ),
              DropdownButton(
                  hint: Text('Your language   '),
                  value: language,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  onChanged: (newValue) {
                    setState(() {
                      language = newValue.toString();
                    });
                  },
                  items: Data().language.map((f) {
                    return DropdownMenuItem(
                      value: f,
                      child: Text(f.toString().toUpperCase()),
                    );
                  }).toList())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your Age',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 58,
              ),
              DropdownButton(
                  hint: Text('Your Age                '),
                  value: age,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  onChanged: (newValue) {
                    setState(() {
                      age = int.parse(newValue.toString());
                    });
                  },
                  items: Data().age.map((f) {
                    return DropdownMenuItem(
                      value: f,
                      child: Text('$f years'),
                    );
                  }).toList())
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 280,
            child: ListTile(
              title: Row(
                children: <Widget>[
                  Text(
                    'Full Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Name will be displayde',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              subtitle: TextField(
                controller: name,
                decoration: InputDecoration(
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    contentPadding:
                        EdgeInsets.only(left: 8, right: 32, top: 4, bottom: 4),
                    hintText: 'Your name',
                    hintStyle: TextStyle(color: Colors.black38)),
                onChanged: (value) {},
                autofocus: false,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 280,
            child: ListTile(
              title: Row(
                children: <Widget>[
                  Text(
                    'Phone number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Number will be verified',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              subtitle: TextField(
                controller: number,
                decoration: InputDecoration(
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    contentPadding:
                        EdgeInsets.only(left: 8, right: 32, top: 4, bottom: 4),
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(color: Colors.black38)),
                onChanged: (value) {},
                autofocus: false,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.phone,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                if (number.text.length == 10 &&
                    name.text.length > 4 &&
                    religion != null &&
                    cast != null &&
                    language != null) {
                  setState(() {
                    _phone = number.text;
                    // _phoneVerify();
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please provide above information'),
                      duration: Duration(seconds: 2)));
                }
              },
              //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
              //  padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                      minWidth: 200.0,
                      minHeight: 50.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
