import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
Widget categoriesText({required BuildContext context,required String name}){
  TextScaler textScaler = MediaQuery.of(context).textScaler;
  return GestureDetector(
    onTap: () {},
     child :Padding(padding: const EdgeInsets.all(5),
        child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(width: 2,color: Colors.black)
                ),
                child: Text(name,style: TextStyle(
                  fontSize: textScaler.scale(16)
                ),),
              ))
  );
}