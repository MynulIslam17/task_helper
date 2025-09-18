

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWithShadow extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final int ? maxLine;

  const TextFieldWithShadow({
    super.key,
    required this.controller,
    required this.hint ,
    this.maxLine


  }) ;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // background color of TextField
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // shadow color
            spreadRadius: 2, // how much the shadow spreads
            blurRadius: 8, // blur effect
            offset: const Offset(0, 4), // x and y offset
          ),
        ],),
      child: TextFormField(

        controller: controller,
        maxLines: maxLine ?? 1,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }
}