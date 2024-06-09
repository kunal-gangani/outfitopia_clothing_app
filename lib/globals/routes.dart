import 'package:flutter/material.dart';
import 'package:outfitopia_clothing_app/screens/cartPage.dart';
import 'package:outfitopia_clothing_app/screens/favouritesPage.dart';
import 'package:outfitopia_clothing_app/screens/myhome.dart';
import 'package:outfitopia_clothing_app/screens/detailPage.dart';

class Routes{
  static String myHome = '/';
  static String detail_page = 'detail_page';
  static String cart_page = 'cart_page';
  static String favourites_page = 'favourites_page';

   static Map<String,WidgetBuilder> myRoutes = {
    myHome : (context) => const MyHome(),
    detail_page : (context) => const DetailPage(),
     cart_page : (context) => const CartPage(),
     favourites_page : (context) => const FavouritesPage()
  };
}