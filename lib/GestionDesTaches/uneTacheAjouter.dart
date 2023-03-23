import 'package:flutter/material.dart';

class UneTacheAjouter extends StatefulWidget {
  final String leNomDeLagent;
  final String laTacheEnQuestion;
  final String numeroTacheAffectee;

  /* final bool taskCompletd;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction; */

  UneTacheAjouter(
      {super.key,
      required this.leNomDeLagent,
      /* required this.taskCompletd,
      required this.onChanged,
      required this.deleteFunction, */
      required this.laTacheEnQuestion,
      required this.numeroTacheAffectee});

  @override
  State<UneTacheAjouter> createState() => _UneTacheAjouterState();
}

class _UneTacheAjouterState extends State<UneTacheAjouter> {
  bool bol = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
        child: Card(
          color: Color.fromARGB(255, 3, 78, 42),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 78, 42),
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.orange,
                child: Text(
                  widget.numeroTacheAffectee,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              title: Text(
                widget.leNomDeLagent,
                //utilisation de la methode ternaire
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                widget.laTacheEnQuestion,
                style: TextStyle(color: Colors.white),
              ),
              //revenir dessus après
              trailing: Checkbox(
                value: bol,
                onChanged: (bool? nouvelleValeur) {
                  setState(() {
                    bol = nouvelleValeur!;
                  });
                },
                activeColor: Color.fromARGB(255, 1, 18, 49),
              ),
            ),
          ),
        ));
  }
}
