import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      title: 'Portfolio',
      theme: ThemeData(
          textTheme: GoogleFonts.aboretoTextTheme(),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 33, 151, 205)),
          useMaterial3: true),
      home: const Dashboard(),
    );
  }
}
