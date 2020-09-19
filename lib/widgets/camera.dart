import 'dart:async';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

import 'package:hackzurich2020/models/product.dart';
import 'package:hackzurich2020/shared/builders.dart';
import 'package:hackzurich2020/widgets/product_notification.dart';

class CameraWidget extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Function setActiveProductId;
  final Function findProductByBarcode;

  CameraWidget({ this.cameras, this.setActiveProductId, this.findProductByBarcode });

  @override
  _CameraWidgetState createState() => new _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  QRReaderController controller;

  @override
  void initState() {
    super.initState();
    controller = new QRReaderController(widget.cameras[0], ResolutionPreset.high, [CodeFormat.ean13], (dynamic value) {
      Product product = widget.findProductByBarcode(value);
      BotToast.showCustomNotification(toastBuilder: (cancel) {
        return ProductNotificationWidget(
          product: product,
        );
      }, duration: const Duration(seconds: 4));
      widget.setActiveProductId(product.id);
      new Future.delayed(const Duration(seconds: 3), controller.startScanning);
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startScanning();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }

    final size = MediaQuery.of(context).size.width;

    return Transform.scale(
      scale: 1.0,
      child: AspectRatio(
        aspectRatio: 200.0 / 411.42857142857144,
        child: OverflowBox(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Container(
              width: size,
              height: size / controller.value.aspectRatio,
              child: Stack(
                children: <Widget>[
                  QRReaderPreview(controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
