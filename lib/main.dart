import 'package:flutter/material.dart';
import 'package:hibye/utils/generate_material_color.dart';
import 'package:hibye/screens/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: generateMaterialColor(const Color(0xFF1F3C88)),
          fontFamily: 'Spartan',
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 104,
                  fontWeight: FontWeight.w300),
              headline2: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 65,
                  fontWeight: FontWeight.w300),
              headline3: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 52,
                  fontWeight: FontWeight.w400),
              headline4: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 37,
                  fontWeight: FontWeight.w600),
              headline5: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 26,
                  fontWeight: FontWeight.w400),
              headline6: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
              subtitle1: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
              subtitle2: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              button: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              overline: TextStyle(fontSize: 10, fontWeight: FontWeight.w400))),
      home: Landing(),
    );
  }
}
