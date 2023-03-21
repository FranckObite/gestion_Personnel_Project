import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MaBdAgents {
  //reference the box

  List MesAgentsList = [];

  final _myBox = Hive.box('myBox');

  //executer cette methodes pour la premiere ouverture de mon app
  void CreationDeLaListInitiale() {
    List MesAgentsList = [
      [
        "Matricule",
        "Nom",
        "Prenom",
        "Lieu de Naissance",
        "Tâche",
        "Etats Civil",
        "Civilité",
        "Adress",
        "Email",
        "Telephone",
        'Date de Naissance',
        "Sexe",
        "Photo",
        false,
      ],
      [
        "Matricule1",
        "Nom1",
        "Prenom1",
        "Lieu de Naissanc1e",
        "Tâche1",
        "Etats Civil1",
        "Civilité1",
        "Adress1",
        "Email1",
        "Telephone1",
        'Date de Naissance1',
        "Sexe1",
        "Photo1",
        false,
      ],
      [
        "Matricule12",
        "Nom12",
        "Prenom12",
        "Lieu de Naissanc12e",
        "Tâche12",
        "Etats Civil12",
        "Civilité12",
        "Adress12",
        "Email12",
        "Telephone12",
        'Date de Naissance12',
        "Sexe12",
        "Photo12",
        false,
      ],
    ];
  }

  //lancement les donnnées dans la base de données

  void loadData() {
    MesAgentsList = _myBox.get("LISTEDESAGENTS");
  }

  //mise à jour de la bd
  void updateDataBase() {
    _myBox.put("LISTEDESAGENTS", MesAgentsList);
  }
}
