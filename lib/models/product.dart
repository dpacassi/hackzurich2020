import 'package:intl/intl.dart';

class Product {
  int id;
  String title;
  String subtitle;
  String image;
  double price;
  String barcode;

  Product({
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.price,
    this.barcode,
  });

  String getFormattedPrice() {
    final formatter = new NumberFormat("#.00");
    return formatter.format(this.price);
  }
}
