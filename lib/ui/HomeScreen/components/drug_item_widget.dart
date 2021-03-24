import 'package:drohealth/style/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class DrugItemWidget extends HookWidget {
  Function onTap;
  String img_url;
  String drug_name;
  String drug_type;
  String drug_category;
  String amount;
  String dosage;

  DrugItemWidget({
    this.onTap,
    this.img_url,
    this.drug_name,
    this.drug_type,
    this.drug_category,
    this.amount,
    this.dosage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 10.0, left: 6.0, right: 6.0, top: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 3,
          shadowColor: Colors.grey.withOpacity(0.6),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                      height: 140.0,
                      width: double.infinity,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset("assets/icons/" + img_url)))),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$drug_name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                        SizedBox(width: 8.0),
                        Text(
                          "$drug_category",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Colors.grey[500]),
                        ),
                        Text(
                          "$drug_type - $dosage",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Colors.grey[500]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 8.0, right: 8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.grey,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 12.0),
                                child: Text(
                                  "N$amount",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: Colors.white, fontSize: 12.0),
                                )),
                          ],
                        )
                      ]),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
