import 'package:flutter/material.dart';

import 'package:hackzurich2020/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  ProductWidget({ this.product });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title),
          Text(product.subtitle),
          Text(product.price.toString()),
        ],
      ),
    );
  }
}
