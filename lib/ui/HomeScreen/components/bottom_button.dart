import 'package:drohealth/providers/__providers.dart';
import 'package:drohealth/routes/routes.dart';
import 'package:drohealth/services/local_db/repository/drug_repository.dart';
import 'package:drohealth/style/__style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomButton extends HookWidget {
  Future<dynamic> total_drugs;
  double width;

  BottomButton({
    this.total_drugs,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            color: CustomColors.darkPurple,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        height: 50.0,
        width: width,
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
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Image.asset("assets/icons/shopping.png")),
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
                                        fontWeight: FontWeight.bold,
                                      ))
                              : Text("0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ));
                        },
                      )))
                ]),
          ],
        ),
      ),
    );
  }
}
