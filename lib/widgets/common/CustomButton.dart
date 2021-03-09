import 'package:flutter/material.dart';

class CustomDefaultButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  CustomDefaultButton({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Color(0xff95C7AE),
      child: this.child,
      onPressed: this.onPressed,
    );
  }
}
