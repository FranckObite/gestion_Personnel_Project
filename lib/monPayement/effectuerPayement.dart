import 'package:flutter/material.dart';

import '../finalbd.dart';
import '../mesFonction.dart';

class effectuonsPayement extends StatefulWidget {
  const effectuonsPayement({super.key});

  @override
  State<effectuonsPayement> createState() => _effectuonsPayementState();
}

class _effectuonsPayementState extends State<effectuonsPayement> {
  get couleur => Color.fromARGB(255, 12, 95, 15);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                    leText: "PAYEMENTS SALAIRES"),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: couleur,
                thickness: 2,
              ),
            ],
          ),

          /* child: SingleChildScrollView(
            child: Column(
              children: [
                
                /* 
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
                            return Container();
                            /* UnElementAjouter(
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
                            ); */
                          }),
                    )),

                /*  SizedBox(
                  height: 100,
                ), */ */
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
          ), */
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
}
