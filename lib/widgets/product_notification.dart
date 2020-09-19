import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:hackzurich2020/models/product.dart';
import 'package:hackzurich2020/shared/builders.dart';

class ProductNotificationWidget extends StatelessWidget {
  final Product product;

  ProductNotificationWidget({ this.product });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      height: 112.0,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        child: Row(
          children: [
            Image.asset(product.image, height: 96.0),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product added:', style: TextStyle(
                  fontSize: 16.0,
                ),),
                SizedBox(height: 4.0),
                Text(product.title, style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(height: 4.0),
                Text(product.getFormattedPrice(), style: TextStyle(
                  fontSize: 16.0,
                  color: getThemeColor(),
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
