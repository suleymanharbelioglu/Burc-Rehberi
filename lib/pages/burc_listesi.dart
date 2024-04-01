import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:v142/widgets/burc_item.dart';
import 'package:v142/data/strings.dart';
import 'package:v142/model/burc.dart';


// ignore: must_be_immutable
class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi({super.key}) {
    tumBurclar = veriKaynaginiHazirla();
    if (kDebugMode) {
      print(tumBurclar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Burc Listesi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: tumBurclar.length,
        itemBuilder: (context, index) {
          return BurcItem(lisetelenenBurc: tumBurclar[index]);
        },
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> geciciListe = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKuckResim = "${burcAdi.toLowerCase()}${i + 1}.png";
      var burcBuyukResim = "${burcAdi.toLowerCase()}_buyuk${i + 1}.png";
      var geciciBurc =
          Burc(burcAdi, burcTarih, burcDetay, burcKuckResim, burcBuyukResim);
      geciciListe.add(geciciBurc);
    }

    return geciciListe;
  }
}
