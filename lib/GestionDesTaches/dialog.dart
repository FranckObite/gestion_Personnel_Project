import 'package:flutter/material.dart';

import 'monBouton.dart';

class MonQuestionnaire extends StatelessWidget {
  /*  final controller;

  final contoller2; */

  VoidCallback onSave;

  VoidCallback onCancel;

  MonQuestionnaire({
    super.key,
    /* required this.controller, */
    required this.onCancel,
    required this.onSave,
    /* required this.contoller2 */
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //get user input
              TextField(
                onSubmitted: (value) {
                  onSave();
                },
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Ajouter une nouvelle chose à faire"),
              ),
              TextField(
                onSubmitted: (value) {
                  onSave();
                },
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Ajouter une description"),
              ),

              //button save and quit
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button

                  MonBouton(text: "Enregistrer", onPressed: (onSave)),
                  const SizedBox(width: 5),
                  MonBouton(text: "retour", onPressed: (onCancel)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
