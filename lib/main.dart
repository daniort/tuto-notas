import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tutotest/firebase_options.dart';
import 'package:tutotest/pages/new_note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //getNotas();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Mis Notas'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const NewNotePage();
                },
              ),
            );
          },
        ),
        body: FutureBuilder(
          future: getNotas(),
          builder: (BuildContext context, AsyncSnapshot<List<Nota>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                //return const Center(child: Text("Cargando..."));
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.none:
                return const Text("No se pudo obtener la información.");
              case ConnectionState.done:
                List<Nota> notas = snapshot.data ?? [];
                return ListView(
                  children: [
                    for (Nota item in notas)
                      ListTile(
                        leading: Icon(Icons.note),
                        title: Text(item.title),
                        subtitle: Text(item.body),
                      )
                  ],
                );
              default:
                return const Text('Información default');
            }
          },
        ));
  }

  Future<List<Nota>> getNotas() async {
    //await Future.delayed(Duration(seconds: 5));
    List<Nota> listaNotas = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('notas');
    try {
      DataSnapshot snapshot = await ref.get();

      if (snapshot.exists && snapshot.value != null) {
        (snapshot.value as Map).forEach((llave, value) {
          Nota notaActual = Nota(
            key: llave,
            title: value['title'],
            body: value['body'],
          );
          listaNotas.add(notaActual);
        });
      }
      return listaNotas;
    } catch (e) {
      print(e);
      return listaNotas;
    }
  }
}

class Nota {
  String key;
  String title;
  String body;
  DateTime? fecha;
  Nota({
    required this.key,
    required this.title,
    required this.body,
    this.fecha,
  });
}
