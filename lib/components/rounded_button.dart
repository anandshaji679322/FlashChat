import 'package:flutter/material.dart';
import 'package:flashchat/screens/login_screen.dart';
class RoundedButton extends StatelessWidget {

  Color color;
  String title;
  final VoidCallback onpress;

  RoundedButton({required this.color,required this.title,required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
