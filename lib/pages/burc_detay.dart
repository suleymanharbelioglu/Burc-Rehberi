import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:v142/model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({super.key, required this.secilenBurc});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator paletteGenerator;
  @override
  void initState() {
    
    super.initState();
    appbarRenginiOlustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: appbarRengi,
          expandedHeight: 250,
          pinned: true,
          // title: Text(secilenBurc.burcAdi),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.all(5),
            title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
            background: Image.asset(
              // ignore: prefer_interpolation_to_compose_strings
              "images/" + widget.secilenBurc.burcBuyukResim,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.secilenBurc.burcDetay,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        )
      ],
    ));
  }

  void appbarRenginiOlustur() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
    setState(() {
      appbarRengi = paletteGenerator.dominantColor!.color;
    });
  }
}
