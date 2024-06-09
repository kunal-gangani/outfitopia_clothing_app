import 'package:flutter/material.dart';
Widget circleAvatarsRow({required BuildContext context,required String number}){
  double h = MediaQuery.sizeOf(context).height;
  return CircleAvatar(
    radius: h*0.03,
    backgroundColor: Colors.grey,
    child: Center(
      child: Text(number,style: TextStyle(color: Colors.white),),
    ),
  );
}