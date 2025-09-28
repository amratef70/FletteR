import 'package:flutter/material.dart';
import 'home.dart';


main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,

      home: const Directionality(
        textDirection: TextDirection.rtl,


        child: HomePage(),


      ),

    );
  }
}