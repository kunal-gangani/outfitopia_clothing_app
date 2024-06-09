import 'package:flutter/material.dart';
Widget textOfCategory({required TextScaler textScaler,required String name,required Color color}){
  return Text(name,
    style: TextStyle(
        color: color,
        fontSize: textScaler.scale(18),
        letterSpacing: 1.5,
        fontWeight: FontWeight.w400
    ),);
}