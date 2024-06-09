import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:outfitopia_clothing_app/globals/globals.dart';
import 'package:outfitopia_clothing_app/utils/detail_page_utils/circleAvatare_row.dart';
import 'package:outfitopia_clothing_app/utils/detail_page_utils/circleAvatars_colours.dart';
import 'package:toastification/toastification.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> prod =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          prod['title'],
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          const Icon(
            Icons.search_rounded,
            size: 30,
            color: Colors.blueGrey,
          ),
          SizedBox(
            width: w * 0.05,
          ),
          const Icon(
            Icons.menu,
            size: 30,
            color: Colors.blueGrey,
          ),
          SizedBox(width: w * 0.05)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: w,
                height: h * 0.33,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  prod['thumbnail'],
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: h * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        prod['title'],
                        style: TextStyle(
                          fontSize: textScaler.scale(20),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            isLike = !isLike;
                            setState(() {});
                            if (!favouriteList.contains(prod)) {
                              favouriteList.add(prod);
                            }
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: (isLike)
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.blue,
                                    )
                                  : const Icon(Icons.favorite_outline)))
                    ],
                  ),
                  RatingBarIndicator(
                    rating: prod['rating'],
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$",
                        style: TextStyle(
                            fontSize: textScaler.scale(20),
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(prod['price'].toString(),
                          style: TextStyle(
                              fontSize: textScaler.scale(20),
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: h * 0.01),
                  Text(
                    "Select Size",
                    style: TextStyle(
                        fontSize: textScaler.scale(14),
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        circleAvatarsRow(context: context, number: "6"),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatarsRow(context: context, number: "6.5"),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatarsRow(context: context, number: "7"),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatarsRow(context: context, number: "7.5"),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatarsRow(context: context, number: "8"),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatarsRow(context: context, number: "8.5"),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatarsRow(context: context, number: "9"),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatarsRow(context: context, number: "9.5")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Text(
                    "Select Color",
                    style: TextStyle(
                        fontSize: textScaler.scale(14),
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        circleAvatars_colour(
                            color: Colors.yellow, context: context),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatars_colour(
                            color: Colors.blueAccent, context: context),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatars_colour(
                            color: Colors.pink, context: context),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatars_colour(
                            color: Colors.cyan, context: context),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatars_colour(
                            color: Colors.blue, context: context),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        circleAvatars_colour(
                            color: Colors.black, context: context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Text(
                    "Specifications",
                    style: TextStyle(
                        fontSize: textScaler.scale(14),
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Text(
                    prod['description'],
                    style: TextStyle(
                        fontSize: textScaler.scale(15),
                        color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!cartList.contains(prod)) {
                        cartList.add(prod);
                        toastification.show(
                          context: context,
                          title: const Text("Added to Cart"),
                          animationDuration: const Duration(seconds: 1),
                          autoCloseDuration: const Duration(seconds: 2),
                        );
                      }
                    },
                    child: Container(
                      height: h * 0.07,
                      width: w,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: const Border(
                              top: BorderSide(color: Colors.black, width: 2))),
                      alignment: Alignment.center,
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: textScaler.scale(18),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
