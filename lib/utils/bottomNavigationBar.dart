import 'package:flutter/material.dart';

Widget bottomNavigationBar({required IconData icon,required String text,required BuildContext context}){
  TextScaler textScaler = MediaQuery.of(context).textScaler;
  return Column(
    children: [
      Icon(icon,color: Colors.blue,size: 35),
      Text(text,style: TextStyle(
        fontSize: textScaler.scale(14)
      ),)
    ],
    );
}