import 'package:drohealth/custom_widgets/custom_round_button.dart';
import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:drohealth/providers/__providers.dart';
import 'package:drohealth/providers/cart_notifier.dart';
import 'package:drohealth/services/local_db/repository/drug_repository.dart';
import 'package:drohealth/style/custom_colors.dart';
import 'package:drohealth/style/dimens.dart';
import 'package:drohealth/ui/CartScreen/components/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/all.dart';

class CartScreen extends HookWidget {
  final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>((ref) {
    List<ShoppingCartModel> all_shopping_cart = ref.read(allCartProvider).state;

    return CartNotifier(all_carts: all_shopping_cart);
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    useProvider(cartNotifierProvider);

    DrugRepository.init();
    final total_drugs = DrugRepository.getTotalDrugs();

    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: CustomDimensions.defaultMargin),
            color: CustomColors.darkPurple,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0))),
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  height: 50.0,
                  width: size.width,
                  child: Column(
                    children: [
                      Container(
                        width: 50.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: Image.asset(
                                          "assets/icons/shopping.png")),
                                  SizedBox(width: 4.0),
                                  Text("Bag",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(color: Colors.white))
                                ],
                              ),
                              Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: CustomColors.colorWhite),
                                  child: Center(
                                      child: FutureBuilder(
                                    future: total_drugs,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      return snapshot.hasData
                                          ? Text(snapshot.data.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black))
                                          : Text("0",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black));
                                    },
                                  )))
                            ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: CustomColors.colorWhite,
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                          "Tap on an item for add, remove, delete options",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontWeight: FontWeight.bold)),
                    )),
                Expanded(
                    // child:Text("asdf")
                    child: context.read(cartNotifierProvider).all_carts.length >
                            0
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: context
                                .read(cartNotifierProvider)
                                .all_carts
                                .length,
                            itemBuilder: (context, int index) {
                              ShoppingCartModel shoppingCartModel = context
                                  .read(cartNotifierProvider)
                                  .all_carts[index];

                              return Container(
                                  child: CartItemWidget(
                                drug_name: shoppingCartModel.drug_name,
                                drug_type: shoppingCartModel.drug_type,
                                drug_category: shoppingCartModel.drug_category,
                                amount: shoppingCartModel.amount,
                                dosage: shoppingCartModel.dosage,
                                img_url: shoppingCartModel.img_url,
                                total_cart_items:
                                    shoppingCartModel.total_cart_items,
                                increment_purchase: () {
                                  //INCREMENT CART TO +1
                                  ShoppingCartModel post_shoppingCartModel =
                                      ShoppingCartModel(
                                          id: shoppingCartModel.id,
                                          drug_name:
                                              shoppingCartModel.drug_name,
                                          drug_type:
                                              shoppingCartModel.drug_type,
                                          drug_category:
                                              shoppingCartModel.drug_category,
                                          amount: shoppingCartModel.amount,
                                          dosage: shoppingCartModel.dosage,
                                          img_url: shoppingCartModel.img_url,
                                          total_cart_items: (int.parse(
                                                      shoppingCartModel
                                                          .total_cart_items) +
                                                  1)
                                              .toString());

                                  context
                                      .read(cartNotifierProvider)
                                      .updateShoppingCart(
                                          index, post_shoppingCartModel);
                                },
                                decrement_purchase: () {
                                  //INCREMENT CART TO +1
                                  ShoppingCartModel post_shoppingCartModel =
                                      ShoppingCartModel(
                                          id: shoppingCartModel.id,
                                          drug_name:
                                              shoppingCartModel.drug_name,
                                          drug_type:
                                              shoppingCartModel.drug_type,
                                          drug_category:
                                              shoppingCartModel.drug_category,
                                          amount: shoppingCartModel.amount,
                                          dosage: shoppingCartModel.dosage,
                                          img_url: shoppingCartModel.img_url,
                                          total_cart_items: (int.parse(
                                                      shoppingCartModel
                                                          .total_cart_items) -
                                                  1)
                                              .toString());

                                  context
                                      .read(cartNotifierProvider)
                                      .updateShoppingCart(
                                          index, post_shoppingCartModel);
                                },
                                delete_item: () {
                                  ShoppingCartModel post_shoppingCartModel =
                                      ShoppingCartModel(
                                          id: shoppingCartModel.id,
                                          drug_name:
                                              shoppingCartModel.drug_name,
                                          drug_type:
                                              shoppingCartModel.drug_type,
                                          drug_category:
                                              shoppingCartModel.drug_category,
                                          amount: shoppingCartModel.amount,
                                          dosage: shoppingCartModel.dosage,
                                          img_url: shoppingCartModel.img_url,
                                          total_cart_items: shoppingCartModel
                                              .total_cart_items);

                                  context
                                      .read(cartNotifierProvider)
                                      .deleteShoppingCart(
                                          index, post_shoppingCartModel);
                                },
                              ));
                              // return CartItemWidget();
                            })
                        : Center(
                            child: Text("Bag is currently empty !!!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(color: Colors.white)))),
                Container(
                    child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                          Text("0.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))
                        ]),
                    SizedBox(
                      height: 15.0,
                    ),
                    CustomRoundButton(
                      colors: CustomColors.colorWhite,
                      label: "Checkout",
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
