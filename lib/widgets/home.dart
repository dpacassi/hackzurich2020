import 'package:flutter/material.dart';

import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
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
                child: ProductWidget(product: Product(
                  title: 'Sélection Salt & Pepper Chips',
                  subtitle: '150g',
                  price: 5.20,
                  image: 'assets/images/chips.png',
                ),),
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
