import 'package:intl/intl.dart';

class Product {
  String title;
  String subtitle;
  String image;
  double price;

  Product({
    this.title,
    this.subtitle,
    this.image,
    this.price,
  });

  String getFormattedPrice() {
    final formatter = new NumberFormat("#.00");
    return formatter.format(this.price);
  }
}
