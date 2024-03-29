import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutter/screen/acceptance.dart';
import 'package:myfirstflutter/screen/desiredpartner.dart';
import 'package:myfirstflutter/screen/editpic.dart';
import 'package:myfirstflutter/screen/family.dart';
import 'package:myfirstflutter/screen/login.dart';
import 'package:myfirstflutter/screen/profileview.dart';
import 'package:myfirstflutter/screen/search2.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? image;

  @override
  void initState() {
    // TODO: implement initState
  //  _get();
    image = '';
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
    return Scaffold(body: SafeArea(
      child: Container(child: FutureBuilder(
      //  future: _get(),
        builder: (context, snapshot) {
          return Stack(children: <Widget>[
            Positioned(top: 0.0,
              child: Container(color: Color(0xfff85d06),child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment:CrossAxisAlignment.end
                ,children: <Widget>[
                GestureDetector(child: Container(alignment: Alignment.centerRight,child: Icon(Icons.search,size: 30,color: Colors.white,),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Search2()));
                },),
                Container(width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.07,
                  child: ListView(scrollDirection: Axis.horizontal,children: <Widget>[
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6,bottom: 8),
                        child: CircleAvatar(backgroundColor: Colors.white,radius: 25,
                          child: image!=null?ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: CachedNetworkImage(
                              imageUrl: image.toString(), width: 110, height:110, fit: BoxFit.cover,
                            ),
                          ):CircleAvatar(
                            radius: 45, backgroundColor: Colors.white,
                            child: Icon(Icons.person),
                          ),),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditPic()));
                      },
                    ),
                    Container(alignment: Alignment.bottomLeft,padding: EdgeInsets.only(bottom: 10),
                        child: Text('76%',style: TextStyle(color: Colors.white),)),
                    SizedBox(width: 65,),
                    GestureDetector(
                      child: Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                        Image.asset('assets/desire.png',width: 25,height: 20,color: Colors.white,),
                        SizedBox(height: 6,),
                        Text('Desired Partner',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),
                  ],),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DesiredPartner(navigate: true, )));
                      },
                    ),
                    SizedBox(width: 30,),
                    GestureDetector(
                      child: Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                        Image.asset('assets/group.png',width: 30,height: 25,color: Colors.white,),
                        Text('Family',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),
                      ],),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Family()));
                      },
                    ),
                    SizedBox(width: 30,),
                    GestureDetector(
                      child: Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                        Icon(Icons.person_outline,color: Colors.white,size: 28,),
                        Text('Personal',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),
                      ],),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProfileView()));
                      },
                    ),
                ],) ,)
              ],),),
            ),
            Positioned(top:MediaQuery.of(context).size.height*0.11,bottom: 4,
              child: Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                child: ListView(scrollDirection:Axis.vertical,children: <Widget>[
                  Container(height: 70,child: Center(child: Column(
                    children: <Widget>[
                      Text('Space for new update'),
                      ElevatedButton.icon(onPressed: (){
                      //  fa.FirebaseAuth auth=fa.FirebaseAuth.instance;
                      //  auth.signOut();
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));

                      }, icon: Icon(Icons.call_missed_outgoing), label: Text('SignOut'),)
                    ],
                  ),),),
                  Divider(thickness: 2,),
                  Row(children: <Widget>[
                    Expanded(child: GestureDetector(
                      child: Column(children: <Widget>[
                        Text('20',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        Text('Acceptances',style: TextStyle(fontSize: 16),),
                      ],),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Acceptance()));
                    },)),
                    Container(width: 1,height: 50,color: Colors.grey,),
                    Expanded(child: Column(children: <Widget>[
                      Text('20',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text('Just Join',style: TextStyle(fontSize: 16),),
                    ],))
                  ],),
                  Divider(thickness: 2,),
                  Row(children: <Widget>[
                    Expanded(child: Container(alignment: Alignment.centerLeft,child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Text('Online Matches',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 4,),
                          Text('20',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)
                        ],
                      ),
                    ),)),
                    Expanded(child: Container(alignment: Alignment.centerRight,child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('View all',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                    ),)),
                  ],),
                  Container(height: 90,width: MediaQuery.of(context).size.width,
                    child: ListView(scrollDirection: Axis.horizontal,children: <Widget>[
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(color: Color(0xfff85d06),width: 65,height: 35,
                          child: Center(child: Text('+40',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),)
                      ),),
                    ],),
                  ),
                  Divider(),
                  Row(children: <Widget>[
                    Expanded(child: Container(alignment: Alignment.centerLeft,child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Text('Profile Visitors',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 4,),
                          Text('20',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)
                        ],
                      ),
                    ),)),
                    Expanded(child: Container(alignment: Alignment.centerRight,child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('View all',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                    ),)),
                  ],),
                  Container(height: 90,width: MediaQuery.of(context).size.width,
                    child: ListView(scrollDirection: Axis.horizontal,children: <Widget>[
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(color: Color(0xfff85d06),width: 65,height: 35,
                            child: Center(child: Text('+40',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),)
                      ),),
                    ],),
                  ),
                  Divider(),
                  Row(children: <Widget>[
                    Expanded(child: Container(alignment: Alignment.centerLeft,child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Text('Profile Visited',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 4,),
                          Text('20',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)
                        ],
                      ),
                    ),)),
                    Expanded(child: Container(alignment: Alignment.centerRight,child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('View all',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                    ),)),
                  ],),
                  Container(height: 90,width: MediaQuery.of(context).size.width,
                    child: ListView(scrollDirection: Axis.horizontal,children: <Widget>[
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(color: Color(0xfff85d06),width: 65,height: 35,
                            child: Center(child: Text('+40',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),)
                      ),),
                    ],),
                  ),
                  Divider(),
                  Row(children: <Widget>[
                    Expanded(child: Container(alignment: Alignment.centerLeft,child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Text('Declined Matches',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 4,),
                          Text('20',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)
                        ],
                      ),
                    ),)),
                    Expanded(child: Container(alignment: Alignment.centerRight,child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('View all',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                    ),)),
                  ],),
                  Container(height: 90,width: MediaQuery.of(context).size.width,
                    child: ListView(scrollDirection: Axis.horizontal,children: <Widget>[
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network('https://www.toplocaltrainer.co.uk/wp-content/uploads/2015/05/nice-profile-pic.jpg',width: 65,height: 35,),
                      ),),
                      SizedBox(width: 3,),
                      Card(elevation: 2,child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(color: Color(0xfff85d06),width: 65,height: 35,
                            child: Center(child: Text('+40',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),)
                      ),),
                    ],),
                  ),
                  Divider()
                ],),
              ),
            )
          ],);
        }
      ),),
    ),);
  }
}