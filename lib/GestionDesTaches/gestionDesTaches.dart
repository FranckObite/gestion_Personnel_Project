import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_application_/GestionDesAgents/unElementAjouter.dart';
import 'package:flutter_application_/GestionDesTaches/uneTacheAjouter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dialog.dart';

class GestionDesTaches extends StatefulWidget {
  GestionDesTaches({super.key});

  @override
  State<GestionDesTaches> createState() => _GestionDesTachesState();
}

class _GestionDesTachesState extends State<GestionDesTaches> {
  var couleur = Color.fromARGB(255, 12, 95, 15);
  late TextEditingController controlleur2LaRecherche;

  @override
  void initState() {
    // TODO: implement initState
    controlleur2LaRecherche = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controlleur2LaRecherche.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: monText(
                  taille: 40,
                  couleurText: Colors.orange,
                  monTextGras: FontWeight.bold,
                  leText: "GESTION DES AGENTS"),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: couleur,
              thickness: 2,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      monDotteBoder(
                          leTexBoder: "Nouvelle \n Tâche",
                          liconneDotteBorder: Icons.work,
                          creationdeQuestionnaire: MonQuestionnaire(
                              onCancel: () {
                                Navigator.pop(context);
                              },
                              onSave: () {}))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        obscureText: false,
                        controller: controlleur2LaRecherche,
                        decoration: InputDecoration(
                          hintText: "rechercher",
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      )),
    );
  }

  DottedBorder monDotteBoder(
      {required String leTexBoder,
      required IconData liconneDotteBorder,
      required final Widget creationdeQuestionnaire}) {
    return DottedBorder(
      borderType: BorderType.RRect,

      radius: Radius.circular(50),
      //dashPattern: [8, 4],
      strokeWidth: 1,
      child: Container(
        width: 120,
        height: 170,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return creationdeQuestionnaire;
                      });

                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => creationdeQuestionnaire)); */
                },
                child: monIcone(
                    taileIcone: 90,
                    couleurIcone: couleur,
                    iconEnQuestion: liconneDotteBorder),
              ),
              monText(
                  taille: 20,
                  couleurText: Colors.orange,
                  monTextGras: FontWeight.normal,
                  leText: leTexBoder),
            ],
          ),
        ),
      ),
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
}
