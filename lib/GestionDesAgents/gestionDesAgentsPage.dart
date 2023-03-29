import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_application_/GestionDesAgents/unElementAjouter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../finalbd.dart';
import '../maBasedeDonnee/db.dart';
import '../mesFonction.dart';
import 'ajouterUnAgent.dart';

class GestionAgentsPage extends StatefulWidget {
  const GestionAgentsPage({super.key});

  @override
  State<GestionAgentsPage> createState() => _GestionAgentsPageState();
}

class _GestionAgentsPageState extends State<GestionAgentsPage> {
  get _myBox => Hive.box('myBox');

  void changerLaCouleurdeLiconedeTache(bool? value, int index) {
    setState(() {
      db.MesAgentsList[index][13] = !db.MesAgentsList[index][13];
    });
    db.updateDataBase();
  }

  late TextEditingController controlleur1;

  void suprimerUnAgents(int index) {
    setState(() {
      db.MesAgentsList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  void initState() {
    if (_myBox.get("LISTEDESAGENTS") == null) {
      db.CreationDeLaListInitiale();
    } else {
      //cela exit deja
      db.loadData();
    }
    controlleur1 = TextEditingController();
    // TODO: implement initState

    super.initState();
  }

  /* final _controllerduMatricul = TextEditingController();
  final _controllerduNom = TextEditingController();
  final _controllerduPrenoms = TextEditingController();
  final _controllerdeLaTache = TextEditingController(); */

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controlleur1.dispose();
  }

  var couleur = Color.fromARGB(255, 12, 95, 15);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          /*  decoration: BoxDecoration(
              border: Border.all(
            color: couleur,
          )
          ), */
          child: SingleChildScrollView(
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
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: db.MesAgentsList.length,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0),
                          itemBuilder: (BuildContext context, index) {
                            return UnElementAjouter(
                              leMtricul: db.MesAgentsList[index][0],
                              LeNom: db.MesAgentsList[index][1],
                              onChanged: (value) =>
                                  changerLaCouleurdeLiconedeTache(value, index),
                              deleteFunction: (context) =>
                                  suprimerUnAgents(index),
                              lePrenom: db.MesAgentsList[index][2],
                              etatDeLaTach: false,
                              laTache: db.MesAgentsList[index][5],
                              laDress: db.MesAgentsList[index][4],
                              lePhone: db.MesAgentsList[index][7],
                            );
                          }),
                    )),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      monDotteBoder(
                          leTexBoder: "Nouvelle \n Agent",
                          liconneDotteBorder: Icons.group_add,
                          creationdeQuestionnaire: MonDialogAkouter()),
                    ],
                  ),
                ),
                /*  SizedBox(
                  height: 100,
                ), */
                letextsonbon1(laction: "Quitter"),

                /* GridView.builder(
                    itemCount: 3,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      child:
                      UnElementAjouter;
                    }) */
              ],
            ),
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
        /* decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.black,
                              strokeAlign: 1,
                            ),
                          ), */
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
}
