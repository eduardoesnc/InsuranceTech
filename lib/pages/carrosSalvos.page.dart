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
  String _selectedCar = '';

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
            const SizedBox(height: 20),
            const pageTitle(
              texto: 'Carros salvos',
            ),
            const SizedBox(height: 50),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(
                      'usuarios/$email/conta/reivindicacao/carros_salvos')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'Você ainda não tem carros salvos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                }

                List<String> carNames = snapshot.data!.docs
                    .map((doc) => doc['nomeIdentificacao'] as String)
                    .toList();

                return Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            color: Colors.black26,
                            width: 1,
                          )),
                      child: DropdownButton<String>(
                        hint: const Text('Selecione um carro'),
                        value: carNames.contains(_selectedCar)
                            ? _selectedCar
                            : null,
                        onChanged: (value) {
                          setState(() {
                            _selectedCar = value!;
                          });
                        },
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 27,
                        elevation: 16,
                        underline: Container(),
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        items: carNames
                            .map((value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (_selectedCar.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        child: Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: SizedBox.expand(
                            child: TextButton(
                              onPressed: () {
                                DocumentSnapshot doc = snapshot.data!.docs
                                    .firstWhere((doc) =>
                                        doc['nomeIdentificacao'] ==
                                        _selectedCar);
                                carrosDetalhes(doc);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    'Clique para ver mais detalhes',
                                    style: TextStyle(
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
                      ),
                    // const SizedBox(height: 5),
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
            LargeButton(
              texto: 'Voltar',
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
          ],
        ),
      ),
    );
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
                Text(
                    'Densidade populacional de seu município: ${carDoc['densidade']}'),
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
