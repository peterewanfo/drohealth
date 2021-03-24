
import 'package:drohealth/models/drugs_model.dart';
import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:drohealth/services/local_db/db_functions/drugs_functions.dart';

class DrugRepository{

  static var dbObject;

  static init(){
    dbObject = DrugFunctions();
    dbObject.init();
  }

  static addDrug(ShoppingCartModel drug) => dbObject.addDrug(drug);

  static deleteDrug(String id) => dbObject.deleteDrug(id);

  static getDrugs() => dbObject.getDrugs();

  static getSingleCartDetail(String id) => dbObject.getSingleCartDetail(id);

  static getTotalDrugs() => dbObject.getTotalDrugs();

  static updateDrug(String id, ShoppingCartModel drugModel) => dbObject.updateDrug(id, drugModel);

  static close() => dbObject.close();
  
}