import 'package:drohealth/custom_widgets/custom_rect_button.dart';
import 'package:drohealth/models/shopping_cart_model.dart';
import 'package:drohealth/providers/__providers.dart';
import 'package:drohealth/services/local_db/repository/drug_repository.dart';
import 'package:drohealth/style/custom_colors.dart';
import 'package:drohealth/style/dimens.dart';
import 'package:drohealth/ui/DetailScreen/components/product_detail_segment.dart';
import 'package:drohealth/ui/DetailScreen/components/success_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/all.dart';

class DetailsScreen extends HookWidget {
  ShoppingCartModel shoppingCartModel;

  DetailsScreen({this.shoppingCartModel});

  @override
  Widget build(BuildContext context) {
    useProvider(totalPacks);

    DrugRepository.init();
    final total_drugs = DrugRepository.getTotalDrugs();

    final existing_cart_detail =
        DrugRepository.getSingleCartDetail(shoppingCartModel.id.toString());

    _loadingDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SuccesDialogWidget();
          });
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: CustomDimensions.defaultMargin),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: CustomDimensions.smallSpacing),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black)),
                          Container(
                            width: 45.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                                color: CustomColors.darkPurple,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: Image.asset(
                                          "assets/icons/shopping.png")),
                                  SizedBox(width: 5.0),
                                  FutureBuilder(
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
                                                      color: Colors.white))
                                          : Text("0",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white));
                                    },
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                    height: 240.0,
                                    width: double.infinity,
                                    child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset("assets/icons/" +
                                            shoppingCartModel.img_url))),
                                SizedBox(
                                    height: CustomDimensions.mediumSpacing),
                                Text(shoppingCartModel.drug_name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontWeight: FontWeight.bold)),
                                SizedBox(height: 4.0),
                                Text(shoppingCartModel.drug_name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontWeight: FontWeight.bold)),
                                SizedBox(height: 6.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(25))),
                                    SizedBox(width: 10.0),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("SOLD BY",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        SizedBox(height: 4.0),
                                        Text("Emzor Pharmaceuticals",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            width: 95.0,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      int total = (int.parse(
                                                              context
                                                                  .read(
                                                                      totalPacks)
                                                                  .state)) +
                                                          (int.parse(context
                                                              .read(totalPacks)
                                                              .state));

                                                      if (total > 0) {
                                                        context
                                                            .read(totalPacks)
                                                            .state = (total -
                                                                1)
                                                            .toString();
                                                      }
                                                    },
                                                    child: Container(
                                                        height: 25.0,
                                                        width: 25.0,
                                                        child: Center(
                                                          child: Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                  ),
                                                  Text(context
                                                      .read(totalPacks)
                                                      .state),
                                                  InkWell(
                                                    onTap: () {
                                                      context
                                                          .read(totalPacks)
                                                          .state = (int.parse(
                                                                  context
                                                                      .read(
                                                                          totalPacks)
                                                                      .state) +
                                                              1)
                                                          .toString();
                                                    },
                                                    child: Container(
                                                        height: 25.0,
                                                        width: 25.0,
                                                        child: Center(
                                                            child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .black))),
                                                  )
                                                ],
                                              ),
                                            )),
                                        SizedBox(width: 10.0),
                                        Text("Pack(s)")
                                      ],
                                    ),
                                    Text("385",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                                fontWeight: FontWeight.bold))
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Text("PRODUCT DETAILS",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontWeight: FontWeight.bold)),
                                SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ProductDetailSegment(
                                          title: "3x10",
                                          heading: "pack size",
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        ProductDetailSegment(
                                          title: shoppingCartModel.drug_name,
                                          heading: "constituents",
                                        ),
                                        SizedBox(height: 8.0),
                                        ProductDetailSegment(
                                          title: "Packs",
                                          heading: "Dispensed By",
                                        ),
                                      ],
                                    ),
                                    ProductDetailSegment(
                                      title: "asdf",
                                      heading: "Product Id",
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 200.0,
                                )
                              ])),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: CustomRectButton(
                        colors: CustomColors.droPurple,
                        label: "Add To Bag",
                        textColor: Colors.white,
                        onTap: () {
                          if (int.parse(context.read(totalPacks).state) < 1) {
                            Fluttertoast.showToast(
                                msg: "Increase item before adding to bag");
                          } else {
                            shoppingCartModel.total_cart_items =
                                context.read(totalPacks).state;

                            DrugRepository.init();
                            DrugRepository.addDrug(shoppingCartModel);

                            _loadingDialog(context);
                          }
                        },
                      )),
                ],
              ))),
    );
  }
}
