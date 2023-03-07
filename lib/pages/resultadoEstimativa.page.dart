import 'package:flutter/material.dart';

import 'package:insurancetech/components/drawer.dart';

import '../components/largeButton.dart';
import '../components/pageTitle.dart';

class ResultadoEstimativaPage extends StatefulWidget {
  const ResultadoEstimativaPage({Key? key}) : super(key: key);

  static const routeName = '/resultado';

  @override
  State<ResultadoEstimativaPage> createState() =>
      _ResultadoEstimativaPageState();
}

class _ResultadoEstimativaPageState extends State<ResultadoEstimativaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
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
              texto: 'Estimativa',
            ),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Grande Chance',
                style: TextStyle(
                  color: Color(0xFFF14835),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Motivos:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    //textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            LargeButton(
              texto: "Retornar para página inicial",
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
