import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirstflutter/models/users_model.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';

class Message extends StatefulWidget {
  const Message({Key? key,required this.id, required this.name}) : super(key: key);
  final String id;
  final String name;
  
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late String mgs;
  Users? user;
  TextEditingController message=TextEditingController();
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
    return Scaffold(appBar: AppBar(backgroundColor: Colors.white,centerTitle: true,title: Column(children: <Widget>[
      Text('${widget.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
      Text('Today at 5:00 PM',style: TextStyle(fontSize: 10,color: Colors.black),)
    ],),
    leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: (){
      Navigator.pop(context);
    }),),
      body: FutureBuilder(
      //  future: _chat(),
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[ 
              Expanded(flex: 9,
                child: Container(width: MediaQuery.of(context).size.height,height: MediaQuery.of(context).size.height,
                  child: ListView.builder(itemCount: snapshot.data.toString().length,shrinkWrap: true,physics: BouncingScrollPhysics(),itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Container(width: MediaQuery.of(context).size.width,alignment:(snapshot.data as Map)[index].data['sender']==user?.uid?Alignment.centerRight:Alignment.centerLeft,
                          padding: EdgeInsets.all(4),
                          child: Container(width: MediaQuery.of(context).size.width*0.6,
                            padding: EdgeInsets.all(8),
                            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(
                                colors: [Colors.red, Colors.orange],),
                            ),child: Row(
                            children: <Widget>[
                              Expanded(flex: 8,child: Text('${(snapshot.data as Map)[index]?.data['mgs']}',style: TextStyle(color: Colors.white,fontSize: 16),)),
                              Expanded(flex: 2,child: Text('${DateFormat("HH:mm").format(DateTime.fromMillisecondsSinceEpoch(int.parse((snapshot.data as Map)[index].data['time'].toString())))}',
                              style: TextStyle(fontSize: 12,color: Colors.white70),textAlign: TextAlign.end,))
                            ],
                          ),),
                        ),
                        SizedBox(height: 10)
                      ],
                    );
                  },)
                ),
              ),
              Expanded(flex: 1,child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black45,
                      width: 1,
                    )),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 25),
                    Expanded(flex: 7,
                      child: Container(
                        child: TextField(controller: message,
                          onChanged: (text) {
                            setState(() {
                              mgs=text;
                            });
                          },
                          decoration: InputDecoration(contentPadding: EdgeInsets.all(4),
                            hintText: 'Type a message',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(width: 1,)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(child: GestureDetector(child: Text('Send'),
                    onTap: (){
                      if(mgs.isNotEmpty &&user!=null){
                        setState(() {
                          message.text='';
                        });
                    //    _upload();
                      }
                    },))
                  ],
                ),
              ),)
            ],
          );
        }
      ),
    );
  }
}