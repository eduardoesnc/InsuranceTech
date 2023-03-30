import 'package:cloud_firestore/cloud_firestore.dart';
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
  initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('usuários').doc(email).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final data = snapshot.data!.data() as Map<String, dynamic>;
                  final imageUrl = data['imageURL'] as String;

                  if (imageUrl != '') {
                    return UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color(0xFF2a5298),
                      ),
                      currentAccountPicture: CircleAvatar(
                          radius: 52,
                          backgroundImage: NetworkImage(imageUrl)
                      ),
                      accountName: Text(nome),
                      accountEmail: Text(email),
                    );
                  } else {
                    return UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color(0xFF2a5298),
                      ),
                      currentAccountPicture: const CircleAvatar(
                          radius: 52,
                          backgroundImage: AssetImage('assets/profile.jpeg')
                      ),
                      accountName: Text(nome),
                      accountEmail: Text(email),
                    );
                  }
                }),
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
                // Navigator.of(context).pushNamed('/estimar');
                Navigator.of(context).pushNamed('/webapp');
              },
            ),
            ListTile(
              dense: true,
              title: const Text("Mapa de sinistros"),
              leading: const Icon(Icons.place_rounded),
              onTap: () {
                Navigator.of(context).pushNamed('/mapa');
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
            // ListTile(
            //   dense: true,
            //   title: const Text("Carros salvos"),
            //   leading: const Icon(Icons.stars),
            //   onTap: () {
            //     Navigator.of(context).pushNamed('/carrosSalvos');
            //   },
            // ),
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
              title: const Text("Conta"),
              leading: const Icon(Icons.account_circle_outlined),
              onTap: () {
                Navigator.of(context).pushNamed('/editarPerfil');
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

  getUser() async {
    User? usuario = _firebaseAuth.currentUser;
    if (usuario != null) {
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
