import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';

import '../maBasedeDonnee/db.dart';
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
  late TextEditingController controlleur2g;
  late TextEditingController controlleur2h;
  late TextEditingController controlleur2i;
  /* late TextEditingController controlleur2g; */

  IconData icoo = Icons.visibility_off;

  final _myBox = Hive.box('myBox');
  MaBdAgents db = MaBdAgents();

  @override
  void initState() {
    if (_myBox.get("LISTEDESAGENTS") == null) {
      db.CreationDeLaListInitiale();
    } else {
      //cela exit deja
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
    /* initialiser le controller */

    controlleur2a = TextEditingController();
    controlleur2b = TextEditingController();
    controlleur2c = TextEditingController();
    controlleur2d = TextEditingController();
    controlleur2e = TextEditingController();
    controlleur2f = TextEditingController();
    controlleur2g = TextEditingController();
    controlleur2h = TextEditingController();
    controlleur2i = TextEditingController();
    /* controlleur2g = TextEditingController(); */

    //initialiser la base
    //tous ce que l'on va faire pendant l'initialisation du widget
  }

  /* void changerLaCouleurdeLiconedeTache(bool? value, int index) {
    setState(() {
      db.MesAgentsList[index][13] = !db.MesAgentsList[index][13];
    });
    db.updateDataBase();
  } */

  void enregistrerNouvelleAgents() {
    setState(() {
      db.MesAgentsList.add([
        controlleur2a.text,
        controlleur2b.text,
        controlleur2c.text,
        controlleur2d.text,
        controlleur2f.text,
        controlleur2g.text,
        controlleur2h.text,
        controlleur2i.text,
        false
      ]);

      controlleur2a.clear();
      controlleur2b.clear();
      controlleur2c.clear();
      controlleur2d.clear();
      controlleur2f.clear();
      controlleur2g.clear();
      controlleur2h.clear();
      controlleur2i.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  /* void suprimerUnAgents(int index) {
    setState(() {
      db.MesAgentsList.removeAt(index);
    });
    db.updateDataBase();
  } */

  @override
  void dispose() {
    controlleur2a.dispose();
    controlleur2b.dispose();
    controlleur2c.dispose();
    controlleur2d.dispose();
    controlleur2e.dispose();
    controlleur2f.dispose();
    controlleur2g.dispose();
    controlleur2h.dispose();
    controlleur2i.dispose();

    /* controlleur2g.dispose(); */

    /* souhaiter que le controller soit nul a la fin */
    // TODO: implement dispose
    super.dispose();
    //tous ce que l'on va faire quand le widget sera supprimer
  }

  DateTime initialDate = DateTime.now();
  int groupeValue = 1;
  int groupeValue1 = 1;

  var couleur = Color.fromARGB(255, 12, 95, 15);
  @override
  Widget build(BuildContext context) {
    var valeurDuMatricue = controlleur2a.text;
    var valeurDuNom = controlleur2b.text;
    var valeurPrenom = controlleur2c.text;
    var valeurduLieuxDeNaissance = controlleur2d.text;
    var valeur2laDate2Naissance = controlleur2f.text;
    var valeur2ladress = controlleur2g.text;
    var valeudeladressEmail = controlleur2h.text;
    var valeurduTelephone = controlleur2i.text;

    /* var valeurDeLadress = controlleur2g.text; */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[200],
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Container(
                width: 500,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 120.0),
                          child: maDeuxiemeRow(
                              leTextDescriptif: "Ajout nouvelle Agent",
                              liconeDelaPage: Icons.assignment_add,
                              laFonction2Navigation: MonDialogAkouter()),
                        ),
                        Spacer(),
                        pageAcceuil(hauteurLogo: 300, largeurLogo: 300),
                        Spacer(),
                        letextsonbon1(laction: "Annuler")
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(200.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          maDeuxiemeRow3(
                            leTextDescriptif: "Identité de l'Agent",
                            liconeDelaPage: Icons.card_travel,
                          ),
                          Spacer(),
                          maDeuxiemeRow3(
                            leTextDescriptif: "Contact de l'Agent",
                            liconeDelaPage: Icons.card_travel,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          racourcisTexfiel(
                              hintText: " Matricule",
                              mesControleurs: controlleur2a),
                          Spacer(),
                          racourcisTexfiel(
                              hintText: " Adress",
                              mesControleurs: controlleur2f),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          racourcisTexfiel(
                              hintText: " Nom", mesControleurs: controlleur2b),
                          Spacer(),
                          racourcisTexfiel(
                              hintText: " Email",
                              mesControleurs: controlleur2g),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          racourcisTexfiel(
                              hintText: " Prenoms",
                              mesControleurs: controlleur2c),
                          Spacer(),
                          racourcisTexfiel(
                              hintText: " Téléphone",
                              mesControleurs: controlleur2h),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          racourcisTexfiel(
                              hintText: " Lieu de Naissance",
                              mesControleurs: controlleur2d),
                          Spacer(),
                          racourcisTexfiel2(mesControleurs: controlleur2e),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              monText(
                                  taille: 20,
                                  couleurText: Colors.black,
                                  monTextGras: FontWeight.bold,
                                  leText: "Tâches :"),
                              SizedBox(
                                height: 20,
                              ),
                              radios(),
                            ],
                          ),
                          SizedBox(
                            width: 430,
                          ),
                          Stack(children: [
                            Column(
                              children: [
                                monText(
                                    taille: 20,
                                    couleurText: Colors.black,
                                    monTextGras: FontWeight.bold,
                                    leText: "Sexe :"),
                                SizedBox(
                                  height: 20,
                                ),
                                radios1(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 300.0),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: monIcone(
                                      taileIcone: 80,
                                      couleurIcone: Colors.black,
                                      iconEnQuestion: Icons.add_a_photo)),
                            )
                          ]),
                        ],
                      ),
                      Spacer(),
                      superRow(
                          letextdelicon: "Etat-Civil",
                          leDialogEnquestion: "Marier",
                          leDialogEnquestion1: 'Divorcé',
                          leDialogEnquestion2: 'Célibataire',
                          leDialogEnquestion3: 'Veuf/Veuve'),
                      Spacer(),
                      superRow(
                          letextdelicon: "Civilité",
                          leDialogEnquestion: "Monsieur",
                          leDialogEnquestion1: 'Autres',
                          leDialogEnquestion2: 'Madame',
                          leDialogEnquestion3: 'Mademoiselle'),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [letextsonbon(laction: "Enregistrer")],
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  TextButton letextsonbon1({required String laction}) {
    return TextButton(
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
                  leText: "$laction")),
        ));
  }

  TextButton letextsonbon({required String laction}) {
    return TextButton(
        onPressed: enregistrerNouvelleAgents,
        child: Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(color: Colors.orange),
          child: Center(
              child: monText(
                  taille: 20,
                  couleurText: Colors.white,
                  monTextGras: FontWeight.bold,
                  leText: "$laction")),
        ));
  }

  Row superRow(
      {required String letextdelicon,
      required String leDialogEnquestion,
      required String leDialogEnquestion1,
      required String leDialogEnquestion2,
      required String leDialogEnquestion3}) {
    return Row(
      children: [
        monText(
            taille: 20,
            couleurText: Colors.black,
            monTextGras: FontWeight.bold,
            leText: letextdelicon),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Container(
                      width: 50,
                      height: 200,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: monText(
                                taille: 10,
                                couleurText: Colors.black,
                                monTextGras: FontWeight.normal,
                                leText: leDialogEnquestion),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: monText(
                                  taille: 10,
                                  couleurText: Colors.black,
                                  monTextGras: FontWeight.normal,
                                  leText: leDialogEnquestion2)),
                          TextButton(
                              onPressed: () {},
                              child: monText(
                                  taille: 10,
                                  couleurText: Colors.black,
                                  monTextGras: FontWeight.normal,
                                  leText: leDialogEnquestion3)),
                          TextButton(
                              onPressed: () {},
                              child: monText(
                                  taille: 10,
                                  couleurText: Colors.black,
                                  monTextGras: FontWeight.normal,
                                  leText: leDialogEnquestion1)),
                        ],
                      ),
                    ));
                  });
            },
            icon: monIcone(
                taileIcone: 40,
                couleurIcone: Colors.orange,
                iconEnQuestion: Icons.arrow_drop_down)),
      ],
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
      width: 400,
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
      width: 400,
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
            couleurText: Colors.orange,
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

  Row radios1() {
    List<Widget> radios1 = [];
    List<String> laList1 = [
      "Masculin ",
      " Feminin ",
    ];
    for (var i = 0; i < 2; i++) {
      Column r1 = Column(
        children: [
          Radio(
              activeColor: Colors.orange,
              value: i,
              groupValue: groupeValue1,
              onChanged: ((newValue) {
                setState(() {
                  groupeValue1 = newValue as int;
                });
              })),
          Text(laList1[i]),
        ],
      );
      radios1.add(r1);
    }
    return Row(children: radios1);
  }

  Row radios() {
    List<Widget> radios = [];
    List<String> laList = [
      "Superviseur ",
      " Technicien ",
      " Controlleur ",
      " Saigneur "
    ];
    for (var i = 0; i < 4; i++) {
      Column r = Column(
        children: [
          Radio(
              activeColor: Colors.orange,
              value: i,
              groupValue: groupeValue,
              onChanged: ((newValue) {
                setState(() {
                  groupeValue = newValue as int;
                });
              })),
          Text(laList[i]),
        ],
      );
      radios.add(r);
    }
    return Row(children: radios);
  }
}
