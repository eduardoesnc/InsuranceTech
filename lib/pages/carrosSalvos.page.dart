import 'package:flutter/material.dart';
import 'package:insurancetech/components/drawer.dart';
import '../components/largeButton.dart';
import '../components/pageTitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarrosSalvosPage extends StatefulWidget {
  const CarrosSalvosPage({Key? key}) : super(key: key);

  static const routeName = '/carrosSalvos';

  @override
  State<CarrosSalvosPage> createState() => _CarrosSalvosPageState();
}

class _CarrosSalvosPageState extends State<CarrosSalvosPage> {
  final _firebaseAuth = FirebaseAuth.instance;
  String email = '';

  @override
  initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: const Color(0xFF2a5298),
          centerTitle: true,
          title: SizedBox(
            width: 90,
            child: Image.asset("assets/logo.png"),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
          color: const Color(0xFF2a5298),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 50),
              const pageTitle(
                texto: 'Carros salvos',
              ),
              const SizedBox(height: 50),

              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('usuarios/$email/conta/reivindicacao/carros_salvos')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return Column(
                    children: snapshot.data!.docs
                        .map((doc) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                              child: Container(
                                height: 50,
                                alignment: Alignment.centerLeft,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: SizedBox.expand(
                                  child: TextButton(
                                    onPressed: () {
                                      carrosDetalhes(doc);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          doc['nomeIdentificacao'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 50),
              LargeButton(
                texto: 'Retornar para página inicial',
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),
            ],
          ),
        ));
  }

  getUser() async {
    User? usuario = _firebaseAuth.currentUser;
    if (usuario != null) {
      setState(() {
        email = usuario.email!;
      });
    }
  }

  carrosDetalhes(DocumentSnapshot carDoc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalhes do carro'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Idade do condutor: ${carDoc['idadeCondutor']}'),
                const SizedBox(height: 10),
                Text('Idade do carro: ${carDoc['idadeCarro']}'),
                const SizedBox(height: 10),
                Text('Modelo do carro: ${carDoc['modeloCarro']}'),
                const SizedBox(height: 10),
                Text('Tipo de combustível: ${carDoc['combustivel']}'),
                const SizedBox(height: 10),
                Text('Segmento do carro: ${carDoc['segmento']}'),
                const SizedBox(height: 10),
                Text('Tem assistência de freio? ${carDoc['freio']}'),
                const SizedBox(height: 10),
                Text('Tem câmera de ré? ${carDoc['re']}'),
                const SizedBox(height: 10),
                Text('Tipo de transmissão: ${carDoc['transmissao']}'),
                const SizedBox(height: 10),
                Text('Densidade populacional de seu município: ${carDoc['densidade']}'),
                const SizedBox(height: 10),
                Text('Município: ${carDoc['nomeMunicípio']}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
