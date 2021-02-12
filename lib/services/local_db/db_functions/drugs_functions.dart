import 'package:drohealth/models/drugs_model.dart';
import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:drohealth/services/local_db/interface/drug_interface.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DrugFunctions extends DrugInterface{

  String drug_box = "Drug";

  @override
  addDrug(ShoppingCartModel drugModel) async{
    // TODO: implement addDrug
    var box = await Hive.openBox(drug_box);

    var jsonifiedDrug = drugModel.toJson();

    box.put(drugModel.id.toString(), jsonifiedDrug);

  }

  @override
  close() {
    // TODO: implement close
    Hive.close();
  }

  @override
  deleteDrug(String id) async{
    // TODO: implement deleteDrug
    var box = await Hive.openBox(drug_box);
    await box.delete(id);

    print("Drug Deleted");

  }

  @override
  Future<List<ShoppingCartModel>> getDrugs() async{
    // TODO: implement getDrugs

    var fetch_box = await Hive.openBox(drug_box);

    List<ShoppingCartModel> drugs_list = [];

    for (int i = 0; i < fetch_box.length; i++){

      ShoppingCartModel drug = ShoppingCartModel.fromJson(fetch_box.getAt(i));

      drugs_list.add(drug);
      
    };

    return drugs_list;

  }

  @override
  Future<dynamic> getSingleCartDetail(String id) async{
    // TODO: implement getDrugs

    var fetch_box = await Hive.openBox(drug_box);

    if(fetch_box.containsKey(id)){
      ShoppingCartModel shoppingCartModel = ShoppingCartModel.fromJson(fetch_box.get(id));
      return shoppingCartModel;
    }
    return null;

  }

  @override
  Future<String> getTotalDrugs() async{
    // TODO: implement getTotalDrugs
    var fetch_box = await Hive.openBox(drug_box);

    String total = fetch_box.length.toString();
    return total;
  }

  @override
  init() async{
    // TODO: implement init
    print("Initializing Drugs DB");

    final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();

    Hive.init(appDocumentDirectory.path);

  }

  @override
  updateDrug(String id, ShoppingCartModel drugModel) async{
    // TODO: implement updateDrugFood

    try{
      var box = await Hive.openBox(drug_box);

      box.putAt(int.parse(id), drugModel);
      
      print("Updated Drug");
      
    }catch(e){
    }
    
  }

  
}