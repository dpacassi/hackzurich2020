import 'package:flutter/material.dart';

import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hackzurich2020/models/product.dart';
import 'package:hackzurich2020/widgets/camera.dart';
import 'package:hackzurich2020/widgets/product.dart';

class HomeWidget extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomeWidget({Key key, this.title, this.cameras}) : super(key: key);

  final String title;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _counter = 0;
  List<Product> _products = [
    Product(
      id: 1,
      title: 'Sélection Salt & Pepper Chips',
      subtitle: '150g',
      price: 5.2,
      image: 'assets/images/chips.png',
      barcode: '',
      rating: 4.1,
      ratingCount: 26,
    ),
    Product(
      id: 2,
      title: 'Delizio Lungo Fortissimo 48 Kapseln',
      subtitle: '288g',
      price: 19.8,
      image: 'assets/images/coffee.png',
      barcode: '',
      rating: 4.8,
      ratingCount: 20,
    ),
    Product(
      id: 3,
      title: 'Kopfsalat rot',
      subtitle: '',
      price: 1.7,
      image: 'assets/images/salad.png',
      barcode: '',
      rating: 3.8,
      ratingCount: 4,
    ),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Color(0xFFFF6600),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(widget.title, style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                //child: CameraWidget(cameras: widget.cameras),
                child: Text('Camera'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text('Purchased products', style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              Divider(
                color: Color(0xFFdad7d4),
                height: 1.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: _products.length,
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 8.0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(
                      product: _products[index],
                    );
                  }
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Action',
        child: Icon(Icons.add),
      ),
    );
  }
}
