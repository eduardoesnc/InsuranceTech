import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/checagem.model.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,0),
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF2a5298),
                  ),
                currentAccountPicture: CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                ),
                accountName: Text('Nome usuario'),
                accountEmail: Text('Email usuario'),
            ),

            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            ListTile(
              title: const Text("Estimar reivindicação"),
              leading: const Icon(Icons.analytics),
              onTap: () {
                Navigator.of(context).pushNamed('/estimar');
              },
            ),
            ListTile(
              title: const Text("Análises sobre seguros"),
              leading: const Icon(Icons.query_stats),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            ListTile(
              title: const Text("Carros salvos"),
              leading: const Icon(Icons.stars),
              onTap: () {
                Navigator.of(context).pushNamed('/carrosSalvos');
              },
            ),
            ListTile(
              title: const Text("Documentos necessários"),
              leading: const Icon(Icons.description),
              onTap: () {
                Navigator.of(context).pushNamed('/documentos');
              },
            ),
            ListTile(
              title: const Text("Sobre"),
              leading: const Icon(Icons.help),
              onTap: () {
                Navigator.of(context).pushNamed('/sobre');
              },
            ),
            ListTile(
              title: const Text("Sair"),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                sair();
              },
            ),
          ],
        ),
      ),
    );
  }

  sair() async {
    await _firebaseAuth.signOut().then(
          (user) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ChecagemPage(),
        ),
      ),
    );
    Navigator.of(context).pushReplacementNamed('/');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Deslogado'),
        backgroundColor: Colors.grey,
      ),
    );
  }
}