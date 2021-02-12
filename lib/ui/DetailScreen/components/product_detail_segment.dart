import 'package:flutter/material.dart';

class ProductDetailSegment extends StatelessWidget {

  String heading;
  String title;

  ProductDetailSegment({
    this.heading,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          SizedBox(
            width: 20.0,
            height:20.0,
            child: Image.asset("assets/icons/shopping.png")
          ),
          SizedBox(width:5.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(heading, style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 16.0) ),
              SizedBox(height: 4.0,),
              Text(title, style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold, fontSize: 18.0) )
            ],
          )
        ],
      )
    );
  }
}
