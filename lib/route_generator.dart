import 'package:flutter/material.dart';
import 'package:v142/pages/burc_detay.dart';
import 'package:v142/pages/burc_listesi.dart';
import 'package:v142/model/burc.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BurcListesi(),
        );
      case "/burcDetay":
        final Burc secilenBurc = settings.arguments as Burc;
        return MaterialPageRoute(
          builder: (context) => BurcDetay(secilenBurc: secilenBurc),
        );
        default:
        return  null;
    }
  }
}
