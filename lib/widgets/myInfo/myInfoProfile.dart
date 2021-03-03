import 'package:flutter/material.dart';

class MyInfoProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RawMaterialButton(
        onPressed: () {
          // image change event code
          print("image change event");
        },
        child: ClipOval(
          child: Image.network(
            'https://blog.kakaocdn.net/dn/nhm3d/btqB11oGTif/3Gtf5FIczSo3kL0h4lAXQ0/img.jpg',
            height: 150.0,
            width: 150.0,
            fit: BoxFit.cover,
          ),
        ),
        shape: CircleBorder(),
      ),
    );
  }
}
