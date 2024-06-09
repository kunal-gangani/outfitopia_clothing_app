import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitopia_clothing_app/globals/globals.dart';
import 'package:outfitopia_clothing_app/globals/routes.dart';
import 'package:outfitopia_clothing_app/utils/bottomNavigationBar.dart';
import 'package:outfitopia_clothing_app/utils/itemContainer.dart';
import 'package:outfitopia_clothing_app/utils/search_product_widget.dart';
import 'package:outfitopia_clothing_app/utils/image_stack.dart';
import 'package:outfitopia_clothing_app/utils/text_of_category.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String cat = "All";
  RangeValues rangeValues = const RangeValues(0, 10000);

  @override
  void initState() {
    category.insert(0, "All");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.06,
              ),
              Row(
                children: [
                  searchProduct(h: h * 0.06, w: w * 0.65),
                  SizedBox(
                    width: w * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.favourites_page);
                    },
                    child: const Icon(
                      Icons.favorite,
                      size: 35,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.04,
                  ),
                  const Icon(Icons.notifications, size: 35, color: Colors.blue)
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              const Divider(),
              CarouselSlider(
                items: images.map((e) => photoStack(image: e)).toList(),
                options: CarouselOptions(
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlay: true,
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textOfCategory(
                    textScaler: textScaler,
                    name: "Category",
                    color: Colors.blue.shade900,
                  ),
                  textOfCategory(
                    textScaler: textScaler,
                    name: "More Category",
                    color: Colors.lightBlue,
                  )
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...category.map(
                      (e) => GestureDetector(
                        onTap: () {
                          cat = e;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color:
                                  (cat == e) ? Colors.blue : Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Text(
                            e.toString().replaceFirst(
                                  e[0],
                                  e[0].toString().toUpperCase(),
                                ),
                            style: TextStyle(
                              fontSize: textScaler.scale(14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.01),
              if (cat == "All") ...[
                ...category.map(
                  (e) => Column(
                    children: [
                      itemContainer(category: e, context: context),
                    ],
                  ),
                ),
              ] else ...[
                itemContainer(category: cat, context: context),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          width: w,
          height: h * 0.09,
          padding: const EdgeInsets.only(top: 5, left: 5),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 1.5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomNavigationBar(
                  icon: CupertinoIcons.home, text: "Home", context: context),
              bottomNavigationBar(
                  icon: CupertinoIcons.search,
                  text: "Explore",
                  context: context),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.cart_page);
                  },
                  child: bottomNavigationBar(
                      icon: CupertinoIcons.cart,
                      text: "Cart",
                      context: context)),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.favourites_page);
                  },
                  child: bottomNavigationBar(
                      icon: Icons.favorite,
                      text: "Favourites",
                      context: context)),
              bottomNavigationBar(
                  icon: CupertinoIcons.person,
                  text: "Profile",
                  context: context)
            ],
          )),
    );
  }

  Widget mySubCategory({
    required BuildContext context,
    required String image,
    required String text,
  }) {
    double w = MediaQuery.of(context).size.width;
    TextScaler textScale = MediaQuery.textScalerOf(context);
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: w * 0.07,
            backgroundColor: const Color(0xfff7f2ed),
            child: Transform.scale(
              scale: 0.8,
              child: Image.asset(
                image,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: textScale.scale(14),
              height: 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
