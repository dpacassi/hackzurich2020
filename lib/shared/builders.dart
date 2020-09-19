import 'package:flutter/material.dart';

AppBar getTransparentAppBar(BuildContext context, {actions, leading, showTitle, textColor}) {
  textColor = textColor ?? Colors.black;

  return AppBar(
    leading: leading,
    iconTheme: IconThemeData(
      color: textColor,
    ),
    title: showTitle != null && showTitle == false ? null : GestureDetector(
      child: Text('Back', style: TextStyle(color: textColor),),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    titleSpacing: 0.0,
    backgroundColor: Colors.transparent,
    bottomOpacity: 0.0,
    elevation: 0.0,
    actions: actions,
  );
}
