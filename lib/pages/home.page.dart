import 'package:flutter/material.dart';
import '../components/drawer.dart';
import '../components/largeButton.dart';
import '../components/pageTitle.dart';

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
        toolbarHeight: 80,
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

            const pageTitle(texto: 'Como podemos te ajudar?',),

            const SizedBox( height: 60 ),

            // LargeButton(
            //   texto: 'Estimar reivindicação',
            //   onPressed: () {
            //     Navigator.of(context).pushNamed('/estimar');
            //   },
            // ),

            // const SizedBox( height: 25 ),

            LargeButton(
              texto: 'Estimar reivindicação',
              onPressed: () {
                Navigator.of(context).pushNamed('/webapp');
              },
            ),

            const SizedBox( height: 25 ),

            LargeButton(
              texto: 'Mapa de sinistros',
              onPressed: () {
                Navigator.of(context).pushNamed('/mapa');
              },
            ),

            const SizedBox( height: 25 ),

            LargeButton(
              texto: 'Análises gráficas',
              onPressed: () {
                Navigator.of(context).pushNamed('/analise');
              },
            ),


            // const SizedBox( height: 25 ),

            // LargeButton(
            //   texto: 'Carros Salvos',
            //   onPressed: () {
            //     Navigator.of(context).pushNamed('/carrosSalvos');
            //   },
            // ),


            const SizedBox( height: 25 ),

            LargeButton(
              texto: 'Documentos',
              onPressed: () {
                Navigator.of(context).pushNamed('/documentos');
              },
            ),

            const SizedBox( height: 25 ),

            LargeButton(
              texto: 'Sobre',
              onPressed: () {
                Navigator.of(context).pushNamed('/sobre');
              },
            ),

            const SizedBox( height: 25 ),
          ],
        ),
      ),
    );
  }
}