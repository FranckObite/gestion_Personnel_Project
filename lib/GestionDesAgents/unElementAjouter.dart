import 'package:flutter/material.dart';

class UnElementAjouter extends StatelessWidget {
  final String leMtricul;
  final String LeNom;
  final String lePrenom;
  final String laTache;
  final String lePhone;
  final String laDress;

  final bool etatDeLaTach;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  UnElementAjouter(
      {super.key,
      required this.leMtricul,
      required this.LeNom,
      required this.lePhone,
      required this.laDress,
      required this.onChanged,
      required this.deleteFunction,
      required this.lePrenom,
      required this.etatDeLaTach,
      required this.laTache});

  var laCouleur2Licone = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  monIcone(
                      taileIcone: 40,
                      couleurIcone: (laCouleur2Licone == laCouleur2Licone)
                          ? Colors.red
                          : laCouleur2Licone,
                      iconEnQuestion: Icons.no_accounts),
                  Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: monIcone(
                        taileIcone: 20,
                        couleurIcone: Color.fromARGB(255, 7, 75, 9),
                        iconEnQuestion: Icons.person),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: monIcone(
                          taileIcone: 30,
                          couleurIcone: Colors.black,
                          iconEnQuestion: Icons.menu))
                ],
              ),
              SizedBox(height: 40),
              lePappding(
                  leMots: "Matricule", CorrespondantAuMots: "$leMtricul"),
              SizedBox(height: 20),
              lePappding(leMots: "Nom", CorrespondantAuMots: "$LeNom"),
              SizedBox(height: 20),
              lePappding(leMots: "Prenoms", CorrespondantAuMots: "$lePrenom"),
              SizedBox(height: 20),
              lePappding(leMots: "Email", CorrespondantAuMots: "$laTache"),
              SizedBox(height: 20),
              lePappding(leMots: "Téléphone", CorrespondantAuMots: "$lePhone"),
              SizedBox(height: 20),
              lePappding(leMots: "Adress", CorrespondantAuMots: "$laDress"),
            ],
          ),
        ),
      ),
    );
  }

  Row lePappding(
      {required String leMots, required String CorrespondantAuMots}) {
    return Row(
      children: [
        monText(
            taille: 15,
            couleurText: Colors.black,
            monTextGras: FontWeight.bold,
            leText: "$leMots :"),
        SizedBox(
          width: 30,
        ),
        monText(
          taille: 15,
          couleurText: Colors.orange,
          monTextGras: FontWeight.normal,
          leText: "$CorrespondantAuMots",
        )
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
