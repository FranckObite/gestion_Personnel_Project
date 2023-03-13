import 'package:flutter/material.dart';

class MonDialogAkouter extends StatefulWidget {
  const MonDialogAkouter({super.key});

  @override
  State<MonDialogAkouter> createState() => _MonDialogAkouterState();
}

class _MonDialogAkouterState extends State<MonDialogAkouter> {
  var couleur = Color.fromARGB(255, 12, 95, 15);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: Row(
          children: [
            Container(
              width: 980,
              height: 500,
            )
          ],
        ),
      ),
    );
  }

  Text monText(
      {required double taille,
      required Color couleurText,
      required FontWeight monTextGras,
      required String leText}) {
    return Text(
      leText,
      style: TextStyle(
          fontSize: taille, color: couleurText, fontWeight: monTextGras),
    );
  }

  Icon monIcone(
      {required double taileIcone,
      required Color couleurIcone,
      required IconData iconEnQuestion}) {
    return Icon(
      iconEnQuestion,
      size: taileIcone,
      color: couleurIcone,
    );
  }

  Column ourColun({required IconData notreIcone, required String notreText}) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: monIcone(
              taileIcone: 100,
              couleurIcone: couleur,
              iconEnQuestion: notreIcone),
        ),
        const SizedBox(
          height: 10,
        ),
        monText(
            taille: 20,
            couleurText: Colors.orange,
            monTextGras: FontWeight.normal,
            leText: notreText)
      ],
    );
  }
}
