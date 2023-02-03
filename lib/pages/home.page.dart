//TROCAR DESTINO DOS BOTÕES

import 'package:flutter/material.dart';

import 'package:insurancetech/components/drawer.dart';
import 'package:insurancetech/components/largeButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: const Color(0xFF2a5298),
        centerTitle: true,
        title: SizedBox(
          width: 90,
          height: 90,
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40,),
        color: const Color(0xFF2a5298),
        child: ListView(
          children: <Widget>[
            const SizedBox( height: 20 ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Como podemos te ajudar?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox( height: 60 ),

            LargeButton(
              texto: 'Estimar reivindicação',
              onPressed: () {
              Navigator.of(context).pushReplacementNamed('/estimar');
              },
            ),

            const SizedBox( height: 25 ),

            LargeButton(
                texto: 'Análises gráficas',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
            ),


            const SizedBox( height: 25 ),

            LargeButton(
                texto: 'Carros Salvos',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/carrosSalvos');
                },
            ),


            const SizedBox( height: 25 ),

            LargeButton(
                texto: 'Documentos',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/documentos');
                },
            ),

            const SizedBox( height: 25 ),

            LargeButton(
                texto: 'Sobre',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/sobre');
                },
            ),
          ],
        ),
      ),
    );
  }
}