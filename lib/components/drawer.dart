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
  String nome = '';
  String email = '';

  @override
  initState(){
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF2a5298),
                  ),
                currentAccountPicture: CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                ),
                accountName: Text(nome),
                accountEmail: Text(email),
            ),

            ListTile(
              dense: true,
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            ListTile(
              dense: true,
              title: const Text("Estimar reivindicação"),
              leading: const Icon(Icons.analytics),
              onTap: () {
                Navigator.of(context).pushNamed('/estimar');
              },
            ),
            ListTile(
              dense: true,
              title: const Text("Análises sobre seguros"),
              leading: const Icon(Icons.query_stats),
              onTap: () {
                Navigator.of(context).pushNamed('/analise');
              },
            ),
            ListTile(
              dense: true,
              title: const Text("Carros salvos"),
              leading: const Icon(Icons.stars),
              onTap: () {
                Navigator.of(context).pushNamed('/carrosSalvos');
              },
            ),
            ListTile(
              dense: true,
              title: const Text("Documentos necessários"),
              leading: const Icon(Icons.description),
              onTap: () {
                Navigator.of(context).pushNamed('/documentos');
              },
            ),
            ListTile(
              dense: true,
              title: const Text("Sobre"),
              leading: const Icon(Icons.help),
              onTap: () {
                Navigator.of(context).pushNamed('/sobre');
              },
            ),
            ListTile(
              dense: true,
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

  getUser() async{
    User? usuario = await _firebaseAuth.currentUser;
    if (usuario != null){
        setState(() {
          nome = usuario.displayName!;
          email = usuario.email!;
        });
    }
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