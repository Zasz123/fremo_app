import 'package:flutter/material.dart';

final OverlayEntry loadingOverlayEntry = OverlayEntry(
  builder: (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
      ),
      width: 20.0,
      height: 20.0,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  },
);
