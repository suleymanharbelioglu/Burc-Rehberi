import 'package:flutter/material.dart';

import 'package:v142/model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc lisetelenenBurc;
  const BurcItem({super.key, required this.lisetelenenBurc});

  @override
  Widget build(BuildContext context) {
    var myTextTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/burcDetay",
                  arguments: lisetelenenBurc);
            },
            // ignore: prefer_interpolation_to_compose_strings
            leading: Image.asset("images/" + lisetelenenBurc.burcKucukResim),
            title: Text(
              lisetelenenBurc.burcAdi,
              style: myTextTheme.headlineMedium,
            ),
            subtitle: Text(
              lisetelenenBurc.burcTarih,
              style: myTextTheme.titleMedium,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ),
      ),
    );
  }
}
