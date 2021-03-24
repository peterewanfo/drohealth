
class ShoppingCartModel{

  String id;
  String drug_name;
  String drug_type;
  String drug_category;
  String amount;
  String dosage;
  String img_url;
  String total_cart_items;

  ShoppingCartModel({
    this.id,
    this.drug_name,
    this.drug_type,
    this.drug_category,
    this.amount,
    this.dosage,
    this.img_url,
    this.total_cart_items
  });

  ShoppingCartModel.fromJson(Map<dynamic, dynamic> json_data)
  : id = json_data["id"],
  drug_name = json_data["drug_name"],
  drug_type = json_data["drug_type"],
  drug_category = json_data["drug_category"],
  amount = json_data["amount"],
  dosage = json_data["dosage"],
  img_url = json_data["img_url"],
  total_cart_items = json_data["total_cart_items"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'drug_name': drug_name,
      'drug_type': drug_type,
      "drug_category":drug_category,
      "amount":amount,
      "dosage":dosage,
      "img_url":img_url,
      "total_cart_items":total_cart_items
    };
  }


}