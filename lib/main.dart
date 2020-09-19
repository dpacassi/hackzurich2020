import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hackzurich2020/widgets/home.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<CameraDescription> cameras = await availableCameras();
  runApp(new MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  MyApp({ this.cameras });

  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        navigatorObservers: [BotToastNavigatorObserver()],
        title: 'ipSHOPfacto',
        theme: ThemeData(
          backgroundColor: Color(0xFFFFFFFF),
          primaryColor: Color(0xFFFF6600),
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomeWidget(title: 'ipSHOPfacto', cameras: cameras,),
      ),
    );
  }
}
