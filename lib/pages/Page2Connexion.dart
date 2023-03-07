import 'dart:ffi';

import 'package:flutter/material.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  bool obscur = true;
  IconData icoo = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Stack(alignment: Alignment.topCenter, children: [
                  notreLogo(hauteurLogo: 300, largeurLogo: 300),
                  Padding(
                    padding: const EdgeInsets.only(top: 220.0),
                    child: Column(
                      children: [
                        monIcone(
                            taileIcone: 40,
                            couleurIcone: Color.fromARGB(255, 5, 119, 3),
                            iconEnQuestion: Icons.account_circle_sharp),
                        monText(
                            taille: 20,
                            couleurText: Colors.black,
                            monTextGras: FontWeight.w500,
                            leText: "IDENTICFICATION"),
                      ],
                    ),
                  )
                ]),
                monTextFieldText(
                    text2Fieldd: "Nom d'utilisateur",
                    obscuree: false,
                    radiusNombree: 25.0),
                SizedBox(
                  height: 20,
                ),
                monTextFieldMotPass(
                  text2Field: "Mot de Pass",
                  obscuree: obscur,
                  iconTexfiel: icoo,
                  radiusNombre: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: monText(
                            taille: 10,
                            couleurText: Color.fromARGB(255, 5, 119, 3),
                            monTextGras: FontWeight.normal,
                            leText: "Mot de Pass oublie?")),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 600.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: monText(
                          taille: 10,
                          couleurText: Color.fromARGB(255, 5, 119, 3),
                          monTextGras: FontWeight.normal,
                          leText: "Se Connecter")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container monContainer({
    required double maHauteur,
    required double maLageur,
    required Color maCouleur,
  }) {
    return Container(
      width: maLageur,
      height: maHauteur,
      decoration: BoxDecoration(color: maCouleur),
    );
  }

  Image notreLogo({required double hauteurLogo, required double largeurLogo}) {
    return Image.asset(
      "images/NAN-removebg-preview.png",
      width: largeurLogo,
      height: hauteurLogo,
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

  TextField monTextFieldText({
    required String text2Fieldd,
    required bool obscuree,
    required double radiusNombree,
  }) {
    return TextField(
      obscureText: obscuree,
      decoration: InputDecoration(
          hintText: text2Fieldd,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusNombree),
          )),
    );
  }

  TextField monTextFieldMotPass({
    required String text2Field,
    required bool obscuree,
    required IconData iconTexfiel,
    required double radiusNombre,
  }) {
    return TextField(
      obscureText: obscur,
      decoration: InputDecoration(
          hintText: text2Field,
          suffixIcon: IconButton(
            onPressed: setIcon,
            icon: Icon(iconTexfiel),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusNombre),
          )),
    );
  }

  setIcon() {
    setState(() {
      icoo = (icoo == Icons.visibility_off)
          ? Icons.visibility
          : Icons.visibility_off;
      obscur = !obscur;
    });
  }
}
