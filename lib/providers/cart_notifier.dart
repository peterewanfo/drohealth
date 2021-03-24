
import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:drohealth/services/local_db/repository/drug_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartNotifier extends ChangeNotifier{

  List<ShoppingCartModel> all_carts;
  
  CartNotifier({
    this.all_carts
  });

  void updateShoppingCart(int index, ShoppingCartModel shoppingCartModel){

    DrugRepository.init();
    DrugRepository.addDrug(shoppingCartModel);

    this.all_carts[index] = shoppingCartModel;

    //UPDATE ITEM ON THE DATABASE FROM HERE
    
    notifyListeners();

  }

  void deleteShoppingCart(int index, ShoppingCartModel shoppingCartModel){

    //REMOVE FROM STORAGE
    DrugRepository.init();
    DrugRepository.deleteDrug(shoppingCartModel.id.toString() );

    this.all_carts.removeAt(index);

    notifyListeners();

  }

}