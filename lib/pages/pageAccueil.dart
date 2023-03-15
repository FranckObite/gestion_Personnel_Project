import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_application_/GestionDesAgents/gestionDesAgentsPage.dart';
import 'package:flutter_application_/maBasedeDonnee/dataBase.dart';

import 'Page2Connexion.dart';

class MonAccueil extends StatefulWidget {
  const MonAccueil({super.key});

  @override
  State<MonAccueil> createState() => _MonAccueilState();
}

class _MonAccueilState extends State<MonAccueil> {
  var couleur = Color.fromARGB(255, 12, 95, 15);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                maRow(),
                Stack(
                  children: [
                    Divider(
                      color: couleur,
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 30.0),
                          child: Container(
                              width: 300,
                              height: 500,

                              //color: Color.fromARGB(255, 110, 107, 97),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  maDeuxiemeRow(
                                      leTextDescriptif: 'Gestion Agents',
                                      leTextDescriptif1: 'Gestion Tâches',
                                      liconeDelaPage:
                                          Icons.manage_accounts_sharp,
                                      liconeDelaPage1: Icons.work,
                                      laFonction2Navigation:
                                          GestionAgentsPage(),
                                      laFonction2Navigation1:
                                          GestionAgentsPage()),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ourContainer(
                                      text2Description: "Gestion de Présence",
                                      icon2Description: Icons.calendar_month),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  maDeuxiemeRow(
                                      leTextDescriptif: ' Paiement',
                                      leTextDescriptif1: ' Bilan',
                                      liconeDelaPage: Icons.payments,
                                      liconeDelaPage1: Icons.data_exploration,
                                      laFonction2Navigation:
                                          GestionAgentsPage(),
                                      laFonction2Navigation1:
                                          GestionAgentsPage()),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  ourContainer(
                                      text2Description:
                                          "Gestion des Utilisateur",
                                      icon2Description: Icons.manage_accounts),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  ourContainer(
                                      text2Description: " Paramètres",
                                      icon2Description: Icons.settings)
                                ],
                              )),
                        ),
                        /* const SizedBox(
                      width: 10.0,
                    ), */
                        /* Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: Container(
                        width: 2,
                        height: 50,
                        color: const Color.fromARGB(255, 66, 209, 64),
                      ),
                    ), */
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7.1),
                            child: Container(
                              width: 980,
                              height: 575,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: couleur,
                              )),
                              child: monImageCarousel,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* ...............................ICI VOUS SE TROUVE TOUTE MES FONCTIONS........................ */

  TextButton notreLogo(
      {required double hauteurLogo, required double largeurLogo}) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      },
      child: Image.asset(
        "images/NAN-removebg-preview.png",
        width: largeurLogo,
        height: hauteurLogo,
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

  Widget monImageCarousel = Container(
    height: 575.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage("images/NAN.png"),
        AssetImage("images/9.jpg"),
        AssetImage("images/imageProjet2.jpeg"),
        AssetImage("images/10.jpeg"),
        AssetImage("images/imageProjet4.jpeg"),
        AssetImage("images/imagesProjet.png"),
        AssetImage("images/rotary-plow-g6dedf12d8_1920.jpg"),
      ],
      autoplay: true,
      //animationCurve: Curves.fastOutSlowIn,
      //animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      dotColor: Colors.orange,
      indicatorBgPadding: 2.0,
      //dotBgColor: Colors.transparent,
    ),
  );

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

  maRow() {
    return Row(
      children: [
        notreLogo(hauteurLogo: 100, largeurLogo: 100),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Column(
            children: [
              monIcone(
                  taileIcone: 40,
                  couleurIcone: couleur,
                  iconEnQuestion: Icons.account_circle_sharp),
              const SizedBox(
                height: 5.0,
              ),
              monText(
                  taille: 10,
                  couleurText: Colors.orange,
                  monTextGras: FontWeight.bold,
                  leText: "Connecter en tant que: ....."),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConnexionPage()));
            },
            child: monText(
                taille: 15,
                couleurText: Colors.orange,
                monTextGras: FontWeight.bold,
                leText: "Déconnextion"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: monIcone(
              taileIcone: 40,
              couleurIcone: couleur,
              iconEnQuestion: Icons.logout),
        ),
      ],
    );
  }

  Row maDeuxiemeRow({
    required String leTextDescriptif,
    required String leTextDescriptif1,
    required IconData liconeDelaPage,
    required IconData liconeDelaPage1,
    required final Widget laFonction2Navigation1,
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
        const Spacer(),
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => laFonction2Navigation1));
                ;
              },
              child: monIcone(
                  taileIcone: 100,
                  couleurIcone: couleur,
                  iconEnQuestion: liconeDelaPage1),
            ),
            const SizedBox(
              height: 10,
            ),
            monText(
                taille: 20,
                couleurText: Colors.orange,
                monTextGras: FontWeight.normal,
                leText: leTextDescriptif1)
          ],
        ),
      ],
    );
  }

  Container ourContainer(
      {required String text2Description, required IconData icon2Description}) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
            color: couleur,
          ),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: ListTile(
        title: InkWell(
          onTap: () {},
          child: monText(
              taille: 20,
              couleurText: Colors.orange,
              monTextGras: FontWeight.normal,
              leText: text2Description),
        ),
        trailing: monIcone(
            taileIcone: 40,
            couleurIcone: couleur,
            iconEnQuestion: icon2Description),
      ),
    );
  }
}
