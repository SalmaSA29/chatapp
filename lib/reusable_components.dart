import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var fem = 1.0;
var ffem = 1.0;
Widget textformfield({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String labelText ,
  required IconData prefixIcon,
  required validate,
  Function(String)? onChanged,
  IconData? suffixIcon,
  VoidCallback? suffixIconPressed,
  bool Ispassword=false,
  TextEditingController? passwordmatch,

})=>Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10 * fem),
    color: const Color(0x5b092e47),
  ),
  child: TextFormField(
    obscureText: Ispassword,
    controller: controller,
    validator: validate,
    onChanged: onChanged,
    style: const TextStyle(color: Color(0xffffffff),),
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Color(0xffffffff),),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10 * fem),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(prefixIcon),
      prefixIconColor: const Color(0xffffffff),
      suffixIcon: suffixIcon!=null? IconButton(onPressed: suffixIconPressed,
        icon: Icon(
          suffixIcon,
        ),
      ) : null ,
      suffixIconColor: const Color(0xffffffff),
    ),
  ),
);