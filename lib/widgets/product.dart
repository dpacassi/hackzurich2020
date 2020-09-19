import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 2.0,
            ),
            child: Text(product.getFormattedPrice(), style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Color(0xFF000000),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          Text(product.title, style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Color(0xFF000000),
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(height: 2.0),
          Text(product.subtitle, style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Color(0xFF000000),
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
          )),
          SizedBox(height: 2.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothStarRating(
                allowHalfRating: true,
                onRated: (v) {},
                starCount: 5,
                rating: product.rating,
                size: 16.0,
                isReadOnly: true,
                color: Color(0xFFFF6600),
                borderColor: Color(0xFFFF6600),
                spacing: 0.0,
              ),
              SizedBox(width: 4.0),
              Text(product.ratingCount.toString(), style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
