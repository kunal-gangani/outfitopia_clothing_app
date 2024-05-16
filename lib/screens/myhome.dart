import 'package:flutter/material.dart';
import 'package:outfitopia_clothing_app/utils/image_stack.dart';
import 'package:outfitopia_clothing_app/utils/padding_with_text.dart';
import 'package:outfitopia_clothing_app/utils/search_product_widget.dart';
import 'package:outfitopia_clothing_app/utils/text_in_photo.dart';
import 'package:outfitopia_clothing_app/utils/time_display_in_container.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                searchProduct(),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.favorite_border_outlined,
                  size: 35,
                  color: Colors.grey,),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.notifications,size: 35,color: Colors.grey,)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    photoStack(),
                    photoStack(),
                    photoStack(),
                  ],
                ),
              ),
            ),
            // Make the Row with CircleAvatar scrollable
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(),
                  CircleAvatar(),
                  CircleAvatar(), 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}