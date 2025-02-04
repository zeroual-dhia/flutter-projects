import 'package:app/screens/cart.dart';
import 'package:app/screens/catalog.dart';
import 'package:app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/cart.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Login',
      routes: {
        '/': (context) => Catalog(),
        '/cart': (context) => Cart(),
        '/Login': (context) => Login(),
      },
    );
  }
}
