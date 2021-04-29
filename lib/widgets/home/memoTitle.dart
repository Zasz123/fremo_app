import 'package:flutter/material.dart';

class MemoTitle extends StatelessWidget {
  final String title;

  MemoTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
