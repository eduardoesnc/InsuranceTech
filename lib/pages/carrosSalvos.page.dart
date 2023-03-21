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
  late DocumentSnapshot doc;

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
                      padding: const EdgeInsets.all(16),
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      child: DropdownButton<String>(
                        hint: const Text(
                          'Selecione um carro',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        value: carNames.contains(_selectedCar) ? _selectedCar : null,
                        onChanged: (value) {
                          setState(() {
                            _selectedCar = value!;
                            doc = snapshot.data!.docs.firstWhere(
                              (doc) => doc['nomeIdentificacao'] == _selectedCar,
                            );
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
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        underline: const SizedBox(height: 0,),
                        isDense: true,
                        isExpanded: true,
                        alignment: AlignmentDirectional.centerStart,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return carNames.map<Widget>((String value) {
                            return Text(
                              value,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            );
                          }).toList();
                        },
                        items: carNames
                            .map(
                              (value) => DropdownMenuItem<String>(
                                value: value,
                                enabled: true,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),

                    const SizedBox(height: 40),

                    if (_selectedCar.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  carInfo('Idade do condutor: ${doc['idadeCondutor']}'),
                                  const SizedBox(height: 10),
                                  carInfo('Idade do carro: ${doc['idadeCarro']}'),
                                  const SizedBox(height: 10),
                                  carInfo('Modelo do carro: ${doc['modeloCarro']}'),
                                  const SizedBox(height: 10),
                                  carInfo('Tipo de combustível: ${doc['combustivel']}'),
                                  const SizedBox(height: 10),
                                  carInfo('Segmento do carro: ${doc['segmento']}'),
                                  const SizedBox(height: 10),
                                  carInfo('Tem assistência de freio? ${doc['freio']}'),
                                  const SizedBox(height: 10),
                                  carInfo('Tem câmera de ré? ${doc['re']}'),
                                  const SizedBox(height: 10),
                                  carInfo('Tipo de transmissão: ${doc['transmissao']}'),
                                  const SizedBox(height: 10),
                                  carInfo(
                                      'Densidade populacional de seu município: ${doc['densidade']}'),
                                  const SizedBox(height: 10),
                                  carInfo('Município: ${doc['nomeMunicípio']}'),
                                ],
                              ),
                  ],
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
      ),
    );
  }

  Widget carInfo(String texto){
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white

      ),
      textAlign: TextAlign.left,
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
}
