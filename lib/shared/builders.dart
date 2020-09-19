import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

getThemeColor() {
  if (DotEnv().env['THEME_COLOR'] == '1') {
    return Color(0xFFFF6600);
  }

  return Color(0xFF000066);
}
