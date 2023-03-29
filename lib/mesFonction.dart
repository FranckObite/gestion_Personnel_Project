import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

Container monContainer(
    {required double maHauteur,
    required double maLageur,
    required Widget lenfant}) {
  return Container(
    width: maLageur,
    height: maHauteur,
    child: lenfant,
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

TextField monTextFieldText(
    {required String text2Fieldd,
    required bool obscuree,
    required double radiusNombree,
    required TextEditingController leControleur}) {
  return TextField(
    obscureText: obscuree,
    controller: leControleur,
    decoration: InputDecoration(
        hintText: text2Fieldd,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusNombree),
        )),
  );
}


