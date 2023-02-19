import 'package:flutter/material.dart';
import 'package:myfirstflutter/models/users_model.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class Search2 extends StatefulWidget {
  const Search2({Key? key}) : super(key: key);

  @override
  State<Search2> createState() => _Search2State();
}

class _Search2State extends State<Search2> {
  static List<Users>p=[];
  List<Users>users=[];
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
    return Scaffold(key: _myGlobe,appBar: AppBar(automaticallyImplyLeading: false,
      backgroundColor: Colors.white,elevation: 10,
      title: Center(child: Text('Search',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
      ),),),
      body: FutureBuilder(
        builder: (context, snapshot) {
          return Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
          child: users.length>0?Container(height: MediaQuery.of(context).size.height*0.895,width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 8),
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
                            if(f.status=='REQUESTED'||f.status=='ACCEPTED'){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You have already ${f.status}')));
                            }
                            else{
                              setState(() {
                                p.clear();
                                users.clear();
                              //  _get();
                              });
                            //  _upload(f.uid);
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
                              child: Text('Send Interst',textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,fontSize: 18),
                              ),),),)
                    ),
                  ),

                ],),);
          }).toList(),)
          ):Center(child: Column(children: <Widget>[

          ],),)
          );
        }
      ),
    );
  }
}