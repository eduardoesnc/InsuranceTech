import 'package:flutter/material.dart';
import 'package:insurancetech/components/drawer.dart';
import '../components/largeButton.dart';
import '../components/pageTitle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CoordenadasPage extends StatefulWidget {
  const CoordenadasPage({Key? key}) : super(key: key);

  static const routeName = '/coordenadas';

  @override
  State<CoordenadasPage> createState() => _CoordenadasPageState();
}

class _CoordenadasPageState extends State<CoordenadasPage> {
  final nomeControllerCarro = TextEditingController();
  final nomeControllerLatitude = TextEditingController();
  final nomeControllerLongitude = TextEditingController();

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
            child: ListView(children: <Widget>[

              const SizedBox(height: 50),

              const pageTitle(
                texto: 'Coordenadas',
              ),

              const SizedBox(height: 50),
              
              Container(
                height: 54,
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: TextFormField(
                  controller: nomeControllerCarro,
                  onChanged: (text) {},
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Carro com sinistro",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 21, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Container(
                height: 54,
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: TextFormField(
                  controller: nomeControllerLatitude,
                  onChanged: (text) {},
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Latitude do local",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 21, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                height: 54,
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: TextFormField(
                  controller: nomeControllerLongitude,
                  onChanged: (text) {},
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Longitude do local",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 21, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              LargeButton(
                texto: 'Enviar',
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('coordenadas')
                      .doc(nomeControllerCarro.text)
                      .set({
                    'latitude': double.tryParse(nomeControllerLatitude.text) ?? 0,
                    'longitude': double.tryParse(nomeControllerLongitude.text) ?? 0,
                  });

                  Navigator.of(context).pushNamed('/mapa');
                },
              ),
            ])));
  }
}
