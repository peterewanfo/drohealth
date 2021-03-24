import 'dart:io';

import 'package:drohealth/models/drugs_model.dart';
import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:drohealth/providers/__providers.dart';
import 'package:drohealth/routes/routes.dart';
import 'package:drohealth/services/local_db/repository/drug_repository.dart';
import 'package:drohealth/style/__style.dart';
import 'package:drohealth/ui/HomeScreen/components/__component.dart';
import 'package:drohealth/ui/HomeScreen/components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/all.dart';

class HomeScreen extends HookWidget {
  final searchedDrugsContentProvider = StateProvider<List<DrugModel>>((ref) {
    return ref.read(allDrugsProvider).state;
  });

  @override
  Widget build(BuildContext context) {
    useProvider(allDrugsProvider);
    useProvider(searchedDrugsContentProvider);
    useProvider(totalPacks);

    DrugRepository.init();
    final total_drugs = DrugRepository.getTotalDrugs();

    DateTime currentBackPressTime;
    final size = MediaQuery.of(context).size;

    var safePadding = MediaQuery.of(context).padding.top;

    return WillPopScope(
        onWillPop: () {
          DateTime now = DateTime.now();

          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime) > Duration(seconds: 2)) {
            currentBackPressTime = now;

            Fluttertoast.showToast(
                msg: "Press Back Once Again to Exit",
                backgroundColor: Colors.black);

            return Future.value(false);
          }

          exit(0);
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Container(
                    child: Column(
              children: [
                CustomAppBar(
                  title: "125 item(s)",
                  onChanged: (text) {
                    text = text.toLowerCase();
                    context.read(searchedDrugsContentProvider).state =
                        context.read(allDrugsProvider).state.where((item) {
                      var itemTitle = item.drug_name.toLowerCase();
                      return itemTitle.contains(text);
                    }).toList();
                  },
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 50.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            primary: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: context
                                .read(searchedDrugsContentProvider)
                                .state
                                .length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              DrugModel drug_detail = context
                                  .read(searchedDrugsContentProvider)
                                  .state[index];

                              return DrugItemWidget(
                                drug_name: drug_detail.drug_name,
                                drug_type: drug_detail.drug_type,
                                drug_category: drug_detail.drug_category,
                                amount: drug_detail.amount,
                                dosage: drug_detail.dosage,
                                img_url: drug_detail.img_url,
                                onTap: () async {
                                  ShoppingCartModel shoppingCartModel =
                                      ShoppingCartModel(
                                          id: drug_detail.id.toString(),
                                          drug_name: drug_detail.drug_name,
                                          drug_type: drug_detail.drug_type,
                                          drug_category:
                                              drug_detail.drug_category,
                                          amount: drug_detail.amount,
                                          dosage: drug_detail.dosage,
                                          img_url: drug_detail.img_url,
                                          total_cart_items: "0");

                                  final existing_cart_detail =
                                      await DrugRepository.getSingleCartDetail(
                                          shoppingCartModel.id.toString());

                                  if (existing_cart_detail != null) {
                                    shoppingCartModel.total_cart_items =
                                        existing_cart_detail.total_cart_items;

                                    context.read(totalPacks).state =
                                        shoppingCartModel.total_cart_items;
                                  } else {
                                    shoppingCartModel.total_cart_items = "0";
                                    context.read(totalPacks).state = "0";
                                  }

                                  Navigator.of(context).pushNamed(
                                      Routes.drug_details_screen,
                                      arguments: shoppingCartModel);
                                },
                              );
                            },
                          )),
                      Positioned(
                        bottom: 0,
                        child: InkWell(
                          onTap: () async {
                            //FETCH CART DATA
                            var all_cart = await DrugRepository.getDrugs();

                            context.read(allCartProvider).state = all_cart;

                            Navigator.of(context).pushNamed(Routes.cart_screen);
                          },
                          onLongPress: () {
                            Navigator.of(context).pushNamed(Routes.cart_screen);
                          },
                          child: BottomButton(
                            total_drugs: total_drugs,
                            width: size.width,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )))));
  }
}
