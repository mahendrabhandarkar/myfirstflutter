import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Search2 extends StatefulWidget {
  @override
  _Search2State createState() => _Search2State();
}

class _Search2State extends State<Search2> {

  static List<Users>p=[];
  List<Users>users=[];
  final GlobalKey<ScaffoldState> _myGlobe = GlobalKey<ScaffoldState>();

  void _get() async{
    User _user=await FirebaseAuth.instance.currentUser!;
    CollectionReference reference=FirebaseFirestore.instance.collection("Users");
    CollectionReference collectionReference=FirebaseFirestore.instance.collection('Requests');
    try{
      QuerySnapshot querySnapshot=await reference.get();
      QuerySnapshot snapshot=await collectionReference.where('from',isEqualTo: _user.uid).get();
      querySnapshot.docs.map((f){
        if(snapshot.docs.length>0){
          snapshot.docs.map((value){
            if((f.data as Map)['uid']==(value.data as Map)['to']){
              setState(() {
                p.add(Users((f.data as Map)['name'], '${(f.data as Map)['age'].toString()} years', (f.data as Map)['religion'], (f.data as Map)['country'], (value.data as Map)['status'],(f.data as Map)['profile'],(f.data as Map)['uid']));
                users=List.from(p);
              });
            }
            else{
              setState(() {
                p.add(Users((f.data as Map)['name'], '${(f.data as Map)['age']} years', (f.data as Map)['religion'], (f.data as Map)['country'], 'NON',(f.data as Map)['profile'],(f.data as Map)['uid']));
                users=List.from(p);
              });
            }
          }).toList();
        }
        else{
          setState(() {
            p.add(Users((f.data as Map)['name'], '${(f.data as Map)['age']} years', (f.data as Map)['religion'], (f.data as Map)['country'], 'NON',(f.data as Map)['profile'],(f.data as Map)['uid']));
            users=List.from(p);
          });
        }
      }).toList();
    }catch(e){
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _get();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    p.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _myGlobe,appBar: AppBar(automaticallyImplyLeading: false,
      backgroundColor: Colors.white,elevation: 10,
      title: Center(child: Text("Search",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
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
                    f.profile,
                    width:  MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.82,
                    fit: BoxFit.cover,
                    frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded || frame != null) {
                        return Container(
                          child:child,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent,Colors.black87]
                              )
                          ),
                          height: MediaQuery.of(context).size.height*0.82,
                          width: MediaQuery.of(context).size.width,
                        );
                      } else {
                        return Container(
                          child: CircularProgressIndicator(
                              value: null,
                              backgroundColor: Colors.white),
                          alignment: Alignment(0, 0),
                          constraints: BoxConstraints.expand(),
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
                        child:RaisedButton(
                          onPressed: (){
                            if(f.status=='REQUESTED'||f.status=='ACCEPTED'){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You have already ${f.status}')));
                            }
                            else{
                              setState(() {
                                p.clear();
                                users.clear();
                                _get();
                              });
                              _upload(f.uid);
                            }
                          },
                          padding: const EdgeInsets.all(0.0),
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
  Future _upload(String id)async{
    User user= await FirebaseAuth.instance.currentUser!;
    CollectionReference reference=FirebaseFirestore.instance.collection('Requests');
    try{
      var v={
        'from':user.uid,
        'to':id,
        'id':DateTime.now().millisecondsSinceEpoch.toString(),
        'status':'REQUESTED'
      };
      reference.doc(v['id']).set(v, SetOptions(merge: true,));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Request has send')));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
class Users{
  String name;
  String age;
  String religion;
  String country;
  String status;
  String profile;
  String uid;
  Users(this.name, this.age, this.religion, this.country, this.status,this.profile,this.uid);
}

