
import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:flutter/material.dart';

class DetailsNotifier extends ChangeNotifier{

  int total_items;
  
  DetailsNotifier({
    @required this.total_items
  });

  void incrementItem(int previous_value){

    this.total_items = this.total_items + 1;

    //UPDATE ITEM ON THE DATABASE FROM HERE

    notifyListeners();

  }

}