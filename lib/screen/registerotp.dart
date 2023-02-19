import 'package:flutter/material.dart';
import 'package:myfirstflutter/widgets/app_responsive.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class RegisterOtp extends StatefulWidget {
  const RegisterOtp({Key? key, required this.user, required this.phone, required this.id}) : super(key: key);
  final Map<String,dynamic>user;
  final String phone;
  final String id;
  @override
  State<RegisterOtp> createState() => _RegisterOtpState();
}

class _RegisterOtpState extends State<RegisterOtp> {
  late String verifiid;
  late String _smsCode;
  final GlobalKey<ScaffoldState> _myGlobe = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    verifiid=widget.id;
    print(verifiid);
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
      body: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
        Text('Verification Code',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        Padding(
          padding: const EdgeInsets.only(top: 40,left: 30,right: 30,bottom: 20),
          child: Text('OTP has been sent to your mobile number please verify',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: PinInputTextField(
            pinLength: 6,
            onChanged: (val){
              this._smsCode=val;
            },
            autoFocus: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("If you didn't receive a code!",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
              SizedBox(width: 10,),
              Text('Resend',textAlign: TextAlign.center,style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 18),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: ElevatedButton(
            onPressed: () {
              if(_smsCode.length==6){
              //  signIn();
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please provide a valid phone number'),
                    duration: Duration(seconds: 2)));
              }
            },
          //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          //  padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.orange],),
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
              ),
              child: Container(
                constraints: const BoxConstraints(minWidth: 40.0, minHeight: 50.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: const Text('Verify',textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                ),),),),
        )

      ],),
    );
  }
}