import 'dart:async';
import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
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
  final player = AudioCache(prefix: 'assets/sounds/');

  @override
  void initState() {
    super.initState();
    player.load('beep.mp3');

    controller = new QRReaderController(widget.cameras[0], ResolutionPreset.high, [CodeFormat.ean13], (dynamic value) {
      player.play('beep.mp3');
      widget.setActiveProductId(value);
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
    player.clearCache();
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
