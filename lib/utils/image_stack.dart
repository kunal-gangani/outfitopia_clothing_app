import 'package:flutter/material.dart';
import 'package:outfitopia_clothing_app/utils/padding_with_text.dart';
import 'package:outfitopia_clothing_app/utils/text_in_photo.dart';
import 'package:outfitopia_clothing_app/utils/time_display_in_container.dart';
Widget photoStack({required String image}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(25),

                        ),
                      image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover,)
                    ),

                  ),
                ],
              ),
  );
}