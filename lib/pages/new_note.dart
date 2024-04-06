import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  var keyFormulario = GlobalKey<FormState>();
  var tituloController = TextEditingController();
  var cuerpoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Agregar nueva nota"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: keyFormulario,
            child: Column(
              children: [
                TextFormField(
                  controller: tituloController,
                  decoration: const InputDecoration(hintText: "Titulo"),
                  validator: (String? valor) {
                    if (valor == null || valor.isEmpty) {
                      return "Debes ingresar un titulo";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: cuerpoController,
                  decoration: const InputDecoration(hintText: "Nota"),
                  validator: (String? valor) {
                    if (valor == null || valor.isEmpty) {
                      return "Debes ingresar una nota";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    if (keyFormulario.currentState!.validate()) {
                      //print("Todo bformulario");
                      //Navigator.pop(context);
                      bool seGuardo = await saveNota(
                          tituloController.text, cuerpoController.text);

                      if (seGuardo) {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: const Text("Guardar"),
                ),
              ],
            ),
          ),
        ));
  }

  Future<bool> saveNota(String titulo, String cuerpo) async {
    try {
      var ref = FirebaseDatabase.instance.ref().child("notas");
      await ref.push().set({
        "title": titulo,
        "body": cuerpo,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
