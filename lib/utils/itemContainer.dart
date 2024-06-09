import 'package:flutter/material.dart';
import 'package:outfitopia_clothing_app/globals/globals.dart';
import 'package:outfitopia_clothing_app/globals/routes.dart';
import 'package:outfitopia_clothing_app/screens/detailPage.dart';

Widget itemContainer(
    {required String category, required BuildContext context}) {
  TextScaler textScaler = MediaQuery.of(context).textScaler;
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    child: Row(
      children: [
        ...products.map(
          (e) => (e['category'] == category)
              ? GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.detail_page,arguments: e);
                  },
                child: Container(
                    width: w * 0.45,
                    height: h * 0.27,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: h*0.2,
                            width: w*0.4,
                            padding: const EdgeInsets.only(top: 5),
                            child: Image.network(e['thumbnail'],fit: BoxFit.cover,),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Column(
                            children: [
                                Text(
                                  e['title'],
                                  style:
                                      TextStyle(fontSize: textScaler.scale(15)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("\$${e['price'].toString()}",style: TextStyle(
                                          fontSize: textScaler.scale(15)
                                      ),),
                                      Text("⭐ ${e['rating'].toString()}",style: TextStyle(
                                          fontSize: textScaler.scale(15)
                                      ),),
                                    ],
                                  ),
                                ),
                              Padding(padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(e['discountPercentage'].toString(),style: TextStyle(
                                      fontSize: textScaler.scale(14),
                                      color: Colors.red
                                    ),),
                                    Text("% Off",style: TextStyle(color: Colors.red,fontSize: textScaler.scale(14)),)
                                  ],
                                ),)
                              ],
                            ))
                      ],
                    ),
                  ),
              )
              : Container(),
        ),
      ],
    ),
  );
}
