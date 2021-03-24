import 'package:drohealth/style/__style.dart';
import 'package:flutter/material.dart';

class CustomRectButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final Color colors;
  final Color textColor;

  CustomRectButton({
    @required this.label,
    @required this.colors,
    this.onTap,
    @required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        radius: 15.0,
        borderRadius: BorderRadius.circular(5.0),
        onTap: onTap,
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: this.colors,
          ),
          child: Center(
              child: Text(
            this.label,
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: textColor, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
