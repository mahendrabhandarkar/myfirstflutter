import 'package:myfirstflutter/screens/personaldetails.dart';
import 'package:myfirstflutter/screens/socialdetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'careerdetails.dart';
class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}
class _ProfileViewState extends State<ProfileView> {

  String profile='';
  String number='';
  String religion='';
  String cast='';
  String gender='';
  String dob='';
  String height='';
  String country='';
  String education='';
  String occupation='';
  String income='';
  String employ='';
  String mangalik='';
  String maritual='';
  String hroscope='';
  Future _get()async{
    User user=await FirebaseAuth.instance.currentUser!;
    CollectionReference reference=FirebaseFirestore.instance.collection("Users");
    try{
      reference.doc(user.uid).get().then((onValue){
        setState(() {
          profile=(onValue.data as Map)['profile'];
          number=(onValue.data as Map)['number'];
          religion=(onValue.data as Map)['religion'];
          cast=(onValue.data as Map)['cast'];
          gender=(onValue.data as Map)['gender'];
          dob=(onValue.data as Map)['dob'];
          occupation=(onValue.data as Map)['occupation'];
          height='${(onValue.data as Map)['height']} feet';
          country=(onValue.data as Map)['country'];
          education=(onValue.data as Map)['education'];
          income='${(onValue.data as Map)['income']} lac';
          employ=(onValue.data as Map)['employ'];
          mangalik=(onValue.data as Map)['mangalik'];
          maritual=(onValue.data as Map)['marital'];
          hroscope=(onValue.data as Map)['horoscope'];
        });
      });
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile",style: TextStyle(color: Colors.black),),leading: Icon(Icons.arrow_back_ios,color: Colors.black),
        backgroundColor: Colors.white,
      actions: <Widget>[
        profile!=null?ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: CachedNetworkImage(
            imageUrl: profile, width: 55, height:55, fit: BoxFit.cover,
          ),
        ):CircleAvatar(
          radius: 20, backgroundColor: Colors.white,
          child: Icon(Icons.person),
        ),
      ],),
      body: FutureBuilder(
          future: _get(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(elevation: 2,child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(children: <Widget>[
                      ListTile(title: Text("Personal",style: TextStyle(fontWeight: FontWeight.bold),),leading: Icon(Icons.person),trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>PersonalDetails(true)));
                      }),),
                      Divider(),
                      _buildExperienceRow(company: "Gender", position: gender,),
                      _buildExperienceRow(company: "Phone No", position: number,),
                      _buildExperienceRow(company: "Country", position: country,),
                      _buildExperienceRow(company: "Date of Birth", position: dob,),
                      _buildExperienceRow(company: "Height", position: height,),
                    ],),
                  ),),
                  Card(elevation: 2,child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(children: <Widget>[
                      ListTile(title: Text("Carrer",style: TextStyle(fontWeight: FontWeight.bold),),leading: Icon(Icons.work),trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CarrerDetails(true)));
                      }),),
                      Divider(),
                      _buildExperienceRow(company: "Highest Qualification", position: education,),
                      _buildExperienceRow(company: "Employed In", position: employ,),
                      _buildExperienceRow(company: "Occupation", position: occupation,),
                      _buildExperienceRow(company: "Annual Income", position: income,),
                    ],),
                  ),),
                  Card(elevation: 2,child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(children: <Widget>[
                      ListTile(title: Text("Social",style: TextStyle(fontWeight: FontWeight.bold),),leading: Icon(Icons.group),trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SocialDetails(true)));
                      }),),
                      Divider(),
                      _buildExperienceRow(company: "Religion", position: religion,),
                      _buildExperienceRow(company: "Caste", position: cast,),
                      _buildExperienceRow(company: "Maritual", position: maritual,),
                      _buildExperienceRow(company: "Mangalik", position: mangalik,),
                      _buildExperienceRow(company: "Horoscope", position:hroscope,),
                    ],),
                  ),),
                  SizedBox(height: 20.0),
                ],
              ),
            );
          }
      ),
    );
  }
  ListTile _buildExperienceRow({required String company, required String position}) {
    return ListTile(
      title: Text(company, style: TextStyle(
        color: Colors.black,
      ),),
      subtitle: position!=null?Text("$position"):Text("Not filled",style: TextStyle(color: Colors.red),),
      contentPadding: EdgeInsets.only(left: 10,bottom: 0,top: 0),
    );
  }

}
