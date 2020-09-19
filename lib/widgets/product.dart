import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

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
          Center(
            child: Image.asset(product.image, height: 96.0),
          ),
          Text(product.getFormattedPrice(), style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Color(0xFF000000),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          )),
          Text(product.title, style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Color(0xFF000000),
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          )),
          Text(product.subtitle, style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Color(0xFF000000),
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
          )),
        ],
      ),
    );
  }
}
