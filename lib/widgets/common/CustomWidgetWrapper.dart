import 'package:flutter/material.dart';

class CustomWidgetWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  CustomWidgetWrapper({
    this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: 30.0,
      horizontal: 20.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xff707070).withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(3, 12),
            // spreadRadius: 2.0,
          ),
        ],
      ),
      padding: padding,
      child: child,
    );
  }
}
