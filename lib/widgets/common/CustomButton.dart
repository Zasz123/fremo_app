import 'package:flutter/material.dart';

class CustomDefaultButton extends StatelessWidget {
  final Widget child;
  final String text;
  final Function onPressed;
  final bool fullWidth;

  CustomDefaultButton({
    this.child,
    this.text,
    this.onPressed,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          primary: Theme.of(context).primaryColor,
        ),
        child: this.text != null
            ? Text(
                this.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            : this.child,
        onPressed: this.onPressed,
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final Widget child;
  final String text;
  final Function onPressed;
  final bool fullWidth;

  CustomOutlineButton({
    this.child,
    this.text,
    this.onPressed,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: Color(0xff95C7AE),
              width: 2.5,
            ),
          ),
          primary: Colors.white,
        ),
        child: this.text != null
            ? Text(
                this.text,
                style: TextStyle(
                  color: Color(0xff95C7AE),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            : this.child,
        onPressed: this.onPressed,
      ),
    );
  }
}
