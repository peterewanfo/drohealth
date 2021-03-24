class DrugModel{
  int id;
  String drug_name;
  String drug_type;
  String drug_category;
  String amount;
  String dosage;
  String img_url;

  DrugModel({
    this.id,
    this.drug_name,
    this.drug_type,
    this.drug_category,
    this.amount,
    this.dosage,
    this.img_url
  });

  DrugModel.fromJson(Map<dynamic, dynamic> json_data)
  : id = json_data["id"],
  drug_name = json_data["drug_name"],
  drug_type = json_data["drug_type"],
  drug_category = json_data["drug_category"],
  amount = json_data["amount"],
  dosage = json_data["dosage"],
  img_url = json_data["img_url"];

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      'drug_name': drug_name,
      'drug_type': drug_type,
      "drug_category":drug_category,
      "amount":amount,
      "dosage":dosage,
      "img_url":img_url
    };
  }


}