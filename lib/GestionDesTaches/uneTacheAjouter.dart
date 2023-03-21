import 'package:flutter/material.dart';

class UneTacheAjouter extends StatelessWidget {
  final String leNomDeLagent;
  final String laTacheEnQuestion;
  final String numeroTacheAffectee;

  final bool taskCompletd;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  UneTacheAjouter(
      {super.key,
      required this.leNomDeLagent,
      required this.taskCompletd,
      required this.onChanged,
      required this.deleteFunction,
      required this.laTacheEnQuestion,
      required this.numeroTacheAffectee});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Text(
                  numeroTacheAffectee,
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 1, 18, 49),
                  ),
                ),
              ),
              title: Text(
                leNomDeLagent,
                //utilisation de la methode ternaire
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: taskCompletd
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              subtitle: Text(
                laTacheEnQuestion,
                style: TextStyle(color: Color.fromARGB(255, 142, 118, 118)),
              ),
              //revenir dessus après
              trailing: Checkbox(
                value: taskCompletd,
                onChanged: onChanged,
                activeColor: Color.fromARGB(255, 1, 18, 49),
              ),
            ),
          ),
        ));
  }
}
