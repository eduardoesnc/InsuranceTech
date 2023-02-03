import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,50,0,0),
        child: Column(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              title: const Text("Estimar reivindicação"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/estimar');
              },
            ),
            ListTile(
              title: const Text("Análises sobre seguros"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              title: const Text("Carros salvos"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/carrosSalvos');
              },
            ),
            ListTile(
              title: const Text("Documentos necessários"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/documentos');
              },
            ),
            ListTile(
              title: const Text("Sobre"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/sobre');
              },
            ),
          ],
        ),
      ),
    );
  }
}
