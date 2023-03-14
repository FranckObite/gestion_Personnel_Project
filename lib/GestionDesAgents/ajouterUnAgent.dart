import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../pages/pageAccueil.dart';

class MonDialogAkouter extends StatefulWidget {
  const MonDialogAkouter({super.key});

  @override
  State<MonDialogAkouter> createState() => _MonDialogAkouterState();
}

class _MonDialogAkouterState extends State<MonDialogAkouter> {
  late TextEditingController controlleur2a;
  late TextEditingController controlleur2b;
  late TextEditingController controlleur2c;
  late TextEditingController controlleur2d;
  late TextEditingController controlleur2e;
  late TextEditingController controlleur2f;
  /* late TextEditingController controlleur2g; */


  IconData icoo = Icons.visibility_off;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /* initialiser le controller */

    controlleur2a = TextEditingController();
    controlleur2b = TextEditingController();
    controlleur2c = TextEditingController();
    controlleur2d = TextEditingController();
    controlleur2e = TextEditingController();
    controlleur2f = TextEditingController();
    /* controlleur2g = TextEditingController(); */


    //initialiser la base
    //tous ce que l'on va faire pendant l'initialisation du widget
  }

  @override
  void dispose() {
    controlleur2a.dispose();
    controlleur2b.dispose();
    controlleur2c.dispose();
    controlleur2d.dispose();
    controlleur2e.dispose();
    controlleur2f.dispose();
    /* controlleur2g.dispose(); */

    /* souhaiter que le controller soit nul a la fin */
    // TODO: implement dispose
    super.dispose();
    //tous ce que l'on va faire quand le widget sera supprimer
  }

  DateTime initialDate = DateTime.now();

  var couleur = Color.fromARGB(255, 12, 95, 15);
  @override
  Widget build(BuildContext context) {
    var valeurDuMatricue = controlleur2a.text;
    var valeurDuNom = controlleur2b.text;
    /* var valeurDeLadress = controlleur2g.text; */
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(200, 130, 186, 135),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Container(
                width: 300,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      maDeuxiemeRow(
                          leTextDescriptif: "Ajout d'un noiuvelle Agent",
                          liconeDelaPage: Icons.assignment_add,
                          laFonction2Navigation: MonDialogAkouter()),
                      Spacer(),
                      pageAcceuil(hauteurLogo: 300, largeurLogo: 300),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Center(
                                child: monText(
                                    taille: 20,
                                    couleurText: Colors.white,
                                    monTextGras: FontWeight.bold,
                                    leText: "Annuler")),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: (300),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      maDeuxiemeRow3(
                        leTextDescriptif: "Identité de l'Agent",
                        liconeDelaPage: Icons.card_travel,
                      ),
                      Spacer(),
                      racourcisTexfiel(
                          hintText: " Matricule",
                          mesControleurs: controlleur2a),
                      Spacer(),
                      racourcisTexfiel(
                          hintText: " Nom", mesControleurs: controlleur2b),
                      Spacer(),
                      racourcisTexfiel(
                          hintText: " Prenoms", mesControleurs: controlleur2c),
                      Spacer(),
                      racourcisTexfiel(
                          hintText: " Lieu de Naissance",
                          mesControleurs: controlleur2d),
                      Spacer(),
                      racourcisTexfiel2(mesControleurs: controlleur2d)
                      /* 
                      maDeuxiemeRow3(
                          leTextDescriptif: "Contact de l'Agent",
                          liconeDelaPage: Icons.phone) */
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: (300),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        maDeuxiemeRow3(
                          leTextDescriptif: "Contact de l'Agent",
                          liconeDelaPage: Icons.card_travel,
                        ),
                        Spacer(),
                        racourcisTexfiel(
                            hintText: " Adress",
                            mesControleurs: controlleur2e),
                        Spacer(),
                        racourcisTexfiel(
                            hintText: " Email", mesControleurs: controlleur2f),
                        Spacer(),
                        racourcisTexfiel(
                            hintText: " Téléphone",
                            mesControleurs: controlleur2f),
                        Spacer(),
                        
                        
                        /* 
                        maDeuxiemeRow3(
                            leTextDescriptif: "Contact de l'Agent",
                            liconeDelaPage: Icons.phone) */
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell pageAcceuil(
      {required double hauteurLogo, required double largeurLogo}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MonAccueil()));
      },
      child: Image.asset(
        "images/NAN-removebg-preview.png",
        width: largeurLogo,
        height: hauteurLogo,
      ),
    );
  }

  showDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1978),
      lastDate: DateTime(2090),
    ).then((value) => {
          if (value != null)
            {
              setState(() {
                initialDate = value;
              })
            }
        });
  }

  Container racourcisTexfiel2({required TextEditingController mesControleurs}) {
    return Container(
      width: 250,
      height: 40,
      decoration: BoxDecoration(color: Colors.white),
      child: TextField(
        autocorrect: true,
        controller: mesControleurs,
        decoration: InputDecoration(
            hintText: ' $initialDate',
            suffixIcon: IconButton(
                onPressed: () {
                  showDate(context);
                },
                icon: Icon(Icons.calendar_month_sharp))),
      ),
    );
  }

  Container racourcisTexfiel(
      {required String hintText,
      required TextEditingController mesControleurs}) {
    return Container(
      width: 250,
      height: 40,
      decoration: BoxDecoration(color: Colors.white),
      child: TextField(
        autocorrect: true,
        controller: mesControleurs,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }

  Row maDeuxiemeRow3(
      {required String leTextDescriptif,
      required IconData liconeDelaPage,
      required}) {
    return Row(
      children: [
        monIcone(
            taileIcone: 80,
            couleurIcone: Colors.black,
            iconEnQuestion: liconeDelaPage),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 10,
        ),
        monText(
            taille: 20,
            couleurText: Colors.white,
            monTextGras: FontWeight.bold,
            leText: leTextDescriptif),
      ],
    );
  }

  Row maDeuxiemeRow({
    required String leTextDescriptif,
    required IconData liconeDelaPage,
    required final Widget laFonction2Navigation,
  }) {
    return Row(
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => laFonction2Navigation));
              },
              child: monIcone(
                  taileIcone: 100,
                  couleurIcone: couleur,
                  iconEnQuestion: liconeDelaPage),
            ),
            const SizedBox(
              height: 10,
            ),
            monText(
                taille: 20,
                couleurText: Colors.orange,
                monTextGras: FontWeight.normal,
                leText: leTextDescriptif)
          ],
        ),
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

  Container monTextFieldText(
      {required String text2Fieldd,
      required bool obscuree,
      required double radiusNombree,
      required TextEditingController leControleur}) {
    return Container(
      width: 100,
      height: 100,
      child: TextField(
        obscureText: obscuree,
        controller: leControleur,
        decoration: InputDecoration(
            hintText: text2Fieldd,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusNombree),
            )),
      ),
    );
  }
}
