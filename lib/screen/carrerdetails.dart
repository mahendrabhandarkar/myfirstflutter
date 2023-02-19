import 'package:flutter/material.dart';
import 'package:myfirstflutter/data.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class CarrerDetails extends StatefulWidget {
  const CarrerDetails({Key? key, required this.navigate}) : super(key: key);
  final bool navigate;
  @override
  State<CarrerDetails> createState() => _CarrerDetailsState();
}

class _CarrerDetailsState extends State<CarrerDetails> {
  late String edu;
  late String employ;
  late String occupation;
  dynamic income;
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
      title: Center(child: Text('Career Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
      ),),),
      key: _myGlobe,
      body: Stack(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 30),
            child:Column(
                children: <Widget>[
                  ListTile(title: Text('Highest Qualification'),
                    subtitle:edu==null?Text('Your degree'):Text('$edu lac'),
                    trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                    onTap: (){
                    _education(context, Data().education);
                    },),
                  Divider(),
                  ListTile(title: Text('Employed In'),
                    subtitle: employ==null?Text('Your employed in'):Text(employ),
                    trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                    onTap: (){
                    _employ(context, Data().employ);
                    },),
                  Divider(),
                  ListTile(title: Text('Occupation'),
                      subtitle:occupation==null?Text('Your occupation'):Text(occupation),
                      trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                  onTap: (){
                    _occupation(context, Data().occupation);
                  },),
                  Divider(),
                  ListTile(title: Text('Annual Income'),
                      subtitle:income==null?Text('Choose your income'):Text('$income lac'),
                      trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                    onTap: (){
                    _income(context, Data().income);
                    },)
                ])),
        Positioned(top: MediaQuery.of(context).size.height*0.81,
          child: Container(width: MediaQuery.of(context).size.width,height:60,
              child:ElevatedButton(
                onPressed: (){
                  if(edu!=null&&employ!=null&&occupation!=null&&income!=null){
                    setState(() {
                  //    _upload();
                    });

                  }else{
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text('Please provide above information'), duration: Duration(milliseconds: 300), ), );
                  }

                },
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
      ]),
    );
  }

  Widget? _education(BuildContext context,List<dynamic>h){
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
            width: double.maxFinite,
            child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
              return Column(
                children: <Widget>[
                  ListTile(title: Text('${h[index]}'),onTap: (){
                    setState(() {
                      edu=h[index];
                      Navigator.pop(context);
                    });
                  },
                    trailing:Radio(value: index, groupValue:cvalue, onChanged: (val){
                      setState(() {
                        cvalue=val.toString() as int;
                      });
                    }),),
                  Divider()
                ],
              );
            })
        ),
      );
    });
  }
  Widget? _employ(BuildContext context,List<String>h){
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
                          employ=h[index];
                          Navigator.pop(context);
                        });
                      },
                        trailing:Radio(value: cvalue, groupValue:index, onChanged: (val){
                          setState(() {
                            cvalue=val.toString() as int;
                          });
                        }),),
                      Divider()
                    ],
                  );
                })
            ),
          );
        });
  }
  Widget? _occupation(BuildContext context,List<String>h){
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
                          occupation=h[index];
                          Navigator.pop(context);
                        });
                      },
                        trailing:Radio(value: cvalue, groupValue:index, onChanged: (val){
                          setState(() {
                            cvalue=val.toString() as int;
                          });
                        }),),
                      Divider()
                    ],
                  );
                })
            ),
          );
        });
  }
  Widget? _income(BuildContext context,List<dynamic>h){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: double.maxFinite,
                child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: <Widget>[
                      ListTile(title: Text('${h[index]} lac'),onTap: (){
                        setState(() {
                          income=h[index];
                          Navigator.pop(context);
                        });
                      },
                        trailing:Radio(value: cvalue, groupValue:index, onChanged: (val){
                          setState(() {
                            cvalue=val.toString() as int;
                          });
                        }),),
                      Divider()
                    ],
                  );
                })
            ),
          );
        });
  }
}