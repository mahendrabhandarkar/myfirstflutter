import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myfirstflutter/screen/carrerdetails.dart';
import 'package:myfirstflutter/screen/personaldetails.dart';
import 'package:myfirstflutter/screen/socialdetails.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
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
  String horoscope='';
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
      appBar: AppBar(title: Text('Profile',style: TextStyle(color: Colors.black),),leading: Icon(Icons.arrow_back_ios,color: Colors.black),
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
        //  future: _get(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(elevation: 2,child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(children: <Widget>[
                      ListTile(title: Text('Personal',style: TextStyle(fontWeight: FontWeight.bold),),leading: Icon(Icons.person),trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>PersonalDetails(true)));
                      }),),
                      Divider(),
                      _buildExperienceRow(company: 'Gender', position: gender,),
                      _buildExperienceRow(company: 'Phone No', position: number,),
                      _buildExperienceRow(company: 'Country', position: country,),
                      _buildExperienceRow(company: 'Date of Birth', position: dob,),
                      _buildExperienceRow(company: 'Height', position: height,),
                    ],),
                  ),),
                  Card(elevation: 2,child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(children: <Widget>[
                      ListTile(title: Text('Carrer',style: TextStyle(fontWeight: FontWeight.bold),),leading: Icon(Icons.work),trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CarrerDetails(navigate: true,)));
                      }),),
                      Divider(),
                      _buildExperienceRow(company: 'Highest Qualification', position: education,),
                      _buildExperienceRow(company: 'Employed In', position: employ,),
                      _buildExperienceRow(company: 'Occupation', position: occupation,),
                      _buildExperienceRow(company: 'Annual Income', position: income,),
                    ],),
                  ),),
                  Card(elevation: 2,child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(children: <Widget>[
                      ListTile(title: Text('Social',style: TextStyle(fontWeight: FontWeight.bold),),leading: Icon(Icons.group),trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SocialDetails(true)));
                      }),),
                      Divider(),
                      _buildExperienceRow(company: 'Religion', position: religion,),
                      _buildExperienceRow(company: 'Caste', position: cast,),
                      _buildExperienceRow(company: 'Maritual', position: maritual,),
                      _buildExperienceRow(company: 'Mangalik', position: mangalik,),
                      _buildExperienceRow(company: 'Horoscope', position:horoscope,),
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
      subtitle: position!=null?Text('$position'):Text('Not filled',style: TextStyle(color: Colors.red),),
      contentPadding: EdgeInsets.only(left: 10,bottom: 0,top: 0),
    );
  }
}