import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class GestionAgentsPage extends StatefulWidget {
  const GestionAgentsPage({super.key});

  @override
  State<GestionAgentsPage> createState() => _GestionAgentsPageState();
}

class _GestionAgentsPageState extends State<GestionAgentsPage> {
  late TextEditingController controlleur1;

  @override
  void initState() {
    controlleur1 = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

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
      home: Scaffold(
        body: Container(
          width: 980,
          height: 575,
          decoration: BoxDecoration(
              border: Border.all(
            color: couleur,
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                monText(
                    taille: 40,
                    couleurText: Colors.orange,
                    monTextGras: FontWeight.bold,
                    leText: "GESTION DES AGENTS"),
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
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DottedBorder(
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
                                      onTap: () {},
                                      child: monIcone(
                                          taileIcone: 90,
                                          couleurIcone: couleur,
                                          iconEnQuestion: Icons.group_add),
                                    ),
                                    monText(
                                        taille: 20,
                                        couleurText: Colors.orange,
                                        monTextGras: FontWeight.normal,
                                        leText: "Nouvelle \n Agent"),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 680.0, top: 70.0),
                      child: Container(
                        width: 200,
                        height: 50,
                        child: TextField(
                          obscureText: false,
                          controller: controlleur1,
                          decoration: InputDecoration(
                            hintText: "rechercher",
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
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
