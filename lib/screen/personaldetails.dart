import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirstflutter/data.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails(bool bool, {Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  String gender='male';
  late String dob;
  late double height;
  late String country;
  List<double>h=Data().height;
  List<String>c=Data().country;
  late int hvalue;
  late int cvalue;
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
      title: Center(child: Text('Personal Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
      ),),),
      key: _myGlobe,
      body: Stack(children: <Widget>[
       Padding(
         padding: const EdgeInsets.only(top: 30),
         child:Column(
           children: <Widget>[ Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
              gender=='male'?ElevatedButton(
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
                    child: const Text('Male',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),),),):ElevatedButton(
                onPressed: () {
                  gender='male';
                  setState(() {
                  });
                },
              //  padding: const EdgeInsets.all(0.0),
                child: Ink(
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 150.0, minHeight: 50.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text('Male',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,fontSize: 18,),
                    ),),),),

              gender=='female'?ElevatedButton(
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
                    child: const Text('Female',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),),),):ElevatedButton(
                onPressed: () {
                  gender='female';
                  setState(() {

                  });
                },
              //  padding: const EdgeInsets.all(0.0),
                child: Ink(
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 150.0, minHeight: 50.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text('Female',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,fontSize:18),
                    ),),),),
            ],),
             SizedBox(height: 20,),
             ListTile(title: Text('Date of Birth'),
              subtitle: dob==null?Text('Choose your date of birth'):Text(dob),
              trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
             onTap: (){
             showDatePicker(context:context, initialDate: DateTime.now(),
                  firstDate:DateTime(1950), lastDate:DateTime.now()).then((onValue){
                    print(onValue);
                    setState(() {
                      dob=DateFormat.yMMMd('en_US').format(onValue!);
                    });
                  });
             },),
             Divider(),
             ListTile(title: Text('Height'),
                 subtitle: height==null?Text('Choose your height'):Text('$height'),
                 trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
             onTap: (){
               _listPopup(context,h);
             },),
             Divider(),
             ListTile(title: Text('Livinng in'),
               subtitle:country==null?Text('Choose your height'):Text(country),
               trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
             onTap: (){
               _country(context, c);
             },)
         ])),
        Positioned(top: MediaQuery.of(context).size.height*0.81,
          child: Container(width: MediaQuery.of(context).size.width,height:60,
              child:ElevatedButton(
                onPressed: () {
                  if(dob!=null&&height!=null&&country!=null){
                    setState(() {
                  //    _upload();
                    });
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please provide above information'),
                        duration: Duration(seconds: 2)));
                  }

                },
            //    padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange],),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 150.0, minHeight: 50.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text('Continue',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),),),)
          ),
        ),
      ],),
    );
  }

  Widget? _listPopup(BuildContext context,List<double>h){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
                return Column(
                  children: <Widget>[
                    ListTile(title: Text('${h[index]} feet'),onTap: (){
                      setState(() {
                        height=h[index];
                        Navigator.pop(context);
                      });
                    },
                      trailing:Radio(value: index, groupValue: hvalue, onChanged: (val){
                        setState(() {
                          hvalue=int.parse(val.toString());
                        });
                      }),),
                    Divider()
                  ],
                );
              })
            ),
          );
        }
    );
  }
  Widget? _country(BuildContext context,List<String>h){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: double.maxFinite,
                child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: <Widget>[
                      ListTile(title: Text(h[index]),onTap: (){
                        setState(() {
                          country=h[index];
                          Navigator.pop(context);
                        });
                      },
                        trailing:Radio(value: index, groupValue:cvalue, onChanged: (val){
                          setState(() {
                            cvalue=int.parse(val.toString());
                          });
                        }),),
                      Divider()
                    ],
                  );
                })
            ),
          );
        }
    );
  }
}