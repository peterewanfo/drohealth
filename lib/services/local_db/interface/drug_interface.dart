import 'package:drohealth/models/shopping_cart_model.dart';

abstract class DrugInterface {

  //Initiate the local database
  init();

  //Add drug to the local database
  addDrug(ShoppingCartModel drugModel);

  //Update Drug Details
  updateDrug(String id, ShoppingCartModel drugModel);

  //Get all drugs stored on the local database
  Future<List<ShoppingCartModel>> getDrugs();

  //Get Single Drug stored on the local database
  Future<dynamic> getSingleCartDetail(String id);

  //Get total drugs on store
  getTotalDrugs();

  //Delete food from the local database
  deleteDrug(String id);
  
  //Close DB
  close();

}