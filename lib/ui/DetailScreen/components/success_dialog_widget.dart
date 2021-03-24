import 'package:drohealth/custom_widgets/custom_rect_button.dart';
import 'package:drohealth/routes/routes.dart';
import 'package:drohealth/style/__style.dart';
import 'package:flutter/material.dart';

class SuccesDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
                margin: EdgeInsets.only(top: 40.0),
                padding: EdgeInsets.only(top: 50.0),
                height: 250.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Text("SUCCESS",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    Text("Item successfully added to cart",
                        style: Theme.of(context).textTheme.bodyText2),
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(Routes.cart_screen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: CustomDimensions.defaultMargin),
                        child: CustomRectButton(
                          colors: Color(0xFF1AA7BA),
                          label: "View Bag",
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: CustomDimensions.defaultMargin),
                        child: CustomRectButton(
                          colors: Color(0xFF1AA7BA),
                          label: "Done",
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
            Center(
              child: Positioned(
                top: 0,
                child: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF1AA7BA),
                        borderRadius: BorderRadius.circular(60.0)),
                    child: Icon(Icons.check, size: 40.0, color: Colors.white)),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
