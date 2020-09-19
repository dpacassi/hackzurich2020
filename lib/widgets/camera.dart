import 'dart:async';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';


class CameraWidget extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Function setActiveProductId;

  CameraWidget({ this.cameras, this.setActiveProductId });

  @override
  _CameraWidgetState createState() => new _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  QRReaderController controller;

  @override
  void initState() {
    super.initState();
    controller = new QRReaderController(widget.cameras[0], ResolutionPreset.high, [CodeFormat.ean13], (dynamic value){
      BotToast.showSimpleNotification(title: 'Scanned barcode: ' + value, duration: const Duration(seconds: 4));
      widget.setActiveProductId(1);
      print(value); // the result!
      // ... do something
      // wait 1 seconds then start scanning again.
      new Future.delayed(const Duration(seconds: 1), controller.startScanning);
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

    return new AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: new QRReaderPreview(controller)
    );
  }
}
