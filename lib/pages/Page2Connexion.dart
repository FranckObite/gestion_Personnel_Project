import 'package:flutter/material.dart';
import 'package:flutter_application_/pages/pageAccueil.dart';

import '../mesFonction.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  bool obscur = true;

  late TextEditingController controlleur1;
  late TextEditingController controlleur2;

  IconData icoo = Icons.visibility_off;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /* initialiser le controller */
    controlleur1 = TextEditingController();
    controlleur2 = TextEditingController();
    //initialiser la base
    //tous ce que l'on va faire pendant l'initialisation du widget
  }

  @override
  void dispose() {
    controlleur1.dispose();
    controlleur2.dispose(); /* souhaiter que le controller soit nul a la fin */
    // TODO: implement dispose
    super.dispose();
    //tous ce que l'on va faire quand le widget sera supprimer
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var valeurDuTextFieldUtilisateur = controlleur1.text;
    var valeurDuTexfieldMotDePasse = controlleur2.text;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: SingleChildScrollView(
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
                    monContainer(
                      maHauteur: 200,
                      maLageur: 500,
                      lenfant: SingleChildScrollView(
                        child: Column(
                          children: [
                            monTextFieldText(
                                text2Fieldd: "Nom d'utilisateur",
                                obscuree: false,
                                radiusNombree: 25.0,
                                leControleur: controlleur1),
                            const SizedBox(
                              height: 20,
                            ),
                            monTextFieldMotPass(
                              text2Field: "Mot de Pass",
                              obscuree: obscur,
                              iconTexfiel: icoo,
                              radiusNombre: 25.0,
                              leControleur1: controlleur2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: monText(
                                        taille: 10,
                                        couleurText:
                                            Color.fromARGB(255, 5, 119, 3),
                                        monTextGras: FontWeight.normal,
                                        leText: "Mot de Pass oublie?")),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 200.0,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MonAccueil()));
                                  /* Navigator.pop(context); */
                                },
                                child: monText(
                                    taille: 10,
                                    couleurText: Colors.white,
                                    monTextGras: FontWeight.bold,
                                    leText: "Se Connecter"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  elevation: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField monTextFieldMotPass({
    required String text2Field,
    required bool obscuree,
    required TextEditingController leControleur1,
    required IconData iconTexfiel,
    required double radiusNombre,
  }) {
    return TextField(
      obscureText: obscur,
      controller: leControleur1,
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
