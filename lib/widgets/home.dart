import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wakelock/wakelock.dart';

import 'package:hackzurich2020/models/product.dart';
import 'package:hackzurich2020/shared/builders.dart';
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
  List<Product> _products = [
    Product(
      id: 1,
      title: 'Sélection Salt & Pepper Chips',
      subtitle: '150g',
      price: 5.2,
      image: 'assets/images/chips.png',
      barcode: '7613269193838',
      rating: 4.1,
      ratingCount: 26,
    ),
    Product(
      id: 2,
      title: 'Delizio Lungo Fortissimo 48 Kapseln',
      subtitle: '288g',
      price: 19.8,
      image: 'assets/images/coffee.png',
      barcode: '7617014148623',
      rating: 4.8,
      ratingCount: 20,
    ),
    Product(
      id: 3,
      title: 'Kopfsalat rot',
      subtitle: '',
      price: 1.7,
      image: 'assets/images/salad.png',
      barcode: '7610632993613',
      rating: 3.8,
      ratingCount: 4,
    ),
    Product(
      id: 4,
      title: 'Kellogg\'s Chocos',
      subtitle: '600 g',
      price: 4.6,
      image: 'assets/images/kelloggs_choco.png',
      barcode: '5053827116596',
      rating: 3.6,
      ratingCount: 15,
    ),
    Product(
      id: 5,
      title: 'Kellogg\'s Special K',
      subtitle: '300 g',
      price: 2.8,
      image: 'assets/images/kelloggs_specialk.png',
      barcode: '5053827153935',
      rating: 5.0,
      ratingCount: 1,
    ),
    Product(
      id: 6,
      title: 'Bio 5-Korn-Flocken',
      subtitle: '500 g',
      price: 2.8,
      image: 'assets/images/flocken.png',
      barcode: '7613312258958',
      rating: 4.2,
      ratingCount: 17,
    ),
    Product(
      id: 7,
      title: 'Zweifel Nature',
      subtitle: '280 g',
      price: 5.7,
      image: 'assets/images/zweifel.png',
      barcode: '7610095005007',
      rating: 4.0,
      ratingCount: 27,
    ),
    Product(
      id: 8,
      title: 'M-Classic Nature Pommes Chips',
      subtitle: '280 g',
      price: 3.9,
      image: 'assets/images/classic_chips.png',
      barcode: '7616800905624',
      rating: 4.2,
      ratingCount: 41,
    ),
    Product(
      id: 9,
      title: 'M-Budget Nature Chips',
      subtitle: '350 g',
      price: 3.25,
      image: 'assets/images/budget_chips.png',
      barcode: '7616800817088',
      rating: 4.6,
      ratingCount: 65,
    ),
    Product(
      id: 10,
      title: 'M-Classic Lungo 30 Kapseln',
      subtitle: '156 g',
      price: 6.9,
      image: 'assets/images/lungo.png',
      barcode: '7613312250815',
      rating: 3.5,
      ratingCount: 8,
    ),
    Product(
      id: 11,
      title: 'Delizio Lungo Leggero 12 Kapseln',
      subtitle: '72 g',
      price: 5.3,
      image: 'assets/images/lungo_utz.png',
      barcode: '7617014174905',
      rating: 3.0,
      ratingCount: 2,
    ),
    Product(
      id: 12,
      title: 'Bio Delizio Max Havelaar 12 Kapseln',
      subtitle: '72 g',
      price: 5.3,
      image: 'assets/images/cafe_bio.png',
      barcode: '7617014175148',
      rating: 4.3,
      ratingCount: 4,
    ),
  ];

  List<Product> _recipes = [
    Product(
      id: 1,
      title: 'Parmesan-Chips',
      subtitle: '20 Min.',
      image: 'assets/images/r-parmesan-chips.png',
      barcode: '',
      rating: 4.0,
      ratingCount: 34,
    ),
    Product(
      id: 2,
      title: 'Überbackene Nachos',
      subtitle: '20 Min.',
      image: 'assets/images/r-nachos.png',
      barcode: '',
      rating: 4.0,
      ratingCount: 5,
    ),
    Product(
      id: 3,
      title: 'Apéro-Dips',
      subtitle: '30 Min.',
      image: 'assets/images/r-apero-dips.png',
      barcode: '',
      rating: 4.0,
      ratingCount: 8,
    ),
  ];

  int _activeProductId = null;

  @override
  Widget build(BuildContext context) {
    Wakelock.enable();

    String productsTitle = '';

    if (DotEnv().env['PROFILE_MODE'] == '1') {
      productsTitle = 'More sustainable products';
    } else if (DotEnv().env['PROFILE_MODE'] == '2') {
      productsTitle = 'Healthier products';
    } else if (DotEnv().env['PROFILE_MODE'] == '3') {
      productsTitle = 'Better deals';
    }

    List<Widget> content = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: getThemeColor(),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
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
            child: CameraWidget(
              cameras: widget.cameras,
              setActiveProductId: (int newProductId) {
                setState(() {
                  //_activeProductId = newProductId;
                  _activeProductId = int.parse(DotEnv().env['SCANNED_PRODUCT_ID']);
                });
              },
              findProductByBarcode: (String barcode) {
                return _products[0];
              }
            ),
            //child: Text('Camera'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Text(_activeProductId == null ? 'Purchased products' : productsTitle, style: GoogleFonts.montserrat(
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
            child: _activeProductId != null ? Container(
              height: 203.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductWidget(
                    product: _products[index],
                  );
                },
              ),
            ) : StaggeredGridView.countBuilder(
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
    ];

    if (_activeProductId != null) {
      content += [
        SizedBox(height: 24.0),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Text('Recipe ideas', style: GoogleFonts.montserrat(
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
          child: Container(
            height: 203.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _recipes.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductWidget(
                  product: _recipes[index],
                );
              },
            ),
          ),
        ),
      ];
    }

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(
        children: content,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: getThemeColor(),
        onPressed: () {
        },
        tooltip: 'Shopping cart',
        child: Icon(Icons.shopping_cart),
      )
    );
  }
}
