import 'dart:io';

import 'package:drohealth/style/__style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/all.dart';

final searchOpenIndicatorProvider = StateProvider<bool>((ref) {
  return false;
});

class CustomAppBar extends HookWidget {
  String title;
  Function onChanged;

  CustomAppBar({@required this.title, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    useProvider(searchOpenIndicatorProvider);

    DateTime currentBackPressTime;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(
          top: CustomDimensions.defaultMargin,
          bottom: CustomDimensions.smallSpacing / 1.5,
          left: CustomDimensions.defaultMargin,
          right: CustomDimensions.defaultMargin),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    DateTime now = DateTime.now();

                    if (currentBackPressTime == null ||
                        now.difference(currentBackPressTime) >
                            Duration(seconds: 2)) {
                      currentBackPressTime = now;

                      Fluttertoast.showToast(
                          msg: "Press Back Once Again to Exit",
                          backgroundColor: Colors.black);

                      return Future.value(false);
                    }

                    exit(0);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              Expanded(
                  child: Center(
                      child: Text(title,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontWeight: FontWeight.bold,
                              )))),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 200.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: Image.asset("assets/icons/sort.png")),
                    )),
                Container(
                    padding: EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: SizedBox(
                          width: 18.0,
                          height: 18.0,
                          child: Image.asset("assets/icons/filter.png")),
                    )),
                InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    context.read(searchOpenIndicatorProvider).state =
                        !context.read(searchOpenIndicatorProvider).state;
                  },
                  child: Container(
                      padding: EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: SizedBox(
                            width: 18.0,
                            height: 18.0,
                            child: Image.asset("assets/icons/loupe.png")),
                      )),
                ),
              ],
            ),
          ),
          context.read(searchOpenIndicatorProvider).state
              ? Container(
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      SizedBox(width: 8.0),
                      Icon(Icons.search),
                      Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.text,
                          style: Theme.of(context).textTheme.bodyText2,
                          decoration: InputDecoration(
                            hintText: "Search anything",
                            border: InputBorder.none,
                          ),
                          onChanged: (text) => onChanged(text),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
