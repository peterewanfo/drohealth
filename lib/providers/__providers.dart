import 'package:drohealth/models/drugs_model.dart';
import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:drohealth/providers/cart_notifier.dart';
import 'package:drohealth/utils/enums.dart';
import 'package:hooks_riverpod/all.dart';

class AppThemeState extends StateNotifier<bool> {
  AppThemeState() : super(false);
  void setLightTheme() => state = true;
}

final appThemeStateNotifier = StateNotifierProvider((ref) => AppThemeState());

final viewTypeProvider = StateProvider<ViewType>((ref) {
  return ViewType.Grid;
});

final allCartProvider = StateProvider<List<ShoppingCartModel>>((ref) {
  List<ShoppingCartModel> available_shopping_carts = [];

  return available_shopping_carts;
});

final totalPacks = StateProvider<String>((ref) {
  return "0";
});

final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  List<ShoppingCartModel> all_shopping_cart = ref.read(allCartProvider).state;

  return CartNotifier(all_carts: all_shopping_cart);
});

final allDrugsProvider = StateProvider<List<DrugModel>>((ref) {
  var all_drugs = [
    DrugModel(
        id: 1,
        drug_name: "Kezitill Suspension.",
        drug_type: "Oral Suspension",
        drug_category: "Cefuroxime Axetil",
        dosage: "125mg",
        img_url: "kezitil_suspension.jpeg",
        amount: "2000"),
    DrugModel(
        id: 2,
        drug_name: "Kezitill",
        drug_type: "Tablet",
        drug_category: "Cefuroxime Axetil",
        dosage: "250mg",
        img_url: "kezitil.png",
        amount: "4000"),
    DrugModel(
        id: 3,
        drug_name: "Garlic Oil",
        drug_type: "Garlic Oil",
        drug_category: "Soft Gel",
        dosage: "650mg",
        img_url: "garlic_oil_caps.png",
        amount: "7000"),
    DrugModel(
        id: 4,
        drug_name: "Folic Acid (100)",
        drug_type: "Tablet",
        drug_category: "Folic Acid",
        dosage: "5mg",
        img_url: "folic_acid.jpeg",
        amount: "10000"),
    DrugModel(
        id: 5,
        drug_name: "Ciproto-4",
        drug_type: "Tablet",
        drug_category: "Cefuroxime Axetil",
        dosage: "250mg",
        img_url: "cyprotol.jpeg",
        amount: "3400"),
    DrugModel(
        id: 6,
        drug_name: "Aminfid 20",
        drug_type: "Tablet",
        drug_category: "Nifedipine",
        dosage: "20mg",
        img_url: "aminifd_20.jpeg",
        amount: "1200"),
    DrugModel(
        id: 7,
        drug_name: "Anadin Extra Soluble",
        drug_type: "Tablet",
        drug_category: "Aspirin",
        dosage: "20mg",
        img_url: "anadin_extra.jpeg",
        amount: "6500"),
    DrugModel(
        id: 8,
        drug_name: "Anadin Extra Original",
        drug_type: "Tablet",
        drug_category: "Aspirin",
        dosage: "20mg",
        img_url: "anadin_original.jpeg",
        amount: "1300"),
    DrugModel(
        id: 9,
        drug_name: "Cyprodine",
        drug_type: "Syrup",
        drug_category: "Syrup",
        dosage: "250mg",
        img_url: "cyprodine.jpg",
        amount: "2200"),
    DrugModel(
        id: 10,
        drug_name: "Cyprodine Original",
        drug_type: "Syrup",
        drug_category: "Syrup",
        dosage: "250mg",
        img_url: "cyprodine.jpeg",
        amount: "440"),
    DrugModel(
        id: 11,
        drug_name: "Folic Acid Hearts",
        drug_type: "Syrup",
        drug_category: "Syrup",
        dosage: "250mg",
        img_url: "folic_acid.jpeg",
        amount: "3240"),
    DrugModel(
        id: 12,
        drug_name: "Ibuprofen",
        drug_type: "Tablet",
        drug_category: "Capsules",
        dosage: "200mg",
        img_url: "ibuprofen.jpeg",
        amount: "6450"),
    DrugModel(
        id: 13,
        drug_name: "Ezetimible Zetiheal",
        drug_type: "Tablet",
        drug_category: "Zetiheal",
        dosage: "250mg",
        img_url: "zetiheal.jpeg",
        amount: "3450"),
    DrugModel(
        id: 14,
        drug_name: "Lipitor",
        drug_type: "Tablet",
        drug_category: "Pfizer",
        dosage: "250mg",
        img_url: "lipitor.jpeg",
        amount: "6340"),
    DrugModel(
        id: 15,
        drug_name: "Lyrica",
        drug_type: "Tablet",
        drug_category: "Lyrica",
        dosage: "250mg",
        img_url: "lyrica.jpeg",
        amount: "5430"),
    DrugModel(
        id: 16,
        drug_name: "Mensol Ladies",
        drug_type: "Syrup",
        drug_category: "mensol",
        dosage: "20mg",
        img_url: "mensol.jpeg",
        amount: "320"),
    DrugModel(
        id: 17,
        drug_name: "Panadol",
        drug_type: "Tablet",
        drug_category: "panadol",
        dosage: "20mg",
        img_url: "panadol.jpeg",
        amount: "2340"),
    DrugModel(
        id: 18,
        drug_name: "Paracetamol Tablet",
        drug_type: "Tablet",
        drug_category: "Paracetamol",
        dosage: "250mg",
        img_url: "paracetamol_tablet.jpeg",
        amount: "9870"),
  ];

  return all_drugs;
});
