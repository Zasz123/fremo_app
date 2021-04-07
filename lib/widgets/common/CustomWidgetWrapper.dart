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

class CustomSingleChildScrollView extends StatelessWidget {
  final Widget child;

  CustomSingleChildScrollView({this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: child,
    );
  }
}

class CustomPageRouteWrapper extends StatelessWidget {
  final String title;
  final Widget child;

  CustomPageRouteWrapper({
    @required this.title,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: CustomSingleChildScrollView(
        child: CustomWidgetWrapper(
          child: child,
        ),
      ),
    );
  }
}
