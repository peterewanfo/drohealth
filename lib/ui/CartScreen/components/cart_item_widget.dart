import 'package:drohealth/style/__style.dart';
import 'package:drohealth/style/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/all.dart';

class CartItemWidget extends HookWidget {

  String drug_name;
  String drug_type;
  String drug_category;
  String amount;
  String dosage;
  String img_url;
  String total_cart_items;
  Function increment_purchase;
  Function decrement_purchase;
  Function delete_item;

  final showOptions = StateProvider<bool>((ref){
    return false;
  });

  CartItemWidget({
    this.drug_name,
    this.drug_type,
    this.drug_category,
    this.amount,
    this.dosage,
    this.img_url,
    this.total_cart_items,
    this.increment_purchase,
    this.decrement_purchase,
    this.delete_item
  });

  @override
  Widget build(BuildContext context) {

    useProvider(showOptions);

    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              context.read(showOptions).state = !context.read(showOptions).state;
            },
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [

                      Container(
                      width:50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: FittedBox(
                              fit: BoxFit.cover, child: Image.asset("assets/icons/" + img_url)
                          ),
                    ),

                      
                    SizedBox(width: 10.0),

                    Text("$total_cart_items X", style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white) ),

                    SizedBox(width: 10.0),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$drug_name", style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white, fontWeight: FontWeight.bold) ),
                        SizedBox(height:4.0),
                        Text("$drug_type", style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white) ),
                      ],
                    )

                    ] 
                  ),
                ),
                Text("N$amount", style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white, fontWeight: FontWeight.bold ))

              ],
            ),
          ),
          context.read(showOptions).state 
          ? Column(
            children: [
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: CustomDimensions.defaultMargin, right: CustomDimensions.defaultMargin, ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: delete_item,
                      child: Icon(Icons.delete, color:
                                      Colors.white,
                                  size: 35.0),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: decrement_purchase,
                            child: Icon(
                                Icons.remove_circle,
                                color:
                                    Colors.white,
                                size: 35.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0),
                            child: Text("$total_cart_items",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight:
                                            FontWeight.bold)),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: increment_purchase,
                            child: Icon(
                                  Icons.add_circle,
                                  color:
                                      Colors.white,
                                  size: 35.0),
                          )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
          :
          SizedBox()
        ],
      )
    );
  }
}