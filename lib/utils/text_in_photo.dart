import 'package:flutter/material.dart';
Widget textInPhoto({required String data}){
  return Text(data,style: const TextStyle(
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontSize: 26,
                        fontWeight: FontWeight.w600
                      ),);
}