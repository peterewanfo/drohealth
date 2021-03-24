import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:drohealth/services/local_db/repository/drug_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartNotifier extends ChangeNotifier {
  List<ShoppingCartModel> all_carts;

  CartNotifier({this.all_carts});

  CartNotifier.init() {
    DrugRepository.init();
    this.all_carts = DrugRepository.getTotalDrugs();

    notifyListeners();
  }

  void updateShoppingCart(int index, ShoppingCartModel shoppingCartModel) {
    DrugRepository.init();
    DrugRepository.addDrug(shoppingCartModel);

    this.all_carts[index] = shoppingCartModel;

    //UPDATE ITEM ON THE DATABASE FROM HERE

    notifyListeners();
  }

  void deleteShoppingCart(int index, ShoppingCartModel shoppingCartModel) {
    //REMOVE FROM STORAGE
    DrugRepository.init();
    DrugRepository.deleteDrug(shoppingCartModel.id.toString());

    this.all_carts.removeAt(index);

    notifyListeners();
  }

  Future<String> getTotalCarts() {
    DrugRepository.init();
    final total_drugs = DrugRepository.getTotalDrugs();

    print(total_drugs.toString() + "=====}}}}}}}");

    return total_drugs;
  }
}
