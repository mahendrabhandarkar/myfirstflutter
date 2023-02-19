import 'package:flutter/material.dart';
import 'package:myfirstflutter/models/users_model.dart';
import 'package:myfirstflutter/screen/message.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class Acceptance extends StatefulWidget {
  const Acceptance({Key? key}) : super(key: key);

  @override
  State<Acceptance> createState() => _AcceptanceState();
}

class _AcceptanceState extends State<Acceptance> {
  static List<Users>p=[];
  List<Users>users=[];
  bool accept=false;
  final GlobalKey<ScaffoldState> _myGlobe = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
  //  _get();
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
    return Scaffold(key: _myGlobe,
      body: FutureBuilder(
          builder: (context, snapshot) {
            return Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height*0.03),
                    Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.075,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                        Expanded(flex: 1,child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                          Navigator.pop(context);
                        })),
                        Expanded(flex: 9,child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                            accept?ElevatedButton(
                              onPressed: null,
                          //    padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.red, Colors.orange],),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(minWidth: 150.0, minHeight: 50.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text('Accepted Me',textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),),),):ElevatedButton(
                              onPressed: () {
                              //  _get();
                                setState(() {
                                  accept=true;
                                });
                              },
                            //  padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                child: Container(
                                  constraints: const BoxConstraints(minWidth: 150.0, minHeight: 50.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text('Accepted Me',textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black,fontSize: 18,),
                                  ),),),),

                            !accept?ElevatedButton(
                              onPressed: null,
                            //  padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.red, Colors.orange],),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(minWidth: 150.0, minHeight: 50.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text('I Accepted',textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),),),):ElevatedButton(
                                  //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:Radius.circular(5) )),
                              onPressed: () {
                              //  _get();
                                setState(() {
                                  accept=false;
                                });
                              },
                            //  padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                child: Container(
                                  constraints: const BoxConstraints(minWidth: 150.0, minHeight: 50.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text('I Accepted',textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black,fontSize:18),
                                  ),),),),
                          ],),
                        ),
                        )
                      ],),
                    ),
                    users.length>0? Container(height: MediaQuery.of(context).size.height*0.895,width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(bottom: 4),
                        child: ListView(shrinkWrap: true,scrollDirection: Axis.vertical,children: users.map((f){
                          return  Container(height: MediaQuery.of(context).size.height*0.895,width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(bottom: 8),
                            child: Stack(children: <Widget>[
                              Image.network(
                                f.profile.toString(),
                                width:  MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*0.82,
                                fit: BoxFit.cover,
                                frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                                  if (wasSynchronouslyLoaded || frame != null) {
                                    return Container(
                                      foregroundDecoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [Colors.transparent,Colors.black87]
                                          )
                                      ),
                                      height: MediaQuery.of(context).size.height*0.82,
                                      width: MediaQuery.of(context).size.width,
                                      child:child,
                                    );
                                  } else {
                                    return Container(
                                      alignment: Alignment(0, 0),
                                      constraints: BoxConstraints.expand(),
                                      child: CircularProgressIndicator(
                                          value: null,
                                          backgroundColor: Colors.white),
                                    );
                                  }
                                },
                              ),
                              Positioned(top: MediaQuery.of(context).size.height*0.65,
                                child: Container(width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.19,
                                    padding: EdgeInsets.only(left: 10),
                                    child:Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                                      Text('${f.name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white70),),
                                      Text('${f.age} ',style: TextStyle(fontSize: 18,color: Colors.white70)),
                                      Text('${f.religion}',style: TextStyle(fontSize: 18,color: Colors.white70)),
                                      Text('${f.country}',style: TextStyle(fontSize: 18,color: Colors.white70)),
                                    ],)
                                ),
                              ),
                              Positioned(top: MediaQuery.of(context).size.height*0.81,
                                child: Container(width: MediaQuery.of(context).size.width,height:60,
                                    child:ElevatedButton(
                                      onPressed: (){
                                        if(f.status=='REQUESTED'&&!accept){
                                      //   _upload(f.id);
                                        }
                                        if(f.status=='ACCEPTED'){
                                          print(f.status);
                                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Message(id: f.id.toString(), name: f.name.toString(),)));
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
                                          child: f.status=='REQUESTED'&&accept?Text('Your REQUESTED',textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.white,fontSize: 18),
                                          ):f.status=='REQUESTED'&&!accept?Text('Accept Now',textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.white,fontSize: 18),
                                          ):f.status=='ACCEPT'&&accept?Text('Write Message',textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.white,fontSize: 18),
                                          ):Text('Write Message',textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.white,fontSize: 18),
                                          ),),),)
                                ),
                              ),

                            ],),);
                        }).toList(),)
                    ):Container(height: MediaQuery.of(context).size.height*0.895,width: MediaQuery.of(context).size.width,
                      child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                        Icon(Icons.group),
                        Text('No such data found')
                      ],),),
                    ),
                  ],
                )
            );
          }
      ),
    );
  }
}