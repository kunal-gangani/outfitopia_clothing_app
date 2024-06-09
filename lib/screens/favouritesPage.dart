import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:outfitopia_clothing_app/globals/globals.dart';
class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: (favouriteList.isEmpty) ? Center(
        child: Text("Add some products to Favourites first",style: TextStyle(
          fontSize: textScaler.scale(16),
        ),
        ),
      )
      : SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            ...favouriteList.map((e) => GestureDetector(
              child: Container(
                height: h*0.4,
                width: w,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: h*0.30,
                      width: w*0.45,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 2),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          Expanded(child: Image.network(e['thumbnail'])),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e['title'],style: TextStyle(
                                fontSize: textScaler.scale(18),
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600
                              ),),
                              RatingBarIndicator(
                                rating: e['rating'],
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                              SizedBox(height: h*0.015,),
                              Row(
                                children: [
                                  Text(e['discountPercentage'].toString(),style: const TextStyle(
                                    color: Colors.red,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500
                                  ),),
                                   Row(
                                    children: [
                                      const Text("% Off",style: TextStyle(
                                          color: Colors.red,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w500
                                      ),),
                                      SizedBox(width: w*0.1,),
                                      const Icon(Icons.remove_circle,color: Colors.blue,size: 25,)
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
            ),
      )
    );
  }
}
