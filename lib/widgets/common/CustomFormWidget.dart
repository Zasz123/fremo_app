import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final FormFieldValidator<String> validatorFunction;
  final String placeholder;
  final bool isPassword;
  final bool readOnly;
  final String initialValue;
  final TextEditingController controller;

  CustomInput({
    this.validatorFunction,
    this.placeholder,
    this.readOnly = false,
    this.isPassword = false,
    this.initialValue,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      readOnly: readOnly,
      obscureText: isPassword,
      cursorWidth: 1.5,
      cursorColor: Color(0xff707070),
      style: TextStyle(
        fontSize: 20.0,
        color: readOnly ? Colors.black38 : Colors.black87,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Color(0xffe2e2e2),
          fontSize: 18.0,
        ),
        filled: true,
        fillColor: readOnly ? Color(0xffe2e2e2) : Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: readOnly
              ? BorderSide.none
              : BorderSide(
                  color: Color(0xffe2e2e2),
                  width: 1.0,
                ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: readOnly
              ? BorderSide.none
              : BorderSide(
                  color: Color(0xffe2e2e2),
                  width: 1.0,
                ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: readOnly
              ? BorderSide.none
              : BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
        ),
      ),
      validator: validatorFunction,
    );
  }
}
