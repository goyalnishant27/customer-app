import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  var _labelText;
  var showstar;
  CustomTextField(this.controller, this._labelText, this.showstar);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: RichText(
              text: TextSpan(
                  text: "$_labelText",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      ),
                  children: [
                showstar!
                    ? TextSpan(
                        text: " *",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: "BrandonReg"))
                    : TextSpan()
              ])),
        labelStyle: TextStyle(
          color: Colors.black,
          fontFamily: "BrandonReg",
          height: 0.8,
          fontSize: 18.0,
          
          // background: Paint
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
        // border: UnderlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
      ),
    );
  }
}