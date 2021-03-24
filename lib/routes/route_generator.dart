
import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:drohealth/routes/routes.dart';
import 'package:drohealth/ui/CartScreen/cart_screen.dart';
import 'package:drohealth/ui/DetailScreen/details_screen.dart';
import 'package:drohealth/ui/HomeScreen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  
  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;

    switch(settings.name){

      case Routes.home:
        return CupertinoPageRoute(builder: (context) => HomeScreen(),);
        break;
      case Routes.drug_details_screen:

        ShoppingCartModel nav_arguments = args;

        return CupertinoPageRoute(builder: (context) => DetailsScreen(shoppingCartModel: nav_arguments,),);
        break;
      case Routes.cart_screen:
        return CupertinoPageRoute(builder: (context) => CartScreen(), fullscreenDialog: true);
        break;
      default:
        break;
    }
  }
}