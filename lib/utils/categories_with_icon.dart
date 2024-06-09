import 'package:flutter/material.dart';
import 'package:outfitopia_clothing_app/globals/globals.dart';

Widget categoriesWithIcon(BuildContext context,{required String image}){
  return CircleAvatar(
    backgroundColor: Colors.transparent,
    child: Image.network(image),
  );
}