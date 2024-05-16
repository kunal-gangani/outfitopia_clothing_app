import 'package:flutter/material.dart';
Widget paddingWithText(){
  return const Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(":",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white
                            ),),
                          );
}