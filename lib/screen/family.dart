import 'package:flutter/material.dart';
import 'package:myfirstflutter/data.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class Family extends StatefulWidget {
  const Family({Key? key}) : super(key: key);

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  String? occupation;
  String? moccupation;
  int? income;
  String? brother;
  String? sister;
  String? living;
  Map<String,dynamic>?family;
  final GlobalKey<ScaffoldState> _myGlobe = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    // _get();
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
    return Scaffold(key: _myGlobe,appBar: AppBar(automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Center(child: Text('Family',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
      ),),),
      body: FutureBuilder(
      //  future: _get(),
        builder: (context, snapshot) {
          return Stack(children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 2,right: 2,left: 2,bottom: 60),
                child:ListView(scrollDirection: Axis.vertical,physics: ScrollPhysics(),
                    children: <Widget>[
                      ListTile(title: Text('Father Occupation'),
                        subtitle:occupation==null?Text('Not filled',style: TextStyle(color:Colors.red),):Text(occupation.toString()),
                        trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                        onTap: (){
                          _occupation(context, Data().occupation);
                        },),
                      Divider(),
                      ListTile(title: Text('Mother Occupation'),
                        subtitle: moccupation==null?Text('Not filled',style: TextStyle(color:Colors.red),):Text(moccupation.toString()),
                        trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                        onTap: (){
                          _moccupation(context, Data().moccupation);
                        },),
                      Divider(),
                      ListTile(title: Text('Brother(s)'),
                        subtitle:brother==null?Text('Not filled',style: TextStyle(color:Colors.red),):Text(brother.toString()),
                        trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                        onTap: (){
                          _bcount(context, Data().brothers);
                        },),
                      Divider(),
                      ListTile(title: Text('Sister(s)'),
                        subtitle:sister==null?Text('Not filled',style: TextStyle(color:Colors.red),):Text(sister.toString()),
                        trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                        onTap: (){
                          _ccount(context, Data().brothers);
                        },),
                      Divider(),
                      ListTile(title: Text('Family Income'),
                        subtitle:income==null?Text('Not filled',style: TextStyle(color:Colors.red),):Text('$income lac'),
                        trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                        onTap: (){
                          _income(context, Data().income);
                        },),
                      Divider(),
                      ListTile(title: Text('Living With Parents?'),
                        subtitle:living==null?Text('Not filled',style: TextStyle(color:Colors.red),):Text(living.toString()),
                        trailing: Icon(Icons.navigate_next,size: 45,color: Colors.black),
                        onTap: (){
                          _living(context, Data().living);
                        },),

                    ])),
            Positioned(top: MediaQuery.of(context).size.height*0.81,
              child: Container(width: MediaQuery.of(context).size.width,height:60,
                  child:ElevatedButton(
                    onPressed: (){
                      if(occupation!=null&&moccupation!=null&&brother!=null&&sister!=null&&income!=null&&living!=null){
                        setState(() {
                          family={
                            'foccupation':occupation,
                            'moccupation':moccupation,
                            'brother':brother,
                            'sister':sister,
                            'fincome':income,
                            'living':living
                          };
                        //  _upload();
                        });

                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please provide above information'),
                            duration: Duration(seconds: 2)));
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
                        child: const Text('Save',textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),),),)
              ),
            ),
          ]);
        }
      ),
    );
  }

  Widget? _living(BuildContext context,List<String>h){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height*0.3,
                child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: <Widget>[
                      ListTile(title: Text(h[index]),onTap: (){
                        setState(() {
                          living=h[index];
                          Navigator.pop(context);
                        });
                      },),
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
                height: MediaQuery.of(context).size.height*0.7,
                child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: <Widget>[
                      ListTile(title: Text(h[index]),onTap: (){
                        setState(() {
                          occupation=h[index];
                          Navigator.pop(context);
                        });
                      },
                     ),
                      Divider()
                    ],
                  );
                })
            ),
          );
        });
  }
  Widget? _moccupation(BuildContext context,List<String>h){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height*0.7,
                child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: <Widget>[
                      ListTile(title: Text(h[index]),onTap: (){
                        setState(() {
                          moccupation=h[index];
                          Navigator.pop(context);
                        });
                      },
                      ),
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
                height: MediaQuery.of(context).size.height*0.5,
                child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: <Widget>[
                      ListTile(title: Text('${h[index]} lac'),onTap: (){
                        setState(() {
                          income=h[index];
                          Navigator.pop(context);
                        });
                      },
                     ),
                      Divider()
                    ],
                  );
                })
            ),
          );
        });
  }
  Widget? _bcount(BuildContext context,List<String>h){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height*0.5,
                child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: <Widget>[
                      ListTile(title: Text(h[index]),onTap: (){
                        setState(() {
                          brother=h[index];
                          Navigator.pop(context);
                        });
                      },
                      ),
                      Divider()
                    ],
                  );
                })
            ),
          );
        });
  }
  
  Widget? _ccount(BuildContext context,List<String>h){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height*0.5,
                child: ListView.builder(itemCount: h.length,itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: <Widget>[
                      ListTile(title: Text(h[index]),onTap: (){
                        setState(() {
                          sister=h[index];
                          Navigator.pop(context);
                        });
                      },
                      ),
                      Divider()
                    ],
                  );
                })
            ),
          );
        });
  }
}