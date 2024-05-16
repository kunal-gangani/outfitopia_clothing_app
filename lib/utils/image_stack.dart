import 'package:flutter/material.dart';
import 'package:outfitopia_clothing_app/utils/padding_with_text.dart';
import 'package:outfitopia_clothing_app/utils/text_in_photo.dart';
import 'package:outfitopia_clothing_app/utils/time_display_in_container.dart';
Widget photoStack(){
  return Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      )
                  ),
                  child: const Image(
                    image: AssetImage("assets/images/shoe1.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textInPhoto(data: "Super Flash Sale"),
                      textInPhoto(data: "50% Off"),
                      Row(
                        children: [
                          timeDisplayWidget(time: "08"),
                          paddingWithText(),
                          timeDisplayWidget(time: "34"),
                          paddingWithText(),
                          timeDisplayWidget(time: "52")
                        ],
                      )
                    ],
                  ),
                ))
              ],
            );
}