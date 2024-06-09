import 'package:flutter/material.dart';
Widget circleAvatars_colour({required Color color,required BuildContext context}){
  double h = MediaQuery.sizeOf(context).height;
  return CircleAvatar(
    radius: h*0.025,
    backgroundColor: color,
  );
}