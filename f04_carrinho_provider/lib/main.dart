import 'dart:io';

import 'package:f04_carrinho_provider/models/cart.dart';
import 'package:f04_carrinho_provider/models/cart.store.dart';
import 'package:f04_carrinho_provider/models/catalog.dart';
import 'package:f04_carrinho_provider/utils/theme.dart';
import 'package:f04_carrinho_provider/views/cart_screen.dart';
import 'package:f04_carrinho_provider/views/catalog_screen.dart';
import 'package:f04_carrinho_provider/views/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final CatalogModel _catalog = CatalogModel();
final CartModelX cartModelX = CartModelX(_catalog);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CartModelX(_catalog),
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyLogin(),
          '/catalog': (context) => const MyCatalog(),
          '/cart': (context) => const MyCart(),
        },
      ),
    );
  }
}
