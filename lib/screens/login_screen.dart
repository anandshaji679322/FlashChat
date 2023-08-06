import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'Login_Screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 100.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                email = value;
              },
              textAlign: TextAlign.center,
              decoration: KInputDecoration.copyWith(
                hintText: 'Enter Your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              textAlign: TextAlign.center,
              decoration: KInputDecoration.copyWith(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                color: Colors.lightBlueAccent, title: 'Log In', onpress: () async{
                  try {
                    setState(() {
                      EasyLoading.show();
                      showSpinner=true;
                    });
                     final login=await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                     if(login != null){
                       showSpinner=false;
                       EasyLoading.dismiss();
                       setState(() {
                         Navigator.pushNamed(context, ChatScreen.id);

                       });

                     }
                  }
                  catch(e){
                    EasyLoading.showError('Failed To Login');
                    print(e);
                  }
            }),
          ],
        ),
      ),
    );
  }
}
