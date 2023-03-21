import 'package:flutter/material.dart';
import 'package:flutter_application_/pages/Page2Connexion.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  await Hive.initFlutter();

  //open a box

  var box = await Hive.openBox("myBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConnexionPage(),
    );
  }
}
