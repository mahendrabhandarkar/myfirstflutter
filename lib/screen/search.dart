import 'package:flutter/material.dart';
import 'package:myfirstflutter/data.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final GlobalKey<ScaffoldState> _myGlobe = GlobalKey<ScaffoldState>();
  String? dropDownValue;
  String? maxage;
  String? minheight;
  String? maxheight;
  String? min;
  String? max;
  String? religion;
  String? cast;

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
      title: Center(child: Text('Search',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
      ),),),
      body: Stack(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 2,right: 2,left: 2,bottom: 60),
            child:ListView(scrollDirection: Axis.vertical,physics: ScrollPhysics(),
                children: <Widget>[
                  SizedBox(height: 20,),
                  Row(children: <Widget>[
                    Expanded(child: ListTile(title: Text('Min Age'),
                      subtitle:         DropdownButton(
                          hint: Text('min age          '),
                          value: dropDownValue!=null?dropDownValue:null,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              dropDownValue = newValue.toString();
                            });
                          },
                          items:[
                            '18 years',
                            '20 years',
                            '22 years',
                            '24 years',
                            '26 years',
                            '28 years',
                            '30 years',
                            '34 years ',
                            '36 Above'
                          ].map((f) {
                            return DropdownMenuItem(
                                value:f, child: Text(f));
                          }).toList()
                      ),
                    )),
                    Expanded(child: ListTile(title: Text('Max Age'),
                      subtitle:         DropdownButton(
                          hint: Text('max age          '),
                          value: maxage!=null?maxage:null,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              maxage = newValue.toString();
                            });
                          },
                          items:[
                            '18 years',
                            '20 years',
                            '22 years',
                            '24 years',
                            '26 years',
                            '28 years',
                            '30 years',
                            '34 years ',
                            '36 Above'
                          ].map((f) {
                            return DropdownMenuItem(
                                value:f, child: Text(f));
                          }).toList()
                      ),
                    ))
                  ],),
                  SizedBox(height: 15,),
                  Row(children: <Widget>[
                    Expanded(child: ListTile(title: Text('Min Height'),
                      subtitle:         DropdownButton(
                          hint: Text('min height          '),
                          value: minheight!=null?minheight:null,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              minheight = newValue.toString();
                            });
                          },
                          items:[
                            '5.2 feet',
                            '5.3 feet',
                            '5.5 feet',
                            '5.6 fett',
                            '5.7 fett',
                            '5.8 fett',
                            '6.0 fett',
                            '6.3 fett ',
                            '6.4 Above'
                          ].map((f) {
                            return DropdownMenuItem(
                                value:f, child: Text(f));
                          }).toList()
                      ),
                    )),
                    Expanded(child: ListTile(title: Text('Max Height'),
                      subtitle:         DropdownButton(
                          hint: Text('max height          '),
                          value: maxheight!=null?maxheight:null,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              maxheight = newValue.toString();
                            });
                          },
                          items:[
                            '5.2 fett',
                            '5.3 fett',
                            '5.5 fett',
                            '5.6 fett',
                            '5.7 fett',
                            '5.8 fett',
                            '6.0 fett',
                            '6.3 fett ',
                            '6.4 Above'
                          ].map((f) {
                            return DropdownMenuItem(
                                value:f, child: Text(f));
                          }).toList()
                      ),
                    ))
                  ],),
                  SizedBox(height: 20,),
                  ListTile(title: Text('Religion'),
                  subtitle: DropdownButton(
                      hint: Text('Your religion         '),
                      value: religion,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      onChanged: (newValue) {
                        setState(() {
                          religion = newValue.toString();
                        });
                      },
                      items: Data().religion.map((f) {
                        return DropdownMenuItem(
                          value: f, child: Text(f.toString().toUpperCase()),);
                      }).toList()
                  ),),
                  SizedBox(height: 15,),
                  ListTile(title: Text('Cast'),
                  subtitle: DropdownButton(
                      hint: Text('Your cast               '),
                      value: cast,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      onChanged: (newValue) {
                        setState(() {
                          cast = newValue.toString();
                        });
                      },
                      items: Data().religion.map((f) {
                        return DropdownMenuItem(
                          value: f, child: Text(f.toString().toUpperCase()),);
                      }).toList()
                  ),),
                  SizedBox(height: 20,),
                  Row(children: <Widget>[
                    Expanded(child: ListTile(title: Text('Min Income'),
                      subtitle:         DropdownButton(
                          hint: Text('min income          '),
                          value: min!=null?min:null,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              min = newValue.toString();
                            });
                          },
                          items:[
                            'Rs. 1 lac',
                            'Rs. 2 lac',
                            'Rs. 3 lac',
                            'Rs. 4 lac',
                            'Rs. 5 lac',
                            'Rs. 6 lac',
                            'Rs. 10 lac',
                            '10 lac Above'
                          ].map((f) {
                            return DropdownMenuItem(
                                value:f, child: Text(f));
                          }).toList()
                      ),
                    )),
                    Expanded(child: ListTile(title: Text('Max Income'),
                      subtitle:         DropdownButton(
                          hint: Text('max in          '),
                          value: max!=null?max:null,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              max = newValue.toString();
                            });
                          },
                          items:[
                            'Rs. 1 lac',
                            'Rs. 2 lac',
                            'Rs. 3 lac',
                            'Rs. 4 lac',
                            'Rs. 5 lac',
                            'Rs. 6 lac',
                            'Rs. 10 lac',
                            '10 lac Above'
                          ].map((f) {
                            return DropdownMenuItem(
                                value:f, child: Text(f));
                          }).toList()
                      ),
                    ))
                  ],),
                ])),
        Positioned(top: MediaQuery.of(context).size.height*0.81,
          child: Container(width: MediaQuery.of(context).size.width,height:60,
              child:ElevatedButton(
                onPressed: (){

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
                    child: const Text('Search',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),),),)
          ),
        ),
      ]),
    );
  }
}