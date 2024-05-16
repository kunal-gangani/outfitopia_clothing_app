import 'package:flutter/material.dart';
Widget timeDisplayWidget({required String time}){
  return Container(
    alignment: Alignment.center,
    width: 40,
    height: 40,
                            child: Text(time,style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 2,
                                fontWeight: FontWeight.w500
                            ),),
                            decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                          );
}