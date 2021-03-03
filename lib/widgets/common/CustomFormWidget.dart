import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final FormFieldValidator<String> validatorFunction;
  final String placeholder;
  final bool isPassword;

  CustomInput(
      {this.validatorFunction, this.placeholder, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      cursorWidth: 1.5,
      cursorColor: Color(0xff707070),
      style: TextStyle(
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Color(0xffe2e2e2),
          fontSize: 18.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: const OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff707070),
            width: 2.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff707070),
          ),
        ),
      ),
      validator: validatorFunction,
    );
  }
}
