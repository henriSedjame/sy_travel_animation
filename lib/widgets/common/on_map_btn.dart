import 'package:flutter/material.dart';

class OnMapBtn extends StatelessWidget {

  VoidCallback onPressed;

  OnMapBtn({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 30,
      child: FlatButton(
        child: Text('ON MAP', style: TextStyle(
          fontSize: 13
        ),),
        onPressed: onPressed,
      ),
    );
  }
}
